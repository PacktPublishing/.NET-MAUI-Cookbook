using c6_OfflineDataSyncClient.Model;
using CommunityToolkit.Datasync.Client;
using CommunityToolkit.Datasync.Client.Offline;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c6_OfflineDataSyncClient
{
    public partial class MainViewModel : ObservableObject
    {
        [ObservableProperty]
        ConcurrentObservableCollection<TodoItem> items = [];

        [ObservableProperty]
        [NotifyCanExecuteChangedFor(nameof(AddTodoItemCommand))]
        string newItemText = string.Empty;

        [ObservableProperty]
        bool outOfSync;

        [ObservableProperty]
        bool isRefreshing = true;

        [RelayCommand]
        async Task RefreshAsync()
        {
            IsRefreshing = true;
            using var context = new LocalAppDbContext();
            SetNonSyncedItems(context);
            Items = new ConcurrentObservableCollection<TodoItem>(context.TodoItems);
            try
            {
                await context.SynchronizeAsync();
                Items = new ConcurrentObservableCollection<TodoItem>(context.TodoItems);
                OutOfSync = false;
            }
            catch
            {
                OutOfSync = true;
            }
            IsRefreshing = false;
        }
        void SetNonSyncedItems(LocalAppDbContext context)
        {
            var queuedTodos = context.DatasyncOperationsQueue.Where(x => x.EntityType == typeof(TodoItem).FullName);
            foreach (var todoItem in queuedTodos)
            {
                var item = context.TodoItems.Find(todoItem.ItemId);
                item.InSync = false;
            }
        }

        [RelayCommand(CanExecute = nameof(CanAddTodoItem))]
        void AddTodoItem()
        {
            var newTodo = new TodoItem()
            {
                Title = NewItemText,
                InSync = false,
            };
            Items.Add(newTodo);
            NewItemText = string.Empty;
            SaveChangedItem(newTodo);
        }
        bool CanAddTodoItem() =>
            !string.IsNullOrEmpty(NewItemText);
        void SaveChangedItem(TodoItem newTodo)
        {
            Task.Run(async () =>
            {
                using var context = new LocalAppDbContext();
                context.TodoItems.Add(newTodo);
                context.SaveChanges();
                PushResult pushResult = await context.PushAsync();
                if (pushResult.IsSuccessful)
                {
                    UpdateCollectionItem(newTodo.Id);
                }
            });
        }
        void UpdateCollectionItem(string itemId)
        {
            using var context = new LocalAppDbContext();
            var freshItem = context.TodoItems.Find(itemId);
            Shell.Current.Dispatcher.Dispatch(() =>
            {
                Items.ReplaceIf(item => item.Id == itemId, freshItem);
            });
        }
    }
}
