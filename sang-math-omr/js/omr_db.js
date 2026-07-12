const DB_NAME = 'omr_analytics_db';
const DB_VERSION = 2;

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
}

window.OMRDB = new OMRDatabase();
