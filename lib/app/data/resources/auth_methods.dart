import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => auth.authStateChanges();

  User get user => auth.currentUser!;

  Future<bool> signInwithGoogle(BuildContext context) async {
    bool res = false;

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await auth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('user').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
        res = true;
      }
      // showSnakBar(Get.context!, "Login is successful");
      const SnackBar(
        content: Text("Login is successful"),
      );
    } on FirebaseAuthException catch (e) {
      SnackBar(content: Text("${e.message}"));
      res = false;
      debugPrint(e.toString());
    }
    return res;
  }
}
