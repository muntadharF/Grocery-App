import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/app_constants/app_colors.dart';
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
  String initialRoute = await getInitialRoute();

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Base screen size for scaling
      minTextAdapt: true, // Ensures text scales properly
      splitScreenMode: true, // Supports split-screen and multi-window mode
      builder: (_, child) {
        return GetMaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
          ),
          initialRoute: initialRoute,
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}

Future<String> getInitialRoute() async {
  var isOnboardingComplete =
      await SharedPrefHelper.getBool(SharedPrefKeys.onboardingComplete) ??
      false;

  if (isOnboardingComplete) {
    var isUserLoggedIn =
        await SharedPrefHelper.getBool(SharedPrefKeys.userLoggedIn) ?? false;

    if (isUserLoggedIn) {
      return AppScreens.homeScreen;
    }

    return AppScreens.logInScreen;
  }

  return AppScreens.onboardingScreen;
}
