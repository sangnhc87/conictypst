/**
 * fileCache.ts — IndexedDB cache cho kết quả OCR
 * Key: SHA-256 của file bytes + mode + settings → 7 ngày TTL
 */
import type { QuizDocument } from "../../models/quiz";

const DB_NAME = "conic-ocr-cache";
const DB_VERSION = 1;
const STORE = "results";
const TTL_MS = 7 * 24 * 60 * 60 * 1000; // 7 ngày

interface CachedEntry {
  hash: string;
  quiz: QuizDocument;
  provider: string;
  pageCount: number;
  estimatedOcrUsd: number;
  savedAt: number;
}

// SHA-256 của file bytes
export async function hashFile(file: File): Promise<string> {
  const buffer = await file.arrayBuffer();
  const digest = await crypto.subtle.digest("SHA-256", buffer);
  return Array.from(new Uint8Array(digest))
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");
}

// Tạo cache key gồm hash + mode + profile/prompt version + generateSolutions.
// Tham số profile để cuối và có mặc định nhằm giữ tương thích với nơi gọi cũ.
export function cacheKey(hash: string, mode: string, generateSolutions: boolean, profileKey = "math-thpt-v1@1.0.0:12"): string {
  return `${hash}_${mode}_${profileKey}_${generateSolutions ? "sol" : "nosol"}`;
}

function openDb(): Promise<IDBDatabase> {
  return new Promise((resolve, reject) => {
    const req = indexedDB.open(DB_NAME, DB_VERSION);
    req.onupgradeneeded = () => {
      const db = req.result;
      if (!db.objectStoreNames.contains(STORE)) {
        db.createObjectStore(STORE, { keyPath: "hash" });
      }
    };
    req.onsuccess = () => resolve(req.result);
    req.onerror = () => reject(req.error);
  });
}

export async function getCached(key: string): Promise<CachedEntry | null> {
  try {
    const db = await openDb();
    return new Promise((resolve) => {
      const tx = db.transaction(STORE, "readonly");
      const req = tx.objectStore(STORE).get(key);
      req.onsuccess = () => {
        const entry = req.result as CachedEntry | undefined;
        if (!entry) { resolve(null); return; }
        if (Date.now() - entry.savedAt > TTL_MS) {
          const delTx = db.transaction(STORE, "readwrite");
          delTx.objectStore(STORE).delete(key);
          resolve(null);
          return;
        }
        resolve(entry);
      };
      req.onerror = () => resolve(null);
    });
  } catch {
    return null;
  }
}

export async function setCached(key: string, entry: Omit<CachedEntry, "savedAt">): Promise<void> {
  try {
    const db = await openDb();
    await new Promise<void>((resolve, reject) => {
      const tx = db.transaction(STORE, "readwrite");
      tx.objectStore(STORE).put({ ...entry, hash: key, savedAt: Date.now() });
      tx.oncomplete = () => resolve();
      tx.onerror = () => reject(tx.error);
    });
  } catch {
    // Cache write failure không block luồng chính
  }
}

export async function clearCache(): Promise<void> {
  try {
    const db = await openDb();
    await new Promise<void>((resolve) => {
      const tx = db.transaction(STORE, "readwrite");
      tx.objectStore(STORE).clear();
      tx.oncomplete = () => resolve();
      tx.onerror = () => resolve();
    });
  } catch { /* ignore */ }
}

export async function cacheStats(): Promise<{ count: number; oldestDaysAgo: number }> {
  try {
    const db = await openDb();
    return new Promise((resolve) => {
      const tx = db.transaction(STORE, "readonly");
      const req = tx.objectStore(STORE).getAll();
      req.onsuccess = () => {
        const entries = req.result as CachedEntry[];
        const now = Date.now();
        const oldest = entries.reduce((min, e) => Math.min(min, e.savedAt), now);
        resolve({
          count: entries.length,
          oldestDaysAgo: Math.floor((now - oldest) / (24 * 60 * 60 * 1000)),
        });
      };
      req.onerror = () => resolve({ count: 0, oldestDaysAgo: 0 });
    });
  } catch {
    return { count: 0, oldestDaysAgo: 0 };
  }
}
