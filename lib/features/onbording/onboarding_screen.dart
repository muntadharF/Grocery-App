import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/app_constants/app_assets.dart';
import '../../core/app_constants/app_strings.dart';
import '../../core/app_constants/app_text_styles.dart';
import '../../core/helpers/shared_pref_helper.dart';
import '../../core/helpers/spacing_helper.dart';
import '../../core/routing/app_screens.dart';
import '../../core/shared/app_btn.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [_buildBackgroundImage(), _buildContent(context)]),
    );
  }

  Align _buildContent(context) {
    return Align(
      alignment: Alignment(0, 0.7),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLogo(),
            verticalSpace(16),
        
            _buildTitle(),
            verticalSpace(8),
            _buildSubtitle(),
        
            verticalSpace(32),
            _buildOnboardingBtn(context),
          ],
        ),
      ),
    );
  }

  AppBtn _buildOnboardingBtn(context) {
    return AppBtn(
      text: AppStrings.onboardingBtnText,
      onPressed: () async {
        await SharedPrefHelper.setData(SharedPrefKeys.onboardingComplete, true);
        Navigator.pushReplacementNamed(context, AppScreens.logInScreen);
      },
    );
  }

  Text _buildSubtitle() {
    return Text(
      AppStrings.onboardingSubtitle,
      style: ApptTextStyles.font13GreyNormal,
      textAlign: TextAlign.center,
    );
  }

  Text _buildTitle() {
    return Text(
      AppStrings.onboardingTitle,
      style: ApptTextStyles.font40WhiteSemiBold.copyWith(height: 1.2),
      textAlign: TextAlign.center,
    );
  }

  SvgPicture _buildLogo() {
    return SvgPicture.asset(AppAssets.appLogo, width: 48, height: 56);
  }

  _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.asset(AppAssets.backgroundImg, fit: BoxFit.cover),
    );
  }
}
