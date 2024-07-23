import 'package:flutter/material.dart';

import '../../core/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(AppStrings.homeScreen),
      ),
    );
  }
}