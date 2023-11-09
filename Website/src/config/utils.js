// bryan sukidi

import { auth, db } from "./firebase";
import { doc, getDoc, setDoc } from "firebase/firestore";

// Fetch a user's document from the database by email (for chasers and targets)
export const fetchUserDocByEmail = async (email) => {

  try {
    const userRef = doc(db, "data", email);
    const userDoc = await getDoc(userRef);
    const userData = userDoc.data();
    return { userRef, userDoc, userData };
  } catch (error) {
    console.log(error);
  }
};

// add test user based off params (will remove)
export const addTestUser = async (
  firstName,
  lastName,
  email,
  year,
  livingStatus,
  chaser,
  target
) => {
  try {
    const userData = {
      firstName: firstName,
      lastName: lastName,
      class: year,
      "d/b": livingStatus,
      chaser: chaser,
      target: target,
      alive: true,
      tags: 0,
    };

    const userRef = doc(db, "data", email);
    await setDoc(userRef, userData);
  } catch (error) {
    alert(error.message);
  }
};

// Tag the current authenticated user out
export const tagOut = async (email) => {
  try {
    // Get the current user
    const user = await fetchUserDocByEmail(email);
    const userData = user.userData;
    

    // If the user is already out, return
    if (userData.alive === false) {
      alert("You are already out!");
      return;
    }

    // Get the user's chaser
    const chaser = await fetchUserDocByEmail(
      userData.chaser
    );
    const chaserData = chaser.userData;

    // Get the user's last words
    const lastWords = prompt("Please type in your last words:")


    // Update necessary fields
    userData.alive = false;
    chaserData.tags += 1;
    chaserData.target = userData.target;
    userData.lastWords = lastWords;
    // Post changes to database
    await setDoc(userRef, userData);
    await setDoc(chaserRef, chaserData);

  } catch (error) {
    alert(error.message);
    console.log(error);
  }
};

