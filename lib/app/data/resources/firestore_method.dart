import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreMethods {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory => firestore
      .collection("users")
      .doc(auth.currentUser!.uid)
      .collection("meeting")
      .snapshots();

  void addToMeetingHistoty(String meetingname) async {
    try {
      await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("meeting")
          .add(
        {
          "meeting": meetingname,
          "createdAt": DateTime.now(),
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
