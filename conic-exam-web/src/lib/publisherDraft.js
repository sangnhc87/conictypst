const DB_NAME = 'conic-exam-publisher-v1';
const STORE = 'drafts';

function openDatabase() {
  return new Promise((resolve, reject) => {
    if (!('indexedDB' in globalThis)) return resolve(null);
    const request = indexedDB.open(DB_NAME, 1);
    request.onupgradeneeded = () => request.result.createObjectStore(STORE, { keyPath: 'ownerUid' });
    request.onsuccess = () => resolve(request.result);
    request.onerror = () => reject(request.error);
  });
}

async function run(mode, operation) {
  const database = await openDatabase();
  if (!database) return null;
  return new Promise((resolve, reject) => {
    const transaction = database.transaction(STORE, mode);
    const request = operation(transaction.objectStore(STORE));
    request.onsuccess = () => resolve(request.result || null);
    request.onerror = () => reject(request.error);
    transaction.oncomplete = () => database.close();
  });
}

export function loadPublisherDraft(ownerUid) {
  if (!ownerUid) return Promise.resolve(null);
  return run('readonly', store => store.get(ownerUid));
}

export function savePublisherDraft(ownerUid, draft) {
  if (!ownerUid || !draft?.payload) return Promise.resolve(null);
  return run('readwrite', store => store.put({ ownerUid, ...draft, savedAt: Date.now() }));
}

export function clearPublisherDraft(ownerUid) {
  if (!ownerUid) return Promise.resolve(null);
  return run('readwrite', store => store.delete(ownerUid));
}
