/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
const functions = require('firebase-functions');
const admin = require('firebase-admin');
const sgMail = require('@sendgrid/mail');

admin.initializeApp();
sgMail.setApiKey('YOUR_SENDGRID_API_KEY');

exports.sendEmail = functions.https.onRequest((req, res) => {
  const { name, email, message } = req.body;

  const msg = {
    to: 'ritesh.kumar.07.20@gmail.com', // Your email
    from: email, // User's email
    subject: `New message from ${name}`,
    text: message,
  };

  sgMail
    .send(msg)
    .then(() => {
      return res.status(200).send('Email sent successfully');
    })
    .catch((error) => {
      console.error(error.toString());
      return res.status(500).send(error.toString());
    });
});
