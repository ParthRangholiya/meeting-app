import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/resources/auth_methods.dart';
import '../../../routes/app_pages.dart';

class SignupPageController extends GetxController {
  final AuthMethods authMethods = AuthMethods();
  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController remailController = TextEditingController();
  TextEditingController rpasswordController = TextEditingController();

  suficonsbutton() {
    passwordobscure = !passwordobscure;
  }

  final _passwordobscure = true.obs;
  bool get passwordobscure => _passwordobscure.value;
  set passwordobscure(bool value) => _passwordobscure.value = value;

  Future<void> register() async {
    try {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
      );

      final user = (await auth.createUserWithEmailAndPassword(
        email: remailController.text,
        password: rpasswordController.text,
      ))
          .user;

      Get.offAllNamed(
        Routes.HOME,
      );
      remailController.clear();
      rpasswordController.clear();
      Get.snackbar(
        "success",
        "Registration successful",
      );
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Error",
        "Please fill the details ",
      );
      debugPrint(e.toString());
    }
  }
}
