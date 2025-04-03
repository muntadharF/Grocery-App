import 'package:flutter/material.dart';

import '../app_constants/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.isObscureText, this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.grey,
      obscureText: isObscureText ?? false,
      style: ApptTextStyles.font15BlackMedium,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: ApptTextStyles.font12GreyMedium,
        enabledBorder: _buildUnderlineBorder(),
        focusedBorder: _buildUnderlineBorder(),
      ),
      validator: validator,
    );
  }

  UnderlineInputBorder _buildUnderlineBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300),
    );
  }
}
