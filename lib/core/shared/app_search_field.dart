import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../features/home/controllers/app_search_controller.dart';
import '../app_constants/app_assets.dart';
import '../app_constants/app_strings.dart';
import '../app_constants/app_text_styles.dart';
import '../di/dependency_injection.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final AppSearchController searchController = getIt<AppSearchController>();
    searchController.onInit();

    return SizedBox(
      width: double.infinity,
      height: 44.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        child: Obx(() => _buildTextField(searchController)),
      ),
    );
  }

  TextField _buildTextField(AppSearchController searchController) {
    return TextField(
      controller: searchController.textController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: AppStrings.searchHintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10.h),
        hintStyle: ApptTextStyles.font12BlackSemiBold.copyWith(
          color: Colors.grey.shade600,
        ),
        prefixIcon: _buildSearchIcon(),
        suffixIcon:
            searchController.showClearIcon.value
                ? _buildClearIcon(searchController)
                : null,
      ),
    );
  }

  GestureDetector _buildClearIcon(AppSearchController searchController) {
    return GestureDetector(
      onTap: searchController.clearText,
      child: Icon(Icons.highlight_remove, color: Colors.grey.shade400),
    );
  }

  Transform _buildSearchIcon() {
    return Transform.scale(
      scale: 0.35.r,
      child: SvgPicture.asset(AppAssets.search),
    );
  }
}
