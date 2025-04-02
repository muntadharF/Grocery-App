import 'package:flutter/material.dart';

import '../../../core/app_constants/app_colors.dart';
import '../../../core/app_constants/app_strings.dart';
import '../../../core/app_constants/app_text_styles.dart';

class ForgotPasswordBtn extends StatelessWidget {
  const ForgotPasswordBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        splashColor: AppColors.primaryColor.withValues(alpha: 0.3),
        onTap: () {},
        child: Text(
          AppStrings.logInForgotPassword,
          style: ApptTextStyles.font12GreyMedium.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
