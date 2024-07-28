import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingSlide extends StatelessWidget {
  final String lightIcon;
  final String darkIcon;
  final String title;
  final String subtitle;
  final String lightImage;
  final String darkImage;
  final String description;

  const OnboardingSlide({
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

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            getIconPath(context),
            width: 36,
            height: 36,
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: subTitleColor,
            ),
          ),
          const SizedBox(height: 56), // Adjusted space here
          Center(
            child: SvgPicture.asset(
              getImagePath(context),
              width: 160,
              height: 160,
            ),
          ),
          const SizedBox(height: 56), // Adjusted space here
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: descriptionColor,
            ),
          ),
        ],
      ),
    );
  }
}
