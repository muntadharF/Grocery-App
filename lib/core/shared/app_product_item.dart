import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_constants/app_colors.dart';
import '../app_constants/app_text_styles.dart';
import '../helpers/extensions_helper.dart';
import '../helpers/spacing_helper.dart';
import '../local_data/product.dart';

class AppProductItem extends StatelessWidget {
  const AppProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 172.w,
      height: 228.h,
      child: DecoratedBox(
        decoration: _buildDecoration(),
        child: Padding(
          padding: _contentPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildProductImage(),
              _buildTitleAndDetails(),
              verticalSpace(8),
              _buildPriceAndAddButton(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildPriceAndAddButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${product.price}',
          style: ApptTextStyles.font16BlackBold.copyWith(fontSize: 18.sp),
        ),

        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add, color: Colors.white, size: 32.r),
          style: IconButton.styleFrom(
            minimumSize: Size(44.w, 44.h),
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
            ),
          ),
        ),
      ],
    );
  }

  Column _buildTitleAndDetails() {
    final String detailText =
        '${product.weight.isNullOrEmpty() ? product.volume : product.weight}, Price';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: ApptTextStyles.font16BlackBold,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          detailText,
          style: ApptTextStyles.font14Grey600Semibold.copyWith(
            fontWeight: FontWeight.w500,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      border: Border.all(width: 1.w, color: Colors.grey.shade300),
      borderRadius: BorderRadius.all(Radius.circular(16.r)),
    );
  }

  Align _buildProductImage() {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        product.img,
        width: 108.w,
        height: 98.h,
        fit: BoxFit.contain,
      ),
    );
  }

  EdgeInsets _contentPadding() {
    return EdgeInsets.only(top: 8.h, bottom: 12.h, left: 14.w, right: 14.h);
  }
}
