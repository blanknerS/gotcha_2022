// bryan sukidi

import { auth, db } from "./firebase";
import {
  doc,
  getDoc,
  getDocs,
  setDoc,
  collection,
  addDoc,
  serverTimestamp,
} from "firebase/firestore";

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

const submitLastWords = async (email, fullName, lw) => {
  try {
    // create a new document in the "lastWords" collection
    const lastWordsRef = doc(collection(db, "lastWords"), email);
    await setDoc(lastWordsRef, {
      Author: fullName,
      Lw: lw,
      TimeStamp: serverTimestamp(),
    });
  } catch (error) {
    alert(error.message);
    console.log(error);
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
    const chaser = await fetchUserDocByEmail(userData.chaser);
    const chaserData = chaser.userData;

    // Get the user's last words
    let lastWords = prompt("Please type in your last words to tag out:");

    // Update necessary fields
    userData.alive = false;
    chaserData.tags += 1;
    chaserData.target = userData.target;

    if (lastWords === null || lastWords === undefined) {
      lastWords = "";
    }
    
    userData.lastWords = lastWords;
    // Post changes to database

    await setDoc(user.userRef, userData);
    await setDoc(chaser.userRef, chaserData);

    const fullName = userData.firstName + " " + userData.lastName;

    alert("Your last words:" + lastWords);
    await submitLastWords(email, fullName, lastWords);

    alert("You have been tagged out.");
  } catch (error) {
    alert(error.message);
    console.log(error);
  }
};

export const getLastWords = async () => {
  try {
    const querySnapshot = await getDocs(collection(db, "lastWords"));

    const allLastWords = [];
    querySnapshot.forEach((doc) => {
      allLastWords.push(doc.data());
    });

    allLastWords.sort((a, b) => b.TimeStamp.seconds - a.TimeStamp.seconds);

    return allLastWords;
  } catch (error) {
    console.log(error);
  }
};

export const getLeaderBoard = async () => {
  try {
  } catch (error) {
    console.log(error);
  }

  try {
    const querySnapshot = await getDocs(collection(db, "data"));
    querySnapshot.forEach((doc) => {
      console.log(`${doc.id} => ${doc.data()}`);
    });
  } catch (error) {
    console.log(error);
  }
};
