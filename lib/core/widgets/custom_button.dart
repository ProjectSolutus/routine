import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final double borderRadius;
  final EdgeInsetsGeometry textPadding;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
    this.borderRadius = 6.0, // Default border radius
    this.textPadding = const EdgeInsets.symmetric(
        horizontal: 56, vertical: 8), // Default text padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth:
        double.infinity, // Ensures button doesn't overflow horizontally
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: textPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          minimumSize: Size.zero,
          // Ensures button size is based on content
          tapTargetSize:
          MaterialTapTargetSize.shrinkWrap, // Adjusts tap target size
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
