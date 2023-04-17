import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/resources/auth_methods.dart';
import '../../../routes/app_pages.dart';

class LoginPageController extends GetxController {
  final AuthMethods authMethods = AuthMethods();
  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  suficonsbutton() {
    passwordobscure = !passwordobscure;
  }

  final _passwordobscure = true.obs;
  bool get passwordobscure => _passwordobscure.value;
  set passwordobscure(bool value) => _passwordobscure.value = value;

  Future<void> signIn() async {
    try {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
        // barrierDismissible: false,
      );
      final user = (await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;

      Get.snackbar(
        "success",
        "Your accoun is Login successful",
      );
      emailController.clear();
      passwordController.clear();

      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Error",
        "Please your email & password chek",
      );
      debugPrint(e.toString());
    }
  }
}
