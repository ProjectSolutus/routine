import 'package:get/get.dart';
import 'name_controller.dart';

class TodayController extends GetxController {
  final NameController nameController =
      Get.find(); // Assumes NameController is registered with GetX

  RxString username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Listen to changes in nameController's text and update the username
    nameController.nameController.addListener(() {
      username.value = nameController.nameController.text;
    });
  }

  @override
  void onClose() {
    // Clean up the listener when TodayController is disposed
    nameController.nameController.removeListener(() {
      username.value = nameController.nameController.text;
    });
    super.onClose();
  }
}
