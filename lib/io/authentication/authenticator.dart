
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authenticator {

  static late GoogleSignIn _googleSignIn;
  static User? user;

  static Future<void> init() async {
    _googleSignIn = GoogleSignIn();
    if(isLoggedIn()){
      user = FirebaseAuth.instance.currentUser as User;
    }
  }

  static bool isLoggedIn(){
    return FirebaseAuth.instance.currentUser != null;
  }

  static Future<bool> authenticate() async {
    await signOut();
    try {
      UserCredential credential = await signInWithGoogle();
      user = credential.user as User;
    } on FirebaseAuthException catch(e) {
      if (e.code == 'account-exists-with-different-credential') {
        debugPrint("already exists");
      } else if (e.code == 'invalid-credential') {
        debugPrint("invalid credential");
      }
    } catch (e) {
      debugPrint("unable to login");
    }
    return user != null;
  }

  static Future<void> signOut() async {
    try{
      await _googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
    } catch (e){
      debugPrint("cannot perform sign-in operation");
    }
  }

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}

