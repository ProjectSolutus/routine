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

    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 80.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ProgressBar(
                    progress: controller.currentProgress.value,
                  ),
                ),
                const SizedBox(height: 48),
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
                      return OnboardingSlide(
                        title: page['title'],
                        subtitle: page['subtitle'],
                        lightImage: page['lightImage'],
                        darkImage: page['darkImage'],
                        description: page['description'],
                        lightIcon: page['lightIcon'],
                        darkIcon: page['darkIcon'],
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 64),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (controller.currentPage.value > 0)
                        CustomButton(
                          onPressed: controller.onBackPage,
                          text: AppStrings.buttonBack,
                          color: Theme.of(context).colorScheme.secondary,
                          textColor: Theme.of(context).colorScheme.onSecondary,
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
                        color: Theme.of(context).colorScheme.primary,
                        textColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (controller.currentPage.value < controller.pages.length - 1)
              Positioned(
                top: 16,
                right: 16,
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
