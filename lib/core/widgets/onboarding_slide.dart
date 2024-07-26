import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg

class OnboardingSlide extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String image; // Use String for SVG path
  final String description;

  const OnboardingSlide({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16), // Simplified padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                icon,
                width: 36,
                height: 36,
              ),
              const SizedBox(height: 24), // Space between icon and title
              Text(
                title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          const SizedBox(height: 56),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
                width: 160,
                height: 160,
              ),
              const SizedBox(height: 56),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
