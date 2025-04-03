import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/core/app_constants/app_assets.dart';
import 'package:grocery_app/core/helpers/spacing_helper.dart';

import '../../../core/local_data/app_menu.dart';
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

/// Shop screen is Home Screen
class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(8),
          _buildColorfulLogo(),

          // location (icon + Text.rich)
          // search box
          // banner

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
