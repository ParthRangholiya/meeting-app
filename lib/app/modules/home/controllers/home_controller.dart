import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_clone/app/modules/meeting_screen/views/meeting_screen_view.dart';
import 'package:zoom_clone/app/data/resources/auth_methods.dart';

import '../../../routes/app_pages.dart';
import '../../meet_chat_screen/views/meet_chat_screen_view.dart';

class HomeController extends GetxController {
  final AuthMethods authMethods = AuthMethods();

  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) => _selectedIndex.value = value;

  RxList bottomchang = [
    const MeetChatScreenView(),
    const MeetingScreenView(),
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Get.offAllNamed(Routes.SIGNUP_PAGE);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: const Text("Log Out"),
      ),
    ),
  ].obs;
}
