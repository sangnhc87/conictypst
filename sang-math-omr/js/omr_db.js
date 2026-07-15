const DB_NAME = 'omr_analytics_db';
const DB_VERSION = 5;

class OMRDatabase {
    constructor() {
        this.db = null;
    }

    async init() {
        return new Promise((resolve, reject) => {
            const request = indexedDB.open(DB_NAME, DB_VERSION);
            
            request.onerror = (event) => reject("IndexedDB error: " + event.target.errorCode);
            
            request.onsuccess = (event) => {
                this.db = event.target.result;
                resolve(this.db);
            };

            request.onupgradeneeded = (event) => {
                const db = event.target.result;
                if (!db.objectStoreNames.contains('keyval')) {
                    db.createObjectStore('keyval');
                }
                if (!db.objectStoreNames.contains('classes')) {
                    db.createObjectStore('classes', { keyPath: 'id' });
                }
                if (!db.objectStoreNames.contains('results')) {
                    const results = db.createObjectStore('results', { keyPath: 'id' });
                    results.createIndex('timestamp', 'timestamp', { unique: false });
                    results.createIndex('sbd', 'sbd', { unique: false });
                }
                let outbox;
                if (!db.objectStoreNames.contains('sync_outbox')) {
                    outbox = db.createObjectStore('sync_outbox', { keyPath: 'id' });
                    outbox.createIndex('queuedAt', 'queuedAt', { unique: false });
                    outbox.createIndex('kind', 'kind', { unique: false });
                } else {
                    outbox = event.target.transaction.objectStore('sync_outbox');
                }
                if (!outbox.indexNames.contains('ownerUid')) outbox.createIndex('ownerUid', 'ownerUid', { unique: false });
                if (!db.objectStoreNames.contains('cloud_state')) {
                    db.createObjectStore('cloud_state', { keyPath: 'key' });
                }
            };
        });
    }

