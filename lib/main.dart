import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import SystemChrome
import 'package:get/get.dart';
import 'package:routine/routes/app_routes.dart';
import 'package:routine/routes/app_pages.dart';
import 'core/themes/theme.dart';
import 'modules/controllers/name_controller.dart';
import 'modules/controllers/today_controller.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  Get.put(NameController());
  Get.put(TodayController());

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
