import 'package:flutter/material.dart';

import '../../../core/app_constants/app_colors.dart';
import '../../../core/app_constants/app_strings.dart';
import '../../../core/app_constants/app_text_styles.dart';

class TermsAndPolicy extends StatelessWidget {
  const TermsAndPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: AppStrings.signUpAgreeText,
        style: ApptTextStyles.font12GreyMedium.copyWith(height: 1.8),
        children: [
          TextSpan(
            text: AppStrings.signUpTermsText,
            style: ApptTextStyles.font12GreyMedium.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          TextSpan(text: AppStrings.signUpAndText),
          TextSpan(
            text: AppStrings.signUpPolicyText,
            style: ApptTextStyles.font12GreyMedium.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
