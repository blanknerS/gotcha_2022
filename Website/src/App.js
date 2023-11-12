// import logo from "./logo.svg";
// import { useEffect, useState } from "react";
import { auth, googleProvider } from "./config/firebase";
import { onAuthStateChanged } from "firebase/auth";
// import {
//   addTestUser,
//   fetchUserDoc,
//   submitLastWords,
//   tagSelfOut,
// } from "./config/utils";
// import { signInWithPopup, signOut } from "firebase/auth";

import React from "react";
import { Routes, Route, Navigate } from "react-router-dom";
import LoginPage from "./Pages/LoginPage";
import HomePage from "./Pages/HomePage";
import Navbar from "./Components/Navbar";
import Sidebar from "./Components/Sidebar"
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import "./App.css";

function App() {
  const navigate = useNavigate();
  const [user, setUser] = useState(null);

  useEffect(() => {
    const unsubscribe = onAuthStateChanged(auth, (authUser) => {
      if (authUser) {
        setUser(authUser);
      } else {
        setUser(null);
      }
    });
    return unsubscribe;
  }, []);


  return (
    <div className="App">
      <Navbar />

      <Routes>
        {user ? (
          <Route path="/*" element={<HomePage />} />
        ) : (
          <Route path="/*" element={<Navigate to="/login" />} />
        )}

        <Route path="/login" element={<LoginPage />} />
      </Routes>
    </div>
  );
}

export default App;
