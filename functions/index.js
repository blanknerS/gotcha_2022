const functions = require("firebase-functions");

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.helloWorld = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from the Gotcha 2022 Team!");
});

exports.tagOut = functions.https.onRequest((request, response) => {
  functions.logger.info("Tag out logs!", {structuredData: true});
  response.send("Tagging out...");
});
