import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  validatePassword(String? pwd) {
    if (GetUtils.isNullOrBlank(pwd) == null) {
      return "Password is not valid";
    }
    return null;
  }

  validateEmail(String? email) {
    if (!GetUtils.isEmail(email ?? '')) {
      return "Email is not valid";
    }
    return null;
  }

  Future onLogin() async {
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        'Success',
        'Login successful',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    Get.snackbar(
      'Error',
      "Login validation failed",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
