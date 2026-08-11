export type RandomPolicy = 'one' | 'two' | 'fair' | 'always';

export type ClassroomRoster = {
  id: string;
  name: string;
  students: string[];
  policy: RandomPolicy;
  createdAt: number;
  updatedAt: number;
  dailyDate: string;
  dailyCounts: Record<string, number>;
};

const DB_NAME = 'conic-classroom-tools';
const DB_VERSION = 1;
const STORE_NAME = 'classrooms';
const memoryFallback = new Map<string, ClassroomRoster>();
let databasePromise: Promise<IDBDatabase | null> | null = null;

export function todayKey(date = new Date()) {
  const year = date.getFullYear();
  const month = `${date.getMonth() + 1}`.padStart(2, '0');
  const day = `${date.getDate()}`.padStart(2, '0');
  return `${year}-${month}-${day}`;
}

export function makeClassroomId() {
  if (typeof crypto !== 'undefined' && 'randomUUID' in crypto) return crypto.randomUUID();
  return `class-${Date.now()}-${Math.random().toString(36).slice(2, 9)}`;
}

export function withFreshDailyState(classroom: ClassroomRoster, date = todayKey()): ClassroomRoster {
  if (classroom.dailyDate === date) return classroom;
  return { ...classroom, dailyDate: date, dailyCounts: {} };
}

function openDatabase() {
  if (databasePromise) return databasePromise;
  if (typeof indexedDB === 'undefined') {
    databasePromise = Promise.resolve(null);
    return databasePromise;
  }
  databasePromise = new Promise<IDBDatabase | null>((resolve) => {
    try {
      const request = indexedDB.open(DB_NAME, DB_VERSION);
      request.onupgradeneeded = () => {
        if (!request.result.objectStoreNames.contains(STORE_NAME)) {
          request.result.createObjectStore(STORE_NAME, { keyPath: 'id' });
        }
      };
      request.onsuccess = () => resolve(request.result);
      request.onerror = () => resolve(null);
      request.onblocked = () => resolve(null);
    } catch {
      resolve(null);
    }
  });
  return databasePromise;
}

function requestResult<T>(request: IDBRequest<T>) {
  return new Promise<T>((resolve, reject) => {
    request.onsuccess = () => resolve(request.result);
    request.onerror = () => reject(request.error || new Error('IndexedDB request failed'));
  });
}

export async function listClassrooms() {
  const database = await openDatabase();
  if (!database) return [...memoryFallback.values()].sort((a, b) => a.name.localeCompare(b.name, 'vi'));
  try {
    const transaction = database.transaction(STORE_NAME, 'readonly');
    const classrooms = await requestResult(transaction.objectStore(STORE_NAME).getAll());
    return classrooms.sort((a, b) => a.name.localeCompare(b.name, 'vi'));
  } catch {
    return [...memoryFallback.values()].sort((a, b) => a.name.localeCompare(b.name, 'vi'));
  }
}

export async function saveClassroom(classroom: ClassroomRoster) {
  memoryFallback.set(classroom.id, classroom);
  const database = await openDatabase();
  if (!database) return classroom;
  try {
    const transaction = database.transaction(STORE_NAME, 'readwrite');
    await requestResult(transaction.objectStore(STORE_NAME).put(classroom));
  } catch {
    // The in-memory copy remains available for the current session if storage is blocked.
  }
  return classroom;
}

export async function removeClassroom(id: string) {
  memoryFallback.delete(id);
  const database = await openDatabase();
  if (!database) return;
  try {
    const transaction = database.transaction(STORE_NAME, 'readwrite');
    await requestResult(transaction.objectStore(STORE_NAME).delete(id));
  } catch {
    // Ignore storage errors: the UI can still remove the current in-memory copy.
  }
}
