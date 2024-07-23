import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/strings.dart';
import '../../routes/app_pages.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(AppStrings.onBoarding),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.HOME_SCREEN);
              },
              child: const Text(AppStrings.getStarted),
            ),
          ],
        ),
      ),
    );
  }
}
