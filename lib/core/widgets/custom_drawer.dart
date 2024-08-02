import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routine/core/strings.dart';
import '../../modules/controllers/today_controller.dart';
import '../../modules/controllers/name_controller.dart';
import '../widgets/edit_name_bottom_sheet.dart'; // Import the new file

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final TodayController todayController = Get.put(TodayController());
  final NameController nameController = Get.find();

  @override
  Widget build(BuildContext context) {
    RxString name = todayController.username;
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final String logoPath =
        isDarkMode ? 'assets/svgs/5.svg' : 'assets/svgs/5_dark.svg';

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        color: theme.colorScheme.background,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 16, right: 0, top: 54),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onBackground,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: ClipOval(
                      child: SvgPicture.asset(
                        logoPath,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '$name\'s Routine',
                                  style: GoogleFonts.inter(
                                    color: theme.colorScheme.onBackground,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Show the custom bottom sheet to edit the name
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return EditNameBottomSheet();
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: theme.colorScheme.primary,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              AppStrings.menu,
                              style: GoogleFonts.inter(
                                color: theme.colorScheme.onSecondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(CupertinoIcons.clear_circled_solid,
                        color: theme.colorScheme.onSecondary),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: Icon(Icons.home, color: theme.colorScheme.onSecondary),
              title: Text(
                'Home',
                style: GoogleFonts.inter(
                  color: theme.colorScheme.onBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigate to home page
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.settings, color: theme.colorScheme.onSecondary),
              title: Text(
                'Settings',
                style: GoogleFonts.inter(
                  color: theme.colorScheme.onBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigate to settings page
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: theme.colorScheme.onSecondary),
              title: Text(
                'Info',
                style: GoogleFonts.inter(
                  color: theme.colorScheme.onBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigate to about page
              },
            ),
            // Add more items here
          ],
        ),
      ),
    );
  }
}
