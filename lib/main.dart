import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/routes/app_routes.dart';
import 'package:routine/routes/app_pages.dart';
import 'core/themes/theme.dart';
import 'modules/controllers/name_controller.dart';

void main() {
  Get.put(NameController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.start,
    ),
  );
}
