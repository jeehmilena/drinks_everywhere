import 'package:drinks_everywhere/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/drinks_controller.dart';

class DrinksView extends GetView<DrinksController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DrinksView'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.DRINK_DETAIL);
        },
        child: Center(
          child: Obx(() {
            if (controller.loading.value) return CircularProgressIndicator();

            return Text(
              '${controller.drinksResponse["drinks"]?[0]?["strDrink"] ?? ''}',
              style: TextStyle(fontSize: 20),
            );
          }),
        ),
      ),
    );
  }
}
