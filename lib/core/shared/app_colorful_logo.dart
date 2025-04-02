import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../app_constants/app_assets.dart';

class AppColorfulLogo extends StatelessWidget {
  const AppColorfulLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 72.h,
      left: 0,
      right: 0,
      child: SvgPicture.asset(
        AppAssets.appColorfulLogo,
        width: 48,
        height: 56,
        fit: BoxFit.contain,
      ),
    );
  }
}
