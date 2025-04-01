import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/app_constants/app_strings.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/routing/app_routes.dart';
import 'core/routing/app_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();

  // Ensure screen size for flutter_screenutil (fixes hidden text in release mode)
  await ScreenUtil.ensureScreenSize();

  // Fetch onboarding status before running the app
  bool isOnboardingComplete = await getOnboardingStatus();

  runApp(MyApp(isOnboardingComplete: isOnboardingComplete));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isOnboardingComplete});

  final bool isOnboardingComplete;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Base screen size for scaling
      minTextAdapt: true, // Ensures text scales properly
      splitScreenMode: true, // Supports split-screen and multi-window mode
      builder: (_, child) {
        return GetMaterialApp(
          initialRoute:
              isOnboardingComplete
                  ? AppScreens.logInScreen
                  : AppScreens.onboardingScreen,
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}

/// Fetches onboarding status from SharedPreferences
Future<bool> getOnboardingStatus() async {
  return await SharedPrefHelper.getBool(SharedPrefKeys.onboardingComplete) ??
      false;
}
