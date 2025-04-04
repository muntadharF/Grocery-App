import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_constants/app_assets.dart';
import '../../../core/app_constants/app_colors.dart';

class TopBanner extends StatefulWidget {
  const TopBanner({super.key});

  @override
  State<TopBanner> createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  int _currentIndicatorIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: _buildOptions(),
          items:
              [0, 1, 2].map((banner) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          child: Image.asset(
                            AppAssets.freshVegetablesBanner,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
        ),

        Positioned(bottom: 10, left: 0, right: 0, child: _buildIndicators()),
      ],
    );
  }

  CarouselOptions _buildOptions() {
    return CarouselOptions(
      height: 84.h,
      autoPlay: true,
      viewportFraction: 1.0,
      enlargeCenterPage: true,
      initialPage: _currentIndicatorIndex,
      enableInfiniteScroll: true,
      onPageChanged:
          (index, _) => setState(() => _currentIndicatorIndex = index),
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          [0, 1, 2].map((index) {
            bool isItCurrentIndicator = _currentIndicatorIndex == index;

            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: isItCurrentIndicator ? 18.w : 6.w,
              height: isItCurrentIndicator ? 6.h : 6.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                color:
                    isItCurrentIndicator ? AppColors.primaryColor : Colors.grey,
              ),
            );
          }).toList(),
    );
  }
}
