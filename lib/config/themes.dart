import 'package:flutter/material.dart';

class Themes {

  static const Color primaryColor = Color(0xFFFACC15);

  static ThemeData appTheme() {
    return ThemeData(
        fontFamily: 'PlusJakartaSans',
        primaryColor: primaryColor,
        colorScheme: lightThemeColors(),
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder()
        )
    );
  }

  static ColorScheme lightThemeColors() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Color(0xFF505050),
      secondary: Color(0xFF334155),
      onSecondary: Color(0xFFEAEAEA),
      error: Color(0xFFF32424),
      onError: Color(0xFFF32424),
      background: Color(0xFFF1F2F3),
      onBackground: Color(0xFFFFFFFF),
      surface: Color(0xFF54B435),
      onSurface: Color(0xFF54B435),
    );
  }

}