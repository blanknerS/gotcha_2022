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
  apiKey: "AIzaSyDJcTBXZZcw1hpWAyith3HtPBZRAx7vkvE",
  authDomain: "gotcha-b4b13.firebaseapp.com",
  databaseURL: "https://gotcha-b4b13-default-rtdb.firebaseio.com",
  projectId: "gotcha-b4b13",
  storageBucket: "gotcha-b4b13.appspot.com",
  messagingSenderId: "628191290317",
  appId: "1:628191290317:web:630903a8d98f8cc19e9a84",
  measurementId: "G-LG5MKGL41Y",
};
// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
console.log(analytics);

export const auth = getAuth(app);
export const googleProvider = new GoogleAuthProvider();
googleProvider.setCustomParameters({ prompt: "select_account" });
export const db = getFirestore(app);
export const storage = getStorage(app);
