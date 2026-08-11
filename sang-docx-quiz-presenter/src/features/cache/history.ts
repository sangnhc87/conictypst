import type { QuizDocument } from "../../models/quiz";

const DB_NAME = "conic-quiz-history";
const DB_VERSION = 1;
const STORE = "quizzes";

export interface HistoryEntry {
  id: string; // The quiz ID
  quiz: QuizDocument;
  title: string;
  savedAt: number;
}

function openDb(): Promise<IDBDatabase> {
  return new Promise((resolve, reject) => {
    const req = indexedDB.open(DB_NAME, DB_VERSION);
    req.onupgradeneeded = () => {
      const db = req.result;
      if (!db.objectStoreNames.contains(STORE)) {
        db.createObjectStore(STORE, { keyPath: "id" });
      }
    };
    req.onsuccess = () => resolve(req.result);
    req.onerror = () => reject(req.error);
  });
}

export async function saveToHistory(quiz: QuizDocument): Promise<void> {
  try {
    const db = await openDb();
    await new Promise<void>((resolve, reject) => {
      const tx = db.transaction(STORE, "readwrite");
      const entry: HistoryEntry = {
        id: quiz.id,
        quiz,
        title: quiz.title,
        savedAt: Date.now(),
      };
      tx.objectStore(STORE).put(entry);
      tx.oncomplete = () => resolve();
      tx.onerror = () => reject(tx.error);
    });
  } catch {
    // Ignore error so it doesn't block main UI
  }
}

export async function getHistory(): Promise<HistoryEntry[]> {
  try {
    const db = await openDb();
    return new Promise((resolve) => {
      const tx = db.transaction(STORE, "readonly");
      const req = tx.objectStore(STORE).getAll();
      req.onsuccess = () => {
        const entries = req.result as HistoryEntry[];
        // Sort descending by savedAt
        entries.sort((a, b) => b.savedAt - a.savedAt);
        resolve(entries);
      };
      req.onerror = () => resolve([]);
    });
  } catch {
    return [];
  }
}

export async function deleteFromHistory(id: string): Promise<void> {
  try {
    const db = await openDb();
    await new Promise<void>((resolve, reject) => {
      const tx = db.transaction(STORE, "readwrite");
      tx.objectStore(STORE).delete(id);
      tx.oncomplete = () => resolve();
      tx.onerror = () => reject(tx.error);
    });
  } catch {
    // Ignore
  }
}
