import { getApp, getApps, initializeApp } from "firebase/app";
import {
  browserLocalPersistence,
  getAuth,
  GoogleAuthProvider,
  onAuthStateChanged,
  setPersistence,
  signInWithPopup,
  signInWithRedirect,
  signOut,
  type User,
} from "firebase/auth";

const firebaseConfig = {
  apiKey: "AIzaSyDwbd6q4EHUp_JouOD5K1a96yNxq_RTTfc",
  authDomain: "conicgv.firebaseapp.com",
  projectId: "conicgv",
  storageBucket: "conicgv.firebasestorage.app",
  messagingSenderId: "777103975965",
  appId: "1:777103975965:web:00f564c7f00de09698c8f4",
};

const app = getApps().some((candidate) => candidate.name === "sang-math-games")
  ? getApp("sang-math-games")
  : initializeApp(firebaseConfig, "sang-math-games");

export const gameAuth = getAuth(app);
void setPersistence(gameAuth, browserLocalPersistence);

export function listenGameUser(callback: (user: User | null) => void) {
  return onAuthStateChanged(gameAuth, callback);
}

export async function signInGameUser() {
  const provider = new GoogleAuthProvider();
  provider.setCustomParameters({ prompt: "select_account", hd: "gmail.com" });
  try {
    return await signInWithPopup(gameAuth, provider);
  } catch (error) {
    const code = (error as { code?: string })?.code;
    if (code === "auth/popup-blocked" || code === "auth/operation-not-supported-in-this-environment") {
      await signInWithRedirect(gameAuth, provider);
      return null;
    }
    throw error;
  }
}

export function signOutGameUser() {
  return signOut(gameAuth);
}

