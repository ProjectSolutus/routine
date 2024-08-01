import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/widgets/custom_button.dart';
import '../../core/widgets/onboarding_page.dart';
import '../../core/widgets/progress_bar.dart';
import '../controllers/onboarding_controller.dart';
import '../../routes/app_routes.dart';
import '../../core/strings.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final skipButtonColor = theme.colorScheme.onSecondary;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.12),
                  ProgressBar(
                    progress: controller.currentProgress.value,
                  ),
                  SizedBox(height: screenHeight * 0.06),
                  Expanded(
                    child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.pages.length,
                      onPageChanged: (int page) {
                        controller.currentPage.value = page;
                        controller.updateProgress();
                      },
                      itemBuilder: (context, index) {
                        final page = controller.pages[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: OnboardingPage(
                            title: page['title'],
                            subtitle: page['subtitle'],
                            lightImage: page['lightImage'],
                            darkImage: page['darkImage'],
                            description: page['description'],
                            lightIcon: page['lightIcon'],
                            darkIcon: page['darkIcon'],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (controller.currentPage.value > 0)
                        CustomButton(
                          onPressed: controller.onBackPage,
                          text: AppStrings.buttonBack,
                          color: theme.colorScheme.surface,
                          textColor: theme.colorScheme.onSecondary,
                        )
                      else
                        const SizedBox.shrink(),
                      CustomButton(
                        onPressed: () {
                          if (controller.currentPage.value ==
                              controller.pages.length - 1) {
                            Get.toNamed(AppRoutes.namescreen);
                          } else {
                            controller.onNextPage();
                          }
                        },
                        text: controller.currentPage.value ==
                                controller.pages.length - 1
                            ? AppStrings.buttonNext
                            : AppStrings.buttonNext,
                        color: theme.colorScheme.primary,
                        textColor: theme.colorScheme.onPrimary,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05), // Space below buttons
                ],
              ),
            ),
            if (controller.currentPage.value < controller.pages.length - 1)
              Positioned(
                top: screenHeight * 0.06,
                right: 0,
                child: TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.namescreen),
                  child: Text(
                    AppStrings.buttonSkip,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: skipButtonColor,
                    ),
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
