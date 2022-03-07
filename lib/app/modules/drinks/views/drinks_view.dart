import 'package:drinks_everywhere/app/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/button_loading.dart';
import '../../../widgets/styles.dart';
import '../controllers/drinks_controller.dart';

class DrinksView extends GetView<DrinksController> {
  const DrinksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [_appBar(), _body(context)],
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: const Text('Drinks'),
      centerTitle: true,
      backgroundColor: const Color(0xffff314f),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
          onPressed: () {
            controller.exitToApp();
          },
        )
      ],
    );
  }

  Widget _body(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, bottom: 16, top: 32),
          child: SizedBox(
            height: Get.height,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _myDrink(),
                      const SizedBox(height: 48),
                      _buttonChooseMyDrink(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonChooseMyDrink(BuildContext context) {
    return Obx(() {
      return ButtonLoading(
        text: 'CHOOSE MY DRINK',
        loading: controller.loading.value,
        onPressed: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          controller.getDrinksRandom();
        },
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xff7ed321),
        ),
      );
    });
  }

  Widget _myDrink() {
    return Obx(() {
      if (controller.drinksResponse["drinks"] != null) {
        return Column(
          children: [
            loadImage(
                url: controller.drinksResponse["drinks"]?[0]
                        ?["strDrinkThumb"] ??
                    ''),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 16, top: 16),
              child: SizedBox(
                width: Get.width,
                child: Text(
                  '${controller.drinksResponse["drinks"]?[0]?["strDrink"] ?? ''}',
                  style: textTitleRegular,
                  textAlign: TextAlign.center,
                  textHeightBehavior:
                      const TextHeightBehavior(applyHeightToFirstAscent: false),
                ),
              ),
            ),
          ],
        );
      }
      return const SizedBox();
    });
  }
}
