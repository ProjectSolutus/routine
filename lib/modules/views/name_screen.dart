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
  final NameController controller = Get.put(NameController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final descriptionColor = theme.colorScheme.onSecondary.withOpacity(0.5);
    final String smileyPath =
        isDarkMode ? 'assets/svgs/5_dark.svg' : 'assets/svgs/5.svg';
    final screenHeight = MediaQuery.of(context).size.height;
    final String logoPath =
        isDarkMode ? 'assets/svgs/routine_dark.svg' : 'assets/svgs/routine.svg';

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.1),
                    SvgPicture.asset(
                      logoPath,
                      width: 36,
                      height: 36,
                    ),
                    SizedBox(height: screenHeight * 0.08),
                    Center(
                      child: SvgPicture.asset(
                        smileyPath,
                        width: 104,
                        height: 104,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.08),
                    Text(
                      AppStrings.name,
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    CustomTextField(
                      controller: controller.nameController,
                      hintText: AppStrings.nameHint,
                      fillColor: Colors.transparent,
                      borderColor: theme.colorScheme.secondary,
                      textColor: theme.colorScheme.onBackground,
                      focusedborderColor: theme.colorScheme.primary,
                      enabledborderColor: theme.colorScheme.secondary,
                      hintTextColor: theme.colorScheme.onSecondary,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      AppStrings.nameDescription,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: descriptionColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Obx(
                () => Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomButton(
                    onPressed: controller.isButtonEnabled.value
                        ? () {
                            Get.toNamed(AppRoutes.homescreen);
                          }
                        : null,
                    text: AppStrings.buttonComplete,
                    color: controller.isButtonEnabled.value
                        ? theme.colorScheme.primary
                        : theme.colorScheme.primary.withOpacity(0.5),
                    textColor: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}
