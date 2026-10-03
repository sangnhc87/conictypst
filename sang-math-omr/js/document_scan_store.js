(function () {
  'use strict';
  const NAME = 'sang-math-document-scan-v1';
  function open() {
    return new Promise((resolve, reject) => {
      const request = indexedDB.open(NAME, 1);
      request.onupgradeneeded = () => {
        const db = request.result;
        if (!db.objectStoreNames.contains('pages')) db.createObjectStore('pages', { keyPath: 'id' });
        if (!db.objectStoreNames.contains('handoff')) db.createObjectStore('handoff', { keyPath: 'key' });
      };
      request.onsuccess = () => resolve(request.result);
      request.onerror = () => reject(request.error);
    });
  }
  async function transaction(storeName, mode, action) {
    const db = await open();
    try {
      return await new Promise((resolve, reject) => {
        const transaction = db.transaction(storeName, mode);
        const request = action(transaction.objectStore(storeName));
        let result;
        request.onsuccess = () => { result = request.result; };
        request.onerror = () => reject(request.error);
        transaction.oncomplete = () => resolve(result);
        transaction.onerror = () => reject(transaction.error);
        transaction.onabort = () => reject(transaction.error);
      });
    } finally { db.close(); }
  }
  window.OmrDocumentScanStore = Object.freeze({
    listPages: () => transaction('pages', 'readonly', store => store.getAll()),
    savePage: page => transaction('pages', 'readwrite', store => store.put(page)),
    deletePage: id => transaction('pages', 'readwrite', store => store.delete(id)),
    clearPages: () => transaction('pages', 'readwrite', store => store.clear()),
    saveHandoff: (blob, filename) => transaction('handoff', 'readwrite', store =>
      store.put({ key: 'class-pdf', blob, filename, savedAt: Date.now() })),
    consumeHandoff: async () => {
      const item = await transaction('handoff', 'readonly', store => store.get('class-pdf'));
      if (item) await transaction('handoff', 'readwrite', store => store.delete('class-pdf'));
      return item || null;
    }
  });
})();
