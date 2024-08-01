import 'package:get/get.dart';
import '../modules/views/name_screen.dart';
import '../modules/views/onboarding_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.start,
      page: () => OnboardingScreen(),
      preventDuplicates: true,
    ),
    GetPage(
      name: AppRoutes.namescreen,
      page: () => const NameScreen(),
      preventDuplicates: true,
    ),
  ];
}
