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
        ConcurrentObservableCollection<Blog> items = [];

        [ObservableProperty]
        [NotifyCanExecuteChangedFor(nameof(AddBlogCommand))]
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
            Items = new ConcurrentObservableCollection<Blog>(context.Blogs);
            try
            {
                await context.SynchronizeAsync();
                Items = new ConcurrentObservableCollection<Blog>(context.Blogs);
                OutOfSync = false;
            }
            catch
            {
                OutOfSync = true;
            }
            finally
            {
                IsRefreshing = false;
            }
        }
        void SetNonSyncedItems(LocalAppDbContext context)
        {
            var queuedBlogs = context.DatasyncOperationsQueue.Where(x => x.EntityType == typeof(Blog).FullName);
            foreach (var blog in queuedBlogs)
            {
                if (blog.State != OperationState.Completed)
                {
                    var item = context.Blogs.Find(blog.ItemId);
                    item.InSync = false;
                }
            }
        }

        [RelayCommand(CanExecute = nameof(CanAddBlog))]
        void AddBlog()
        {
            var newBlog = new Blog()
            {
                Title = NewItemText,
                InSync = false,
            };
            Items.Add(newBlog);
            NewItemText = string.Empty;
            SaveChangedItem(newBlog);
        }
        bool CanAddBlog() =>
            !string.IsNullOrEmpty(NewItemText);
        void SaveChangedItem(Blog newBlog)
        {
            Task.Run(async () =>
            {
                using var context = new LocalAppDbContext();
                context.Blogs.Add(newBlog);
                context.SaveChanges();
                PushResult pushResult = await context.PushAsync();
                if (pushResult.IsSuccessful)
                {
                    UpdateCollectionItem(newBlog.Id);
                }
            });
        }
        void UpdateCollectionItem(string itemId)
        {
            using var context = new LocalAppDbContext();
            var freshItem = context.Blogs.Find(itemId);
            Shell.Current.Dispatcher.Dispatch(() =>
            {
                Items.ReplaceIf(item => item.Id == itemId, freshItem);
            });
        }
    }
}
