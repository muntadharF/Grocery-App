import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_constants/app_assets.dart';
import '../../../core/app_constants/app_colors.dart';
import '../../../core/app_constants/app_strings.dart';
import '../../../core/app_constants/app_text_styles.dart';
import '../../../core/helpers/spacing_helper.dart';
import '../../../core/routing/app_screens.dart';
import '../../../core/shared/app_colorful_logo.dart';
import '../widgets/log_in_form.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundTopBar(),
          const AppColorfulLogo(),
          _buildBackgroundBottomBar(),
          _buildContent(context),
        ],
      ),
    );
  }

   Padding _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 172.h, left: 20.w, right: 20.w),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitle(),
              verticalSpace(4),
              _buildSubtitle(),
              verticalSpace(32),

              const LogInForm(),
              verticalSpace(24),
              _buildFooterTexts(context),
            ],
          ),
        ),
      ),
    );
  }

  Center _buildFooterTexts(context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: AppStrings.logInDontHaveAccount,
          style: ApptTextStyles.font12BlackSemiBold,
          children: [
            TextSpan(
              text: AppStrings.signUpText,
              style: ApptTextStyles.font12BlackSemiBold.copyWith(
                color: AppColors.primaryColor,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {
                Navigator.pushReplacementNamed(context, AppScreens.signUpScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Text _buildSubtitle() {
    return Text(
      AppStrings.logInSubtitle,
      style: ApptTextStyles.font13GreyNormal,
    );
  }

  Text _buildTitle() {
    return Text(
      AppStrings.logInTitle,
      style: ApptTextStyles.font24BlackSemiBold,
    );
  }

  Positioned _buildBackgroundBottomBar() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Image.asset(AppAssets.backgroundBottomBar, fit: BoxFit.cover),
    );
  }

  Positioned _buildBackgroundTopBar() {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Image.asset(AppAssets.backgroundTopBar, fit: BoxFit.cover),
    );
  }
}
