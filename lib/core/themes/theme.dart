import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData darkTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0x2C2C2C),
          onPrimary: Color(0xF9f9f7),
          secondary: Color(0x2283E2),
          onSecondary: Color(0x202020),
          error: Color(0xE14646),
          onError: Color(0xF9f9f7),
          surface: Color(0x202020),
          onSurface: Color(0xF9F9F7)));
  static final ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xF1F1EF),
          onPrimary: Color(0x8F8F8D),
          secondary: Color(0x2283E2),
          onSecondary: Color(0x202020),
          error: Color(0xE14646),
          onError: Color(0x8F8F8D),
          surface: Color(0xF9F9F7),
          onSurface: Color(0x8F8F8D)));
}
