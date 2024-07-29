import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart'; // Import flutter_svg

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
    final titleColor = theme.colorScheme.onSurface;
    final subTitleColor = theme.colorScheme.onSecondary;
    final descriptionColor = theme.colorScheme.onSecondary;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24), // Simplified padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                getIconPath(context),
                width: 36,
                height: 36,
              ),
              const SizedBox(height: 24), // Space between icon and title
              Text(
                title,
                style: TextStyle(fontFamily: "Larssiet", fontSize: 24, fontWeight: FontWeight.w500, color: titleColor)
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(fontFamily: "Larsseit", fontSize: 16, color: subTitleColor)
              ),
            ],
          ),
          const SizedBox(height: 56),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    getImagePath(context),
                    width: 160,
                    height: 160,
                  ),
                ),
                const SizedBox(height: 56),
                // Space between image and description
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Larsseit", color: descriptionColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
