import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/core/strings.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/onboarding_slide.dart';
import '../../core/widgets/progress_bar.dart';
import '../controllers/onboarding_controller.dart';
import '../../routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';

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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.11),
                  ProgressBar(
                    progress: controller.currentProgress.value,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Expanded(
                    flex: 8,
                    child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.pages.length,
                      onPageChanged: (int page) {
                        controller.currentPage.value = page;
                        controller.updateProgress();
                      },
                      itemBuilder: (context, index) {
                        final page = controller.pages[index];
                        return Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            child: OnboardingSlide(
                              title: page['title'],
                              subtitle: page['subtitle'],
                              lightImage: page['lightImage'],
                              darkImage: page['darkImage'],
                              description: page['description'],
                              lightIcon: page['lightIcon'],
                              darkIcon: page['darkIcon'],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
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
                            Get.toNamed(AppRoutes.homescreen);
                          } else {
                            controller.onNextPage();
                          }
                        },
                        text: controller.currentPage.value ==
                                controller.pages.length - 1
                            ? AppStrings.buttonComplete
                            : AppStrings.buttonNext,
                        color: theme.colorScheme.primary,
                        textColor: theme.colorScheme.onPrimary,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.11),
                ],
              ),
            ),
            if (controller.currentPage.value < controller.pages.length - 1)
              Positioned(
                top: screenHeight * 0.06,
                right: 0,
                child: TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.homescreen),
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
