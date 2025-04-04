import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/core/app_constants/app_strings.dart';
import 'package:grocery_app/features/home/widgets/top_banner.dart';

import '../../../core/app_constants/app_assets.dart';
import '../../../core/app_constants/app_colors.dart';
import '../../../core/app_constants/app_text_styles.dart';
import '../../../core/helpers/spacing_helper.dart';
import '../../../core/local_data/app_menu.dart';
import '../../../core/shared/app_search_field.dart';
import '../widgets/app_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox.expand(child: screens[_selectedIndex].screen),
      ),
      bottomNavigationBar: AppBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

/// Shop screen is the body for Home Screen
class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.sizeOf(context).width;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(8),
          _buildColorfulLogo(),

          verticalSpace(6),
          _buildLocationRow(fullWidth),

          verticalSpace(16),
          const AppSearchField(),

          verticalSpace(20),
          const TopBanner(),

          verticalSpace(24),
          _buildLabelWithActionRow(AppStrings.exclusiveOfferLabel),

          // Row( exclusive offer title (Text) + see all (text) ) title || align with text => X2
          // Row (exclusive offer items)

          // Row( Best Selling title (Text) + see all (text) ) title || align with text => X2
          // Row (Best Selling items)

          // Row( groceries title (Text) + see all (text) ) title || align with text => X2
          // Row (Groceries boxex)
        ],
      ),
    );
  }

  Row _buildLabelWithActionRow(String label) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: ApptTextStyles.font24BlackSemiBold.copyWith(
            fontSize: 20.sp,
            letterSpacing: -0.3,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            AppStrings.seeAllSubLabel,
            style: ApptTextStyles.font13PrimaryColorSemiBold,
          ),
        ),
      ],
    );
  }

  SizedBox _buildLocationRow(double fullWidth) {
    return SizedBox(
      width: fullWidth * 0.9,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on, color: AppColors.darkGrey, size: 24.r),
          horizontalSpace(4),
          Flexible(
            child: Text(
              'Baghdad, Mansour',
              style: ApptTextStyles.font15DarkGreySemiBold,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Align _buildColorfulLogo() {
    return Align(
      alignment: Alignment.center,
      child: SvgPicture.asset(
        AppAssets.appColorfulLogo,
        width: 28.w,
        height: 28.h,
      ),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Explore Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Cart Screen', style: TextStyle(fontSize: 24)));
  }
}

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favourite Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Account Screen', style: TextStyle(fontSize: 24)),
    );
  }
}
