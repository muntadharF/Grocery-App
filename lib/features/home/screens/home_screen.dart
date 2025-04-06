import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/core/local_data/product.dart';

import '../../../core/app_constants/app_assets.dart';
import '../../../core/app_constants/app_colors.dart';
import '../../../core/app_constants/app_strings.dart';
import '../../../core/app_constants/app_text_styles.dart';
import '../../../core/helpers/spacing_helper.dart';
import '../../../core/local_data/app_menu.dart';
import '../../../core/shared/app_product_item.dart';
import '../../../core/shared/app_search_field.dart';
import '../widgets/app_bottom_nav_bar.dart';
import '../widgets/top_banner.dart';

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
          verticalSpace(8),
          _buildExclusiveOfferProducts(),

          // Row( Best Selling title (Text) + see all (text) ) title || align with text => X2
          // Row (Best Selling items)

          // Row( groceries title (Text) + see all (text) ) title || align with text => X2
          // Row (Groceries boxex)
        ],
      ),
    );
  }

  SizedBox _buildExclusiveOfferProducts() {
    final List<Product> products = <Product>[
      Product(
        img: 'assets/images/bananas.png',
        title: 'Organic Bananas',
        price: 4.99,
        review: 3,
        description:
            'Officia minim qui aliqua Lorem cillum aliqua incididunt excepteur aute exercitation qui exercitation proident. Labore deserunt sit eiusmod laborum ut ullamco. Ut laboris exercitation ullamco nostrud ea ex et dolor Lorem cupidatat.',
        weight: '7pcs',
      ),

      Product(
        img: 'assets/images/apples.png',
        title: 'Red Apple',
        price: 4.99,
        review: 3,
        description:
            'Enim amet sint sunt incididunt do veniam adipisicing. Adipisicing dolore sunt incididunt nisi eu dolor ullamco adipisicing aute ea velit. Pariatur laboris Lorem tempor ad esse nostrud ea sit dolore tempor consequat adipisicing occaecat duis. Laboris aliqua ea est proident cillum do. In velit consectetur enim dolore. In qui cupidatat consectetur ullamco id nostrud.',
        weight: '1KG',
      ),

      Product(
        img: 'assets/images/bananas.png',
        title: 'Organic Bananas',
        price: 4.99,
        review: 3,
        description:
            'Officia minim qui aliqua Lorem cillum aliqua incididunt excepteur aute exercitation qui exercitation proident. Labore deserunt sit eiusmod laborum ut ullamco. Ut laboris exercitation ullamco nostrud ea ex et dolor Lorem cupidatat.',
        weight: '7pcs',
      ),
    ];

    return SizedBox(
      height: 228.h,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          double rightPadding = (products.length == index + 1) ? 0 : 14.w;

          return Padding(
            padding: EdgeInsets.only(right: rightPadding),
            child: AppProductItem(product: products[index]),
          );
        },
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