    async set(key, val) {
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('keyval', 'readwrite');
            tx.objectStore('keyval').put(val, key);
            tx.oncomplete = () => resolve();
            tx.onerror = () => reject(tx.error);
        });
    }

    async get(key) {
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('keyval', 'readonly');
            const req = tx.objectStore('keyval').get(key);
            req.onsuccess = () => resolve(req.result);
            req.onerror = () => reject(req.error);
        });
    }

    async saveClass(classData) {
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('classes', 'readwrite');
            tx.objectStore('classes').put(classData);
            tx.oncomplete = () => resolve();
            tx.onerror = () => reject(tx.error);
        });
    }

    async getAllClasses() {
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('classes', 'readonly');
            const req = tx.objectStore('classes').getAll();
            req.onsuccess = () => resolve(req.result);
            req.onerror = () => reject(req.error);
        });
    }

    async saveResult(result) {
        if (!result?.id) throw new Error('Kết quả chưa có mã lưu trữ.');
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('results', 'readwrite');
            tx.objectStore('results').put(result);
            tx.oncomplete = () => resolve();
            tx.onerror = () => reject(tx.error);
        });
    }

    async replaceResults(results) {
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('results', 'readwrite');
            const store = tx.objectStore('results');
            store.clear();
            results.forEach(result => {
                if (result?.id) store.put(result);
            });
            tx.oncomplete = () => resolve();
            tx.onerror = () => reject(tx.error);
        });
    }

    async getAllResults() {
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('results', 'readonly');
            const req = tx.objectStore('results').getAll();
            req.onsuccess = () => resolve(req.result || []);
            req.onerror = () => reject(req.error);
        });
    }

    async deleteResult(id) {
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('results', 'readwrite');
            tx.objectStore('results').delete(id);
            tx.oncomplete = () => resolve();
            tx.onerror = () => reject(tx.error);
        });
    }

    async clearResults() {
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('results', 'readwrite');
            tx.objectStore('results').clear();
            tx.oncomplete = () => resolve();
            tx.onerror = () => reject(tx.error);
        });
    }

    async queueSync(operation) {
        if (!operation?.id) throw new Error('Tác vụ đồng bộ chưa có mã.');
        if (!operation?.ownerUid) throw new Error('Tác vụ đồng bộ chưa gắn tài khoản Google.');
        if (!operation?.revision) throw new Error('Tác vụ đồng bộ chưa có phiên bản cục bộ.');
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('sync_outbox', 'readwrite');
            tx.objectStore('sync_outbox').put(operation);
            tx.oncomplete = () => resolve();
            tx.onerror = () => reject(tx.error);
        });
    }

    async getSyncQueue(ownerUid, includeDelayed = false) {
        if (!ownerUid) return [];
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('sync_outbox', 'readonly');
            const store = tx.objectStore('sync_outbox');
            const req = store.indexNames.contains('ownerUid')
                ? store.index('ownerUid').getAll(ownerUid)
                : store.getAll();
            req.onsuccess = () => {
                const now = Date.now();
                const items = (req.result || [])
                    .filter(item => item.ownerUid === ownerUid)
                    .filter(item => includeDelayed || !item.nextAttemptAt || item.nextAttemptAt <= now)
                    .sort((a, b) => (a.queuedAt || 0) - (b.queuedAt || 0));
                resolve(items);
            };
            req.onerror = () => reject(req.error);
        });
    }

    async deleteSyncOperation(id, expectedRevision = null) {
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('sync_outbox', 'readwrite');
            const store = tx.objectStore('sync_outbox');
            const req = store.get(id);
            let deleted = false;
            req.onsuccess = () => {
                const current = req.result;
                if (current && (!expectedRevision || current.revision === expectedRevision)) {
                    store.delete(id);
                    deleted = true;
                }
            };
            tx.oncomplete = () => resolve(deleted);
            tx.onerror = () => reject(tx.error);
        });
    }

    async markSyncFailure(id, expectedRevision, errorMessage) {
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('sync_outbox', 'readwrite');
            const store = tx.objectStore('sync_outbox');
            const req = store.get(id);
            let updated = false;
            req.onsuccess = () => {
                const current = req.result;
                if (!current || current.revision !== expectedRevision) return;
                const attempts = Math.min(20, (Number(current.attempts) || 0) + 1);
                const delay = Math.min(60 * 60 * 1000, 5000 * (2 ** Math.min(10, attempts - 1)));
                store.put({
                    ...current,
                    attempts,
                    lastError: String(errorMessage || 'Lỗi đồng bộ').slice(0, 500),
                    lastAttemptAt: Date.now(),
                    nextAttemptAt: Date.now() + delay
                });
                updated = true;
            };
            tx.oncomplete = () => resolve(updated);
            tx.onerror = () => reject(tx.error);
        });
    }

    async rebaseSyncOperation(id, staleRevision, baseSyncVersion) {
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('sync_outbox', 'readwrite');
            const store = tx.objectStore('sync_outbox');
            const req = store.get(id);
            let updated = false;
            req.onsuccess = () => {
                const current = req.result;
                if (!current || current.revision === staleRevision) return;
                const version = Math.max(0, Number(baseSyncVersion) || 0);
                const next = { ...current, baseSyncVersion: Math.max(Number(current.baseSyncVersion) || 0, version) };
                if (next.payload && typeof next.payload === 'object') {
                    next.payload = { ...next.payload, syncVersion: Math.max(Number(next.payload.syncVersion) || 0, version) };
                }
                store.put(next);
                updated = true;
            };
            tx.oncomplete = () => resolve(updated);
            tx.onerror = () => reject(tx.error);
        });
    }

    async setCloudState(key, value) {
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('cloud_state', 'readwrite');
            tx.objectStore('cloud_state').put({ key, value });
            tx.oncomplete = () => resolve();
            tx.onerror = () => reject(tx.error);
        });
    }

    async getCloudState(key) {
        if (!this.db) await this.init();
        return new Promise((resolve, reject) => {
            const tx = this.db.transaction('cloud_state', 'readonly');
            const req = tx.objectStore('cloud_state').get(key);
            req.onsuccess = () => resolve(req.result?.value);
            req.onerror = () => reject(req.error);
        });
    }
}

window.OMRDB = new OMRDatabase();
