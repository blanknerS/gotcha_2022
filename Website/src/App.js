import logo from "./logo.svg";
import { useState } from "react";
import { auth, googleProvider } from "./config/firebase";
import { signInWithPopup } from "firebase/auth";

import "./App.css";

function App() {
   const [user, setUser] = useState(null);

    const signInWithGoogle = async () => {
      try {
        const res = await signInWithPopup(auth, googleProvider);
        const user = res.user;
        setUser(user);
      } catch (error) {
        console.log(error.message);
      }
    }


  return (
    <div className="App">
      <header className="App-header">
        <h1>Gotcha</h1>
        <button onClick={signInWithGoogle}>Sign in with Google</button>
      </header>

    </div>
  );
}

export default App;
