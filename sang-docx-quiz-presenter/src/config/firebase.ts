import { initializeApp } from "firebase/app";
import { getAuth, GoogleAuthProvider, signInWithPopup, signOut } from "firebase/auth";
import { getFirestore } from "firebase/firestore";

// Firebase config for stexgv project
const firebaseConfig = {
  apiKey: "AIzaSyDW1VicfdulIH8ttao2SHFDoOrbvmlT6G8",
  authDomain: "stexgv.firebaseapp.com",
  projectId: "stexgv",
  storageBucket: "stexgv.appspot.com",
  messagingSenderId: "919572748061",
  appId: "1:919572748061:web:989672f83657a3b6ed33f4",
  measurementId: "G-H179GSEEZ7"
};

const app = initializeApp(firebaseConfig);
export const auth = getAuth(app);
export const db = getFirestore(app);

const provider = new GoogleAuthProvider();
provider.setCustomParameters({ prompt: 'select_account' });

export const signInWithGoogle = () => signInWithPopup(auth, provider);
export const logout = () => signOut(auth);
