// lib/widgets/edit_name_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routine/core/strings.dart';
import 'package:routine/core/widgets/custom_button.dart';
import '../../modules/controllers/name_controller.dart';
import '../../modules/controllers/today_controller.dart';

class EditNameBottomSheet extends StatelessWidget {
  final TodayController todayController = Get.find();
  final NameController nameController = Get.find();

  EditNameBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Local variable to hold the temporary new name
    TextEditingController localController = TextEditingController(
      text: nameController.nameController.text,
    );

    RxString localErrorText = ''.obs;
    RxBool localIsInputValid = false.obs;

    void validateLocalInput(String value) {
      if (value.isEmpty) {
        localErrorText.value = '';
        localIsInputValid.value = false;
      } else if (value.startsWith(' ')) {
        localErrorText.value = AppStrings.space;
        localIsInputValid.value = false;
      } else if (RegExp(r'[0-9]').hasMatch(value)) {
        localErrorText.value = AppStrings.number;
        localIsInputValid.value = false;
      } else if (RegExp(r'[^a-zA-Z\s]').hasMatch(value)) {
        localErrorText.value = AppStrings.symbol;
        localIsInputValid.value = false;
      } else {
        localErrorText.value = '';
        localIsInputValid.value = true;
      }
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Icon(
                Icons.edit,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 16, top: 16, bottom: 16),
                child: Text(
                  AppStrings.editname,
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Obx(() => TextField(
                  style: GoogleFonts.inter(
                    color: theme.colorScheme.onBackground,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  controller: localController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                          color: theme.colorScheme.secondary, width: 1.5),
                    ),
                    hintText: AppStrings.editHint,
                    hintStyle: GoogleFonts.inter(
                        color: theme.colorScheme.onSecondary.withOpacity(0.5)),
                    errorText: localErrorText.value.isEmpty
                        ? null
                        : localErrorText.value,
                  ),
                  onChanged: (value) {
                    validateLocalInput(value);
                  },
                )),
          ),
          const SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  textPadding: const EdgeInsets.only(
                      right: 40, bottom: 8, top: 8, left: 40),
                  text: AppStrings.cancel,
                  color: theme.colorScheme.secondary,
                  textColor: theme.colorScheme.onBackground,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 16),
                CustomButton(
                  textPadding: const EdgeInsets.only(
                      right: 40, bottom: 8, top: 8, left: 40),
                  text: AppStrings.save,
                  color: theme.colorScheme.primary,
                  textColor: theme.colorScheme.onBackground,
                  onPressed: () {
                    if (localIsInputValid.value) {
                      String newName = localController.text;
                      nameController.updateName(newName);
                      todayController.username.value = newName;
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
