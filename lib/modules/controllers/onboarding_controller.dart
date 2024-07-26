import 'package:flutter/material.dart'; // Import flutter_svg
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
      'image': 'assets/svgs/1.svg',
      'description': AppStrings.slideOneDescription,
    },
    {
      'title': AppStrings.slideTwoTitle,
      'subtitle': AppStrings.slideTwoSubtitle,
      'image': 'assets/svgs/2.svg',
      'description': AppStrings.slideTwoDescription,
      'icon': 'assets/svgs/task.svg',
    },
    {
      'title': AppStrings.slideThreeTitle,
      'subtitle': AppStrings.slideThreeSubtitle,
      'image': 'assets/svgs/3.svg',
      'description': AppStrings.slideThreeDescription,
      'icon': 'assets/svgs/habit.svg',
    },
    {
      'title': AppStrings.slideFourTitle,
      'subtitle': AppStrings.slideFourSubtitle,
      'image': 'assets/svgs/4.svg',
      'description': AppStrings.slideFourDescription,
      'icon': 'assets/svgs/privacy.svg',
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
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      currentPage.value++;
      updateProgress();
    }
  }

  void onBackPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      currentPage.value--;
      updateProgress();
    }
  }
}
