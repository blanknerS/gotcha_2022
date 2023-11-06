// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getAuth, GoogleAuthProvider } from "firebase/auth";
import { getFirestore } from "firebase/firestore";
import { getStorage } from "firebase/storage";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDklOnWgflexDHWGynGX8aI5s5y5LM8qkw",
  authDomain: "milton-academy-gotcha.firebaseapp.com",
  databaseURL: "https://milton-academy-gotcha-default-rtdb.firebaseio.com",
  projectId: "milton-academy-gotcha",
  storageBucket: "milton-academy-gotcha.appspot.com",
  messagingSenderId: "926744591444",
  appId: "1:926744591444:web:ec7112fe65f5f9e5cc81c1",
  measurementId: "G-2V1YQSKPB1",
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

export const auth = getAuth(app);
export const googleProvider = new GoogleAuthProvider();
googleProvider.setCustomParameters({ prompt: "select_account" });
export const db = getFirestore(app);
export const storage = getStorage(app);


