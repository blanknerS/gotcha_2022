// import logo from "./logo.svg";
// import { useEffect, useState } from "react";
// import { auth, googleProvider } from "./config/firebase";
// import { onAuthStateChanged } from "firebase/auth";
// import {
//   addTestUser,
//   fetchUserDoc,
//   submitLastWords,
//   tagSelfOut,
// } from "./config/utils";
// import { signInWithPopup, signOut } from "firebase/auth";

import React from "react";
import { Routes, Route } from "react-router-dom";
import HomePage from "./Pages/HomePage";
import Navbar from "./Components/Navbar";
import "./App.css";

function App() {
  // const [user, setUser] = useState(null);
  // const [lastWords, setLastWords] = useState("");

  // useEffect(() => {
  //   const unsubscribe = onAuthStateChanged(auth, async (user) => {
  //     if (user) {
  //       const { userData } = await fetchUserDoc();

  //       setUser(userData);
  //     } else {
  //       setUser(null);
  //     }
  //   });
  // }, [auth.currentUser]);

  // const handleSubmit = (event) => {
  //   event.preventDefault();
  //   setLastWords("");
  //   submitLastWords(lastWords);
  // };

  // const signInWithGoogle = async () => {
  //   try {
  //     const res = await signInWithPopup(auth, googleProvider);
  //   } catch (error) {
  //     console.log(error);
  //   }
  // };

  // const handleSignOut = async () => {
  //   try {
  //     await signOut(auth);
  //   } catch (error) {
  //     console.log(error);
  //   }
  // };

  return (
    <div className="App">
      <Navbar/>
      <Routes>
        <Route path="*" element={<HomePage/>} />
      </Routes>
    </div>
  );
}

export default App;
