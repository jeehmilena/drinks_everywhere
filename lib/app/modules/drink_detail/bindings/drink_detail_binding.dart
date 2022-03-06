import 'package:get/get.dart';

import '../controllers/drink_detail_controller.dart';

class DrinkDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrinkDetailController>(
      () => DrinkDetailController(),
    );
  }
}
