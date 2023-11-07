import React from "react";
import { signInWithPopup, signInWithRedirect, signOut } from "firebase/auth";
import { auth, googleProvider } from "../config/firebase";
import GoogleLogo from "../Assets/google-logo.png";
import GotchaLogo from "../Assets/gotcha-logo.png";
import "./Login.css";

function Login() {
  const signInWithGoogle = async () => {
    try {
      await signInWithRedirect(auth, googleProvider);
    } catch (error) {
      console.log(error);
    }
  };

  const handleSignOut = async () => {
    try {
      await signOut(auth);
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <div className="Login">
   
      <img
        className="google"
        src={GoogleLogo}
        onClick={signInWithGoogle}
        alt=""
        rel="noopener noreferrer"
      />


    </div>
  );
}

export default Login;
