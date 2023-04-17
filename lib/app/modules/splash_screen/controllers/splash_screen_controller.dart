import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    wergoto();
    super.onReady();
  }

  void wergoto() {
    Timer(
      const Duration(seconds: 3),
      () {
        final User? user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          Get.offAllNamed(Routes.SIGNUP_PAGE);
        } else {
          Get.offAllNamed(Routes.HOME);
        }
      },
    );
  }
}
