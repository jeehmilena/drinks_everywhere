import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/app_utils.dart';

class RegisterController extends GetxController {
  final name = ''.obs;
  final nameValidation = false.obs;
  final nameError = ''.obs;
  final email = ''.obs;
  final emailValidation = false.obs;
  final emailError = ''.obs;
  final password = ''.obs;
  final passwordError = ''.obs;
  final passwordConfirm = ''.obs;
  final passwordConfirmError = ''.obs;
  final loading = false.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  Future<void> registerWithEmail(String name, String email, String password,
      String passwordConfirm) async {
    if (email.isEmpty) {
      emailError.value = "Can not be empty";
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

    if (password.length < 8) {
      passwordError.value = 'Must be at last 8 character';
      return;
    }

    if (passwordConfirm.isEmpty) {
      passwordConfirmError.value = 'Can not be empty';
      return;
    }

    if (password != passwordConfirm) {
      passwordConfirmError.value = "Passwords don't match";
      return;
    }

    loading.value = true;

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((response) {
      if (response.user != null) {
        Get.offAndToNamed(Routes.DRINKS);
      } else {
        Get.toNamed(Routes.REGISTER);
      }
    }).catchError((onError) {
      print(onError);
      showDefaultSnackBarError("Oops, something is wrong. Try again!");
    }).whenComplete(() {
      loading.value = false;
    });
  }
}
