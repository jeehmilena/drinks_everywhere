import 'package:drinks_everywhere/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_utils.dart';

class LoginController extends GetxController {
  final loading = false.obs;
  final emailValidation = false.obs;
  final emailError = ''.obs;
  final passwordError = ''.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginWithEmail(String email, String password) async {
    if (email.isEmpty) {
      emailError.value = 'Can not be empty';
      return;
    }

    if (!email.isEmail) {
      emailError.value = 'Must be a valid email address';
      return;
    }

    if (password.isEmpty) {
      passwordError.value = 'Can not be empty';
      return;
    }

    loading.value = true;

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((response) {
      if (response.user != null) {
        Get.offAndToNamed(Routes.DRINKS);
      } else {
        Get.toNamed(Routes.REGISTER);
      }
    }).catchError((onError) {
      print(onError);
      showDefaultSnackBarError(
          "Oops, email or password invalid! Try again or register.");
    }).whenComplete(() {
      loading.value = false;
    });
  }
}
