import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final RxBool isButtonEnabled = false.obs; // Add this line

  @override
  void onInit() {
    super.onInit();
    nameController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    isButtonEnabled.value = nameController.text.isNotEmpty;
  }

  @override
  void dispose() {
    nameController.removeListener(_updateButtonState);
    nameController.dispose();
    super.dispose();
  }
}
