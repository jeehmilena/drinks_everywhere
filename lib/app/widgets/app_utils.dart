import 'package:drinks_everywhere/app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showDefaultSnackBarError(error) async {
  Get.snackbar('', '',
      titleText: Container(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: errorColor,
      borderRadius: 8,
      colorText: Colors.white,
      icon: const Padding(
        padding: EdgeInsets.all(8),
        child: Icon(
          Icons.error,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        error,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16));
}
