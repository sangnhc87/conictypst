const DB_NAME = 'conic-exam-offline-v1';
const DB_VERSION = 2;
const STORE = 'attempts';
const OWNER_INDEX = 'ownerUid';

function requiredIdentity(value, field) {
  const normalized = String(value || '').trim();
  if (!normalized) throw new TypeError(`${field} là bắt buộc cho bộ nhớ ngoại tuyến.`);
  return normalized;
}

export function offlineCacheKey(ownerUid, attemptId) {
  const owner = requiredIdentity(ownerUid, 'ownerUid');
  const attempt = requiredIdentity(attemptId, 'attemptId');
  return JSON.stringify([owner, attempt]);
}

export function isOfflineAttemptOwned(record, ownerUid, attemptId) {
  if (!record || typeof record !== 'object') return false;
  const owner = String(ownerUid || '');
  const attempt = String(attemptId || '');
  if (!owner || !attempt) return false;
  if (record.cacheKey !== offlineCacheKey(owner, attempt)
    || record.ownerUid !== owner
    || record.studentUid !== owner
    || record.attemptId !== attempt) return false;
  if (!record.snapshot) return true;
  const snapshotAttempt = record.snapshot.attempt;
  return snapshotAttempt?.studentUid === owner
    && String(snapshotAttempt?.id || record.snapshot.attemptId || '') === attempt;
}

export function isRecoverableOfflineError(error, online = globalThis.navigator?.onLine) {
  const code = String(error?.code || '').replace(/^functions\//u, '').replace(/^auth\//u, '');
  if (['permission-denied', 'unauthenticated', 'not-found'].includes(code)) return false;
  if (online === false) return true;
  return ['unavailable', 'network-request-failed', 'deadline-exceeded'].includes(code);
}

function openDatabase() {
  return new Promise((resolve, reject) => {
    if (!('indexedDB' in globalThis)) return resolve(null);
    const request = indexedDB.open(DB_NAME, DB_VERSION);
    request.onupgradeneeded = () => {
      const database = request.result;
      // Version 1 used attemptId as a global key. Delete it instead of migrating
      // potentially sensitive snapshots whose owner cannot be proven.
      if (database.objectStoreNames.contains(STORE)) database.deleteObjectStore(STORE);
      const store = database.createObjectStore(STORE, { keyPath: 'cacheKey' });
      store.createIndex(OWNER_INDEX, OWNER_INDEX, { unique: false });
    };
    request.onsuccess = () => resolve(request.result);
    request.onerror = () => reject(request.error);
  });
}

async function withStore(mode, operation) {
  const database = await openDatabase();
  if (!database) return null;
  return new Promise((resolve, reject) => {
    const transaction = database.transaction(STORE, mode);
    const store = transaction.objectStore(STORE);
    let request;
    try {
      request = operation(store);
    } catch (error) {
      database.close();
      reject(error);
      return;
    }
    request.onsuccess = () => resolve(request.result ?? null);
    request.onerror = () => reject(request.error);
    transaction.oncomplete = () => database.close();
    transaction.onerror = () => reject(transaction.error);
    transaction.onabort = () => reject(transaction.error);
  });
}

export async function loadOfflineAttempt(ownerUid, attemptId) {
  try {
    const key = offlineCacheKey(ownerUid, attemptId);
    const record = await withStore('readonly', (store) => store.get(key));
    if (!isOfflineAttemptOwned(record, ownerUid, attemptId)) {
      if (record) await withStore('readwrite', (store) => store.delete(key));
      return null;
    }
    return record;
  } catch {
    return null;
  }
}

export async function saveOfflineAttempt(attempt) {
  try {
    const ownerUid = requiredIdentity(attempt?.ownerUid, 'ownerUid');
    const studentUid = requiredIdentity(attempt?.studentUid, 'studentUid');
    const attemptId = requiredIdentity(attempt?.attemptId, 'attemptId');
    if (ownerUid !== studentUid) return false;
    if (attempt.snapshot?.attempt?.studentUid !== undefined
      && attempt.snapshot.attempt.studentUid !== ownerUid) return false;
    if (attempt.snapshot && String(attempt.snapshot.attempt?.id || attempt.snapshot.attemptId || '') !== attemptId) return false;
    const cacheKey = offlineCacheKey(ownerUid, attemptId);
    const database = await openDatabase();
    if (!database) return false;
    await new Promise((resolve, reject) => {
      const transaction = database.transaction(STORE, 'readwrite');
      const store = transaction.objectStore(STORE);
      const current = store.get(cacheKey);
      current.onsuccess = () => {
        const previous = isOfflineAttemptOwned(current.result, ownerUid, attemptId) ? current.result : {};
        store.put({
          ...previous,
          ...attempt,
          cacheKey,
          ownerUid,
          studentUid,
          attemptId,
          savedAt: Date.now(),
        });
      };
      current.onerror = () => reject(current.error);
      transaction.oncomplete = resolve;
      transaction.onerror = () => reject(transaction.error);
      transaction.onabort = () => reject(transaction.error);
    });
    database.close();
    return true;
  } catch {
    // The server remains authoritative; failure to cache locally must not block answering.
    return false;
  }
}

export async function clearOfflineAttempt(ownerUid, attemptId) {
  try {
    await withStore('readwrite', (store) => store.delete(offlineCacheKey(ownerUid, attemptId)));
  } catch {
    // Best effort only.
  }
}

export async function clearOfflineUser(ownerUid) {
  try {
    const owner = requiredIdentity(ownerUid, 'ownerUid');
    const database = await openDatabase();
    if (!database) return;
    await new Promise((resolve, reject) => {
      const transaction = database.transaction(STORE, 'readwrite');
      const index = transaction.objectStore(STORE).index(OWNER_INDEX);
      const request = index.openKeyCursor(IDBKeyRange.only(owner));
      request.onsuccess = () => {
        const cursor = request.result;
        if (!cursor) return;
        transaction.objectStore(STORE).delete(cursor.primaryKey);
        cursor.continue();
      };
      request.onerror = () => reject(request.error);
      transaction.oncomplete = resolve;
      transaction.onerror = () => reject(transaction.error);
      transaction.onabort = () => reject(transaction.error);
    });
    database.close();
  } catch {
    // Best effort only; cache keys and ownership checks still isolate accounts.
  }
}
