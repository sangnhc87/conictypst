export type GameQuestion = {
  id: string;
  prompt: string;
  answers: [string, string, string, string];
  correct: number;
  explanation: string;
  image?: string;
  level: number;
};

export type GameProject = {
  version: 1;
  id: string;
  ownerEmail: string;
  name: string;
  subtitle: string;
  primary: string;
  accent: string;
  createdAt: string;
  updatedAt: string;
  questions: GameQuestion[];
};

const DB_NAME = "sang-math-games-v1";
const STORE_NAME = "projects";

function openGameDb() {
  return new Promise<IDBDatabase>((resolve, reject) => {
    const request = indexedDB.open(DB_NAME, 1);
    request.onupgradeneeded = () => {
      const db = request.result;
      if (!db.objectStoreNames.contains(STORE_NAME)) db.createObjectStore(STORE_NAME, { keyPath: "id" });
    };
    request.onsuccess = () => resolve(request.result);
    request.onerror = () => reject(request.error);
  });
}

export async function listGameProjects(ownerEmail: string) {
  const db = await openGameDb();
  return new Promise<GameProject[]>((resolve, reject) => {
    const transaction = db.transaction(STORE_NAME, "readonly");
    const request = transaction.objectStore(STORE_NAME).getAll();
    request.onsuccess = () => resolve((request.result as GameProject[])
      .filter((project) => project.ownerEmail === ownerEmail)
      .sort((a, b) => b.updatedAt.localeCompare(a.updatedAt)));
    request.onerror = () => reject(request.error);
    transaction.oncomplete = () => db.close();
  });
}

export async function saveGameProject(project: GameProject) {
  const db = await openGameDb();
  return new Promise<void>((resolve, reject) => {
    const transaction = db.transaction(STORE_NAME, "readwrite");
    transaction.objectStore(STORE_NAME).put(project);
    transaction.oncomplete = () => { db.close(); resolve(); };
    transaction.onerror = () => { db.close(); reject(transaction.error); };
  });
}

export async function deleteGameProject(id: string) {
  const db = await openGameDb();
  return new Promise<void>((resolve, reject) => {
    const transaction = db.transaction(STORE_NAME, "readwrite");
    transaction.objectStore(STORE_NAME).delete(id);
    transaction.oncomplete = () => { db.close(); resolve(); };
    transaction.onerror = () => { db.close(); reject(transaction.error); };
  });
}

const question = (level: number, prompt: string, answers: [string, string, string, string], correct: number, explanation: string): GameQuestion => ({
  id: crypto.randomUUID(), level, prompt, answers, correct, explanation,
});

export function createStarterProject(ownerEmail: string, name = "Triệu Phú Toán Học 12"): GameProject {
  const now = new Date().toISOString();
  return {
    version: 1,
    id: crypto.randomUUID(),
    ownerEmail,
    name,
    subtitle: "Chinh phục 15 nấc thang tri thức",
    primary: "#073b4c",
    accent: "#f0b429",
    createdAt: now,
    updatedAt: now,
    questions: [
      question(1, "Giá trị của $2^3 + 3^2$ bằng bao nhiêu?", ["$11$", "$15$", "$17$", "$19$"], 2, "$2^3 + 3^2 = 8 + 9 = 17$."),
      question(2, "Nghiệm của phương trình $x^2-5x+6=0$ là", ["$x=1,2$", "$x=2,3$", "$x=-2,-3$", "$x=1,6$"], 1, "Ta có $x^2-5x+6=(x-2)(x-3)$."),
      question(3, "Đạo hàm của hàm số $f(x)=x^3-2x$ là", ["$3x^2-2$", "$x^2-2$", "$3x-2$", "$3x^2$"], 0, "Áp dụng $(x^n)'=nx^{n-1}$."),
      question(4, "Cho $\\vec a=(1,2)$ và $\\vec b=(3,-1)$. Tích vô hướng $\\vec a\\cdot\\vec b$ bằng", ["$-1$", "$1$", "$3$", "$5$"], 1, "$1\\cdot3+2\\cdot(-1)=1$."),
      question(5, "Giá trị của tích phân $\\displaystyle \\int_0^1 2x\\,dx$ là", ["$0$", "$1$", "$2$", "$\\tfrac12$"], 1, "$\\int_0^1 2x\\,dx=x^2\\big|_0^1=1$."),
    ],
  };
}

