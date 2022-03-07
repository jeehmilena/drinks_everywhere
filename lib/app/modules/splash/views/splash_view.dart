import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants.dart';
import '../../../widgets/styles.dart';
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
      backgroundColor: const Color(0xffff314f),
      body: SafeArea(
        child: Column(
          children: [_logo(), _title(context)],
        ),
      ),
    );
  }

  Widget _logo() {
    return Hero(
      tag: 'logo',
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Image.asset(
          primaryLogo,
          height: 100,
          width: 100,
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 16, top: 32),
      child: SizedBox(
        width: Get.width,
        child: Text(
          'Drinks Everywhere - Choose My Drink',
          style: textTitleRegularWhite,
          textAlign: TextAlign.center,
          textHeightBehavior:
              const TextHeightBehavior(applyHeightToFirstAscent: false),
        ),
      ),
    );
  }
}
