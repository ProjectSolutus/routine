import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  final String lightIcon;
  final String darkIcon;
  final String title;
  final String subtitle;
  final String lightImage;
  final String darkImage;
  final String description;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.lightImage,
    required this.darkImage,
    required this.description,
    required this.lightIcon,
    required this.darkIcon,
  });

  String getIconPath(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? darkIcon : lightIcon;
  }

  String getImagePath(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? darkImage : lightImage;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleColor = theme.colorScheme.onBackground;
    final subTitleColor = theme.colorScheme.onSecondary;
    final descriptionColor =
        theme.colorScheme.onSecondary.withOpacity(0.5); // Set opacity here

    // Get screen height
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(
              getIconPath(context),
              width: 36,
              height: 36,
            ),
          ),
          const SizedBox(height: 28),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: titleColor,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: subTitleColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          Center(
            child: SvgPicture.asset(
              getImagePath(context),
              width: 200,
              height: 200,
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              description,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: descriptionColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
