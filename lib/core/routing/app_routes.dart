import 'package:flutter/material.dart';

import '../../features/onbording/onboarding_screen.dart';
import 'app_screens.dart';

class AppRoutes {
  static MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppScreens.onboardingScreen:
        {
          return MaterialPageRoute(builder: (_) => const OnboardingScreen());
        }

      default:
        return null;
    }
  }
}
