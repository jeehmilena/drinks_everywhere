import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/drink_detail_controller.dart';

class DrinkDetailView extends GetView<DrinkDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DrinkDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DrinkDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
