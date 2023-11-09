import React from "react";
import { useEffect, useState } from "react";
import { onAuthStateChanged } from "firebase/auth";
import { auth } from "../config/firebase";
import { fetchUserDocByEmail, tagOut } from "../config/utils";
import { Navigate, useNavigate } from "react-router-dom";
import "./HomePage.css";
import { signOut } from "firebase/auth";
import LoginPage from "./LoginPage";

function HomePage() {
  const navigate = useNavigate();
  const [user, setUser] = useState(null);
  const [target, setTarget] = useState(null);

  useEffect(() => {
    console.log("now", auth.currentUser);
    const unsubscribe = onAuthStateChanged(auth, async (authUser) => {
      if (authUser) {
        // console.log("HomePage:", authUser.email);
        const { userData } = await fetchUserDocByEmail(authUser.email);
        const targetData = await fetchUserDocByEmail(userData?.target);

        console.log("HomePage:", userData);

        setUser(userData);
        setTarget(targetData.userData);
      } else {

        navigate("/login");
      }
    });
  }, [auth.currentUser]);

  const handleSignOut = async () => {
    try {
      await signOut(auth);
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <div className="HomePage Page">
      <h1>Profile</h1>

      <div className="UserCard">
        <img className="photo" src={auth.currentUser?.photoURL} alt="" />
        <h2>
          {user?.firstName} {user?.lastName}
        </h2>
        <p>#10 on Leaderboard</p>
      </div>

      <div className="Cards">
        <div className="Card" onClick={() => tagOut(auth.currentUser.email)}>
          <h3 className="tagOut">Tag Out</h3>
        </div>

        <div className="Card">
          <h3>Tag Count</h3>
          <p className="number">{user?.tags}</p>
        </div>
      </div>

      <div className="Card">
        <h3>Target</h3>
        <p>
          {target?.firstName} {target?.lastName}
        </p>
      </div>
    </div>
  );
}

export default HomePage;
