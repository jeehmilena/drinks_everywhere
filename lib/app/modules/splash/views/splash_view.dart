import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashController controller = Get.find();

  @override
  void initState() {
    controller.loginWithEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 89, 42),
      body: Center(
        child: Image.asset(
          'assets/images/drink_icon.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
