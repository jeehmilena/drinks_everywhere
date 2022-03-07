import 'package:drinks_everywhere/app/modules/drinks/repository/drinks_repository.dart';
import 'package:drinks_everywhere/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DrinksController extends GetxController {
  final dynamic drinksResponse = {}.obs;
  final loading = false.obs;

  final DrinksRepository _repository = Get.find();

  final showDrink = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> exitToApp() async {
    await FirebaseAuth.instance.signOut();
    Get.toNamed(Routes.LOGIN);
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
