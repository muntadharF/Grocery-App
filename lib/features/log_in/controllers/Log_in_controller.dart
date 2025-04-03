// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helpers/validation_helper.dart';

class LogInController extends GetxController {
  RxBool isLoggedIn = false.obs;
  RxBool isObscureText = true.obs;
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void toggleObscureText() {
    isObscureText.value = !isObscureText.value;
  }

  String? validateEmail(String? value) {
    return ValidationHelper.validateEmail(value);
  }

  String? validatePassword(String? value) {
    return ValidationHelper.validatePassword(value);
  }

  Future<void> logIn() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = false;
    }
  }
}
