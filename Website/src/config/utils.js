// bryan sukidi

import { auth, db } from "./firebase";
import { doc, getDoc, setDoc } from "firebase/firestore";

// Fetch the authenticated user's document from the database
export const fetchUserDoc = async () => {
  try {

    // If firebase auth is not initialized, return
    if (!auth.currentUser) {
      return;
    }

    // Get the user's document from the database
    const userRef = doc(db, "data", auth.currentUser.email);
    const userDoc = await getDoc(userRef);
    const userData = userDoc.data();

    // Return ref, doc, and data 
    return { userRef, userDoc, userData };
  } catch (error) {
    console.log(error);
    return;
  }
};

// Fetch a user's document from the database by email (for chasers and targets)
export const fetchUserDocByEmail = async (email) => {
  try {
    const userRef = doc(db, "data", email);
    const userDoc = await getDoc(userRef);
    const userData = userDoc.data();
    return { userRef, userDoc, userData };
  } catch (error) {
    alert(error.message);
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
export const tagSelfOut = async () => {
  try {
    // Get the current user
    const { userRef, userData } = await fetchUserDoc();
  
    // If the user is already out, return
    if (userData.alive === false) {
      alert("You are already out!");
      return;
    }

    // Get the chaser 
    const { chaserRef, chaserData } = await fetchUserDocByEmail(
      userData.chaser
    );

    // Update necessary fields
    userData.alive = false;
    chaserData.tags += 1;
    chaserData.target = userData.target;

    // Post changes to database
    await setDoc(userRef, userData);
    await setDoc(chaserRef, chaserData);

  } catch (error) {
    alert(error.message);
    console.log(error);
  }
};

// Submit last words
export const submitLastWords = async (lastWords) => {
  try {
    const { userRef, userDoc, userData } = await fetchUserDoc();
    userData.lastWords = lastWords;
    await setDoc(userRef, userData);
  } catch (error) {
    alert(error.message);
    console.log(error);
  }
};
