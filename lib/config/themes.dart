import 'package:flutter/material.dart';

class Themes {

  static const Color primaryColor = Color(0xFFFACC15);

  static ThemeData appTheme() {
    return ThemeData(
      fontFamily: 'PlusJakartaSans',
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white
    );
  }
}