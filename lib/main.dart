import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/core/strings.dart';
import 'package:routine/routes/app_pages.dart';
import 'package:routine/routes/app_routes.dart';
import 'package:routine/themes/app_themes.dart';

void main() {
  runApp(const RoutineApp());
}

class RoutineApp extends StatelessWidget {
  const RoutineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.START,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.lightTheme,
    );
  }
}
