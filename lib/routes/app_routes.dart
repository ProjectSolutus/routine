import 'package:get/get.dart';

import '../modules/views/home_screen.dart';
import '../modules/views/onboarding_screen.dart';
import 'app_pages.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<OnboardingScreen>(
      name: AppRoutes.START,
      page: () => const OnboardingScreen(),
      preventDuplicates: true,
    ),
    GetPage<HomeScreen>(
      name: AppRoutes.HOME_SCREEN,
      page: () => const HomeScreen(),
      preventDuplicates: true,
    ),
  ];
}
