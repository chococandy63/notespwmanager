// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import '../pages/home.dart';

//creating instances:
GoogleSignIn googleSignIn = GoogleSignIn();
FirebaseAuth auth = FirebaseAuth.instance;
CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<bool> signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
    
   //this wasnt in the video i created this to avoid the error
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

//firebase authentication:
    final UserCredential authResult =
        await auth.signInWithCredential(credential);

    //user returning from firebase authentication:this creates user in authentication panel:

    final User? user = authResult.user;
    //we need to store user's data: saving name of the user from google sign
    var userData = {
      'name': googleSignInAccount.displayName,
      'provider': 'google',
      'photoUrl': googleSignInAccount.photoUrl,
      'email': googleSignInAccount.email,
    };
    //if the user already exists(or created their acc on firebase)
    users.doc(user?.uid).get().then((doc) {
      if (doc.exists) {
        //old user
        doc.reference.update(userData);
      } else {
        //new user: fixed the user documentid
        users.doc(user?.uid).set(userData);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder:(context)=>const HomePage(),
          ),
        );
      }
    });
    }
  // ignore: non_constant_identifier_names
  } catch (PlatformException) {
    // ignore: avoid_print
    print(PlatformException);
    // ignore: avoid_print
    print("Sign in not sucessful!");
  }
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("yo login successful ;)")),);
  return true;
}
