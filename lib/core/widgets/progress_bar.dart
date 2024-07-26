import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  final double borderRadius;

  const ProgressBar({
    super.key,
    required this.progress,
    this.borderRadius = 8.0, // Default radius, can be adjusted
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: progress),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, _) => SizedBox(
        height: 6,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      ),
    );
  }
}
