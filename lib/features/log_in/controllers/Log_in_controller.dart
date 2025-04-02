import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
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
}
