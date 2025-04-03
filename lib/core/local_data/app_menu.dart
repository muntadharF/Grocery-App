import 'package:flutter/material.dart';

import '../../features/home/screens/home_screen.dart';

class ScreenItem {
  final Widget screen;
  final String icon;
  final String label;

  ScreenItem({required this.screen, required this.icon, required this.label});
}

final List<ScreenItem> screens = [
  ScreenItem(screen: ShopScreen(), icon: 'assets/svgs/shop.svg', label: 'Shop'),
  ScreenItem(
    screen: ExploreScreen(),
    icon: 'assets/svgs/explore.svg',
    label: 'Explore',
  ),
  ScreenItem(screen: CartScreen(), icon: 'assets/svgs/cart.svg', label: 'Cart'),
  ScreenItem(
    screen: FavouriteScreen(),
    icon: 'assets/svgs/favourite.svg',
    label: 'Favourite',
  ),
  ScreenItem(
    screen: AccountScreen(),
    icon: 'assets/svgs/account.svg',
    label: 'Account',
  ),
];
