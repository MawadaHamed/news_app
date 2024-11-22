import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF39A552);
  static const Color black = Color(0xFF303030);
  static const Color red = Color(0xFFC91C22);
  static const Color white = Color(0xFFFFFFFF);
  static const Color navy = Color(0xFF4F5A69);
  static const Color gray = Color(0xFF4F5A69);

  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        foregroundColor: white,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32))),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: white,
          ),
          titleSmall: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: primary)));
}
