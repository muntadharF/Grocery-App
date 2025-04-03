import 'package:grocery_app/core/helpers/extensions_helper.dart';

class ValidationHelper {
  ValidationHelper._();
  static String? validateEmail(String? value) {
    if (value.isNullOrEmpty()) {
      return "Email cannot be empty";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value!)) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value.isNullOrEmpty()) {
      return "Password cannot be empty";
    }
    if (value!.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }
}
