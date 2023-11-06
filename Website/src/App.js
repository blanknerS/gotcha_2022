import logo from "./logo.svg";
import { useEffect, useState } from "react";
import { auth, googleProvider } from "./config/firebase";
import { onAuthStateChanged } from "firebase/auth";
import {
  addTestUser,
  fetchUserDoc,
  submitLastWords,
  tagSelfOut,
} from "./config/utils";
import { signInWithPopup, signOut } from "firebase/auth";

import "./App.css";

function App() {
  const [user, setUser] = useState(null);
  const [lastWords, setLastWords] = useState("");

  useEffect(() => {
    const unsubscribe = onAuthStateChanged(auth, async (user) => {
      if (user) {
        const { userData } = await fetchUserDoc();

        setUser(userData);
      } else {
        setUser(null);
      }
    });
  }, [auth.currentUser]);

  const handleSubmit = (event) => {
    event.preventDefault();
    setLastWords("");
    submitLastWords(lastWords);
  };

  const signInWithGoogle = async () => {
    try {
      const res = await signInWithPopup(auth, googleProvider);
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
    <div className="App">
      <header className="App-header">
        <h1>Gotcha</h1>
        <button onClick={signInWithGoogle}>Sign in with Google</button>
        <button
          onClick={() =>
            addTestUser(
              "Bryan",
              "Sukidi",
              "bryan_sukidi24@milton.edu",
              "senior",
              "Boarder",
              "benjamin_rhodes-kropf24@milton.edu",
              "katherine_risden24@milton.edu"
            )
          }
        >
          Test User Add
        </button>
        <button onClick={tagSelfOut}>Tag Self Out</button>
        <button onClick={handleSignOut}>Sign Out</button>
        <form
          onSubmit={() => {
            submitLastWords();
          }}
        >
          <label>Input your last words</label>
          <input
            type="text"
            value={lastWords}
            onChange={(e) => setLastWords(e.target.value)}
          />
          <button type="submit">Submit</button>
        </form>

        <button onClick={() => console.log(user)}>print user</button>

        <p>{user?.firstName}</p>
        <p>{user?.lastName}</p>
      </header>
    </div>
  );
}

export default App;
