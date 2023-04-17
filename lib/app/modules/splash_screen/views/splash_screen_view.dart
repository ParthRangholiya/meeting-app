import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('SplashScreenView'),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset(
                "assets/image/onboarding.jpg",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SpinKitCircle(
              color: Colors.grey,
              size: 60,
            ),
          ],
        ),
      ),
    );
  }
}
