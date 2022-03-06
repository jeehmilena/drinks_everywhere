import 'package:drinks_everywhere/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 89, 42),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.LOGIN);
          },
          child: Image.asset(
            'assets/images/drink_icon.png',
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
