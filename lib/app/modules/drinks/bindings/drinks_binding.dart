import 'package:dio/dio.dart';
import 'package:drinks_everywhere/app/data/rest_client.dart';
import 'package:drinks_everywhere/app/modules/drinks/repository/drinks_repository.dart';
import 'package:get/get.dart';

import '../controllers/drinks_controller.dart';

class DrinksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrinksRepository>(
      () => DrinksRepository(RestClient(Dio())),
    );
    Get.lazyPut<DrinksController>(
      () => DrinksController(),
    );
  }
}
