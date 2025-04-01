import 'package:flutter/material.dart';

import '../../features/home/screens/home_screen.dart';
import 'app_screens.dart';

class AppRoutes {
  static MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppScreens.home:
        {
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        }

      default:
        return null;
    }
  }
}
