import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/core/strings.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/onboarding_slide.dart';
import '../../core/widgets/progress_bar.dart';
import '../controllers/onboarding_controller.dart'; // Import the controller
import '../../routes/app_pages.dart'; // Import the app routes

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 80.0),
                // Add space above the progress bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ProgressBar(
                    progress: controller.currentProgress.value,
                  ),
                ),
                const SizedBox(height: 48),
                // Space between progress bar and content
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
                        image: page['image'],
                        description: page['description'],
                        icon: page['icon'],
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
                          color: Colors.grey,
                        )
                      else
                        const SizedBox.shrink(),
                      CustomButton(
                        onPressed: controller.onNextPage,
                        text: controller.currentPage.value ==
                                controller.pages.length - 1
                            ? AppStrings.buttonComplete
                            : AppStrings.buttonNext,
                        color: Colors.blue,
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
                  child: const Text(
                    AppStrings.buttonSkip,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
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
