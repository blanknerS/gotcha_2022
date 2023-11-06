// bryan sukidi

import { auth, db } from "./firebase";
import { doc, getDoc, setDoc } from "firebase/firestore";

export const tagSelfOut = async () => {

  // obtain firebase user and reference to the user document
  const user = auth.currentUser;
  const userRef = doc(db, "data", user.uid);

  // obtain user document from reference
  const userDoc = await getDoc(userRef);
  const userData = userDoc.data();

}
