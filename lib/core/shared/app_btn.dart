import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_constants/app_colors.dart';
import '../app_constants/app_text_styles.dart';

class AppBtn extends StatelessWidget {
  const AppBtn({super.key, required this.text, this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          minimumSize: Size(double.infinity, 54.h),
          maximumSize: Size(double.infinity, 54.h),
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.r)),
          ),
        ),
        child: Text(
          text,
          style: ApptTextStyles.font40WhiteSemiBold.copyWith(fontSize: 16.sp),
        ),
      ),
    );
  }
}
