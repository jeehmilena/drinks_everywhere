import 'package:drinks_everywhere/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/constants.dart';

class SplashController extends GetxController {
  Future<void> loginWithEmail() async {
    final storageEmail = GetStorage().read<String?>(EMAIL_KEY);
    final storagePassword = GetStorage().read<String?>(PASSWORD_KEY);

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: "$storageEmail", password: "$storagePassword")
        .then((response) {
      if (response.user != null) {
        Get.offAndToNamed(Routes.DRINKS);
      } else {
        Get.offAndToNamed(Routes.LOGIN);
      }
    }).catchError((onError) {
      Get.offAndToNamed(Routes.LOGIN);
    });
  }
}
