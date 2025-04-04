import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSearchController extends GetxController {
  final RxBool showClearIcon = false.obs;
  final TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    textController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    showClearIcon.value = textController.text.isNotEmpty;
    print(textController.text.isNotEmpty);
  }

  void clearText() {
    textController.clear();
    showClearIcon.value = false;
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
