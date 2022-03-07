import 'package:drinks_everywhere/app/modules/drinks/repository/drinks_repository.dart';
import 'package:get/get.dart';

class DrinksController extends GetxController {
  final dynamic drinksResponse = {}.obs;
  final loading = false.obs;

  final DrinksRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getDrinksRandom();
    super.onReady();
  }

  Future<void> getDrinksRandom() async {
    loading.value = true;
    _repository.getRandomDrinks().then((response) {
      drinksResponse.value = response;
      print(drinksResponse.value);
    }).catchError((error) {
      print(error);
    }).whenComplete(() {
      loading.value = false;
    });
  }
}
