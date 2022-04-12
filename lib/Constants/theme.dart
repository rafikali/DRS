// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';

final setLightTheme = _buildLightTheme();
final setDarkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  return ThemeData(
      primaryColor: const Color(0xFF6C63FF),
      brightness: Brightness.light,
      visualDensity: const VisualDensity(horizontal: 2.0, vertical: 2.0),
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: Colors.white54,
      scaffoldBackgroundColor: const Color(0xFFF3F3F3),
      cardColor: Colors.black,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        ),
        headline3: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      appBarTheme: const AppBarTheme(
          color: Color(0xFF6C63FF),
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.white)),
      iconTheme:
          const IconThemeData(color: Colors.black87, size: 15.0, opacity: 10));
}

ThemeData _buildDarkTheme() {
  return ThemeData(
      primaryColor: const Color(0xFF6C63FF),
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
      ),
      brightness: Brightness.dark,
      cardColor: Colors.black,
      visualDensity: const VisualDensity(horizontal: 2.0, vertical: 2.0),
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black12,
      appBarTheme: const AppBarTheme(
          color: Color(0xFF6C63FF),
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
          iconTheme: IconThemeData(color: Colors.white, opacity: 10)));
}
