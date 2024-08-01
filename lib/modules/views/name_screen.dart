import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routine/core/strings.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../routes/app_routes.dart';
import '../controllers/name_controller.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  NameScreenState createState() => NameScreenState();
}

class NameScreenState extends State<NameScreen> {
  late final NameController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        Get.find<NameController>(); // Ensure the controller is registered
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final descriptionColor = theme.colorScheme.onSecondary.withOpacity(0.5);
    final String smileyPath =
        isDarkMode ? 'assets/svgs/5_dark.svg' : 'assets/svgs/5.svg';
    final screenHeight = MediaQuery.of(context).size;

    final String logoPath =
        isDarkMode ? 'assets/svgs/routine_dark.svg' : 'assets/svgs/routine.svg';

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight.height * 0.1),
                  SvgPicture.asset(
                    logoPath,
                    width: 36,
                    height: 36,
                  ),
                  SizedBox(height: screenHeight.height * 0.08),
                  Center(
                    child: SvgPicture.asset(
                      smileyPath,
                      width: 104,
                      height: 104,
                    ),
                  ),
                  SizedBox(height: screenHeight.height * 0.08),
                  Text(
                    AppStrings.name,
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: screenHeight.height * 0.01),
                  CustomTextField(
                    controller: _controller.nameController,
                    hintText: AppStrings.nameHint,
                    fillColor: Colors.transparent,
                    borderColor: theme.colorScheme.secondary,
                    textColor: theme.colorScheme.onBackground,
                    focusedborderColor: theme.colorScheme.primary,
                    enabledborderColor: theme.colorScheme.secondary,
                    hintTextColor: theme.colorScheme.onSecondary,
                  ),
                  SizedBox(height: screenHeight.height * 0.01),
                  Text(
                    AppStrings.nameDescription,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: descriptionColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16), // Adjust spacing as needed
                ],
              ),
            ),
          ),
          SafeArea(
            child: Obx(
              () => Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                child: CustomButton(
                  onPressed: _controller.isButtonEnabled.value
                      ? () {
                          Get.toNamed(AppRoutes.namescreen);
                        }
                      : null,
                  // Disabled button
                  text: AppStrings.buttonComplete,
                  color: _controller.isButtonEnabled.value
                      ? theme.colorScheme.primary
                      : theme.colorScheme.primary.withOpacity(0.5),
                  // Faded color
                  textColor: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight.height * 0.05,
          ),
        ],
      ),
    );
  }
}
