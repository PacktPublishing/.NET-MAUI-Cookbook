using Microsoft.Extensions.Caching.Memory;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c4_LocalDatabaseConnection {
    public interface ICacheService {
        bool TryGetValue(object key, out object? result);
        TItem Set<TItem>(object key, TItem value);
        void ClearCollectionCache(string collectionKey);
        void AddPendingAction(CollectionCacheUpdate pendingAction);
        void ExecuteCacheUpdateActions();
        void ClearCacheUpdateActions();
    }

    public class MemoryCacheService : ICacheService {
        readonly MemoryCache Cache = new MemoryCache(new MemoryCacheOptions());
        readonly TimeSpan CacheDuration = TimeSpan.FromMinutes(15);
        readonly List<CollectionCacheUpdate> PendingCacheUpdateActions = new();
        public static MemoryCacheService Instance { get; } = new();
        public void ClearCollectionCache(string collectionKey) {
            Cache.Remove(collectionKey);
        }
        public TItem Set<TItem>(object key, TItem value) {
            return Cache.Set(key, value, CacheDuration);
        }
        public bool TryGetValue(object key, out object result) {
            return Cache.TryGetValue(key, out result);
        }
        public void AddPendingAction(CollectionCacheUpdate pendingAction) {
            PendingCacheUpdateActions.Add(pendingAction);
        }
        public void ExecuteCacheUpdateActions() {
            foreach (var ca in PendingCacheUpdateActions) {
                if (Cache.TryGetValue(ca.CollectionKey, out var cachedCollection))
                    ca.UpdateAction((IList)cachedCollection);
            }
            PendingCacheUpdateActions.Clear();
        }
        public void ClearCacheUpdateActions() {
            PendingCacheUpdateActions.Clear();
        }
    }
    public class CollectionCacheUpdate(string collectionName, Action<IList> updateAction) {
        public string CollectionKey { get; set; } = collectionName;
        public Action<IList> UpdateAction { get; set; } = updateAction;
    }
}
