import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signup_page_controller.dart';

class SignupPageView extends GetView<SignupPageController> {
  const SignupPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    "Create New Account",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: SizedBox(
                      height: 150,
                      child: Image.asset(
                        "assets/image/images.png",
                      ),
                    ),
                  ),
                  TextField(
                    controller: controller.remailController,
                    maxLines: 1,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      fillColor: secondarybackgroundColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Enter your Email",
                      contentPadding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => TextField(
                      controller: controller.rpasswordController,
                      obscureText: controller.passwordobscure,
                      maxLines: 1,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        fillColor: secondarybackgroundColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Enter your Password",
                        suffixIcon: GestureDetector(
                          onTap: controller.suficonsbutton,
                          child: SizedBox(
                            child: Icon(
                              controller.passwordobscure
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.register();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Sign up"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 1,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "or continue with",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 80,
                          height: 1,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () async {
                      bool res = await controller.authMethods
                          .signInwithGoogle(Get.context!);
                      if (res) {
                        Get.offAllNamed(Routes.HOME);
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    icon: Image.asset(
                      "assets/image/google_logo.png",
                      height: 25,
                      width: 25,
                    ),
                    label: const Text("Google Sign In"),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign in",
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(Routes.LOGIN_PAGE);
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
