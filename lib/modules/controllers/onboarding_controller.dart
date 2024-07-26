import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/core/strings.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  var currentProgress = 0.0.obs;

  final PageController pageController = PageController();

  final List<Map<String, dynamic>> pages = [
    {
      'title': AppStrings.slideOneTitle,
      'subtitle': AppStrings.slideOneSubtitle,
      'lightImage': 'assets/svgs/1.svg',
      'darkImage': 'assets/svgs/1_dark.svg',
      'description': AppStrings.slideOneDescription,
      'lightIcon': 'assets/svgs/routine.svg',
      'darkIcon': 'assets/svgs/routine_dark.svg',
    },
    {
      'title': AppStrings.slideTwoTitle,
      'subtitle': AppStrings.slideTwoSubtitle,
      'lightImage': 'assets/svgs/2.svg',
      'darkImage': 'assets/svgs/2_dark.svg',
      'description': AppStrings.slideTwoDescription,
      'lightIcon': 'assets/svgs/task.svg',
      'darkIcon': 'assets/svgs/task_dark.svg',
    },
    {
      'title': AppStrings.slideThreeTitle,
      'subtitle': AppStrings.slideThreeSubtitle,
      'lightImage': 'assets/svgs/3.svg',
      'darkImage': 'assets/svgs/3_dark.svg',
      'description': AppStrings.slideThreeDescription,
      'lightIcon': 'assets/svgs/habit.svg',
      'darkIcon': 'assets/svgs/habit_dark.svg',
    },
    {
      'title': AppStrings.slideFourTitle,
      'subtitle': AppStrings.slideFourSubtitle,
      'lightImage': 'assets/svgs/4.svg',
      'darkImage': 'assets/svgs/4_dark.svg',
      'description': AppStrings.slideFourDescription,
      'lightIcon': 'assets/svgs/privacy.svg',
      'darkIcon': 'assets/svgs/privacy_dark.svg',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    updateProgress();
  }

  void updateProgress() {
    currentProgress.value = (currentPage.value + 1) / pages.length;
  }

  void onNextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      currentPage.value++;
      updateProgress();
    }
  }

  void onBackPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      currentPage.value--;
      updateProgress();
    }
  }
}
