import 'package:get/get.dart';
import 'package:routine/modules/views/home_screen.dart';
import '../modules/views/name_screen.dart';
import '../modules/views/onboarding_screen.dart';
import 'app_routes.dart';
import '../core/utils/custom_transition.dart'; // Import the custom transition

class AppPages {
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.start,
      page: () => OnboardingScreen(),
      preventDuplicates: true,
      customTransition: MyCustomTransition(),
    ),
    GetPage(
      name: AppRoutes.namescreen,
      page: () => NameScreen(),
      preventDuplicates: true,
      customTransition: MyCustomTransition(), // Use the custom transition
    ),
    GetPage(
      name: AppRoutes.homescreen,
      page: () => HomeScreen(),
      preventDuplicates: true,
      customTransition: MyCustomTransition(),
    ),
  ];
}
