import 'package:flutter/material.dart';

import '../../features/log_in/screens/log_in_screen.dart';
import '../../features/onbording/onboarding_screen.dart';
import 'app_screens.dart';

class AppRoutes {
  static MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppScreens.onboardingScreen:
        {
          return MaterialPageRoute(builder: (_) => const OnboardingScreen());
        }
      case AppScreens.logInScreen:
        {
          return MaterialPageRoute(builder: (_) => const LogInScreen());
        }

      default:
        return null;
    }
  }
}
