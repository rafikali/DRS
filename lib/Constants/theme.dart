// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';

final setLightTheme = _buildLightTheme();
final setDarkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  return ThemeData(
      primarySwatch: Colors.red,
      brightness: Brightness.light,
      visualDensity: const VisualDensity(horizontal: 2.0, vertical: 2.0),
      backgroundColor: const Color(0xFF6C63FF),
      dividerColor: Colors.white54,
      scaffoldBackgroundColor: const Color(0xFFF3F3F3),
      cardColor: Colors.black,
      textTheme: TextTheme(
        bodyText1: const TextStyle(
          color: Colors.red,
        ),
        bodySmall: const TextStyle(
          color: Colors.green,
        ),
        // bodyMedium: const TextStyle(color: Colors.white, fontSize: 25),
        bodyText2: TextStyle(color: Colors.black),
        headline3: const TextStyle(
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
      iconTheme: const IconThemeData(
        color: Colors.black87,
        size: 20.0,
        opacity: 10,
      ));
}

ThemeData _buildDarkTheme() {
  return ThemeData(
      primaryColor: Colors.black,
      textTheme: TextTheme(
        bodyText1: const TextStyle(color: Colors.white),
        // bodyMedium: const TextStyle(color: Colors.white, fontSize: 25),
        bodyText2: const TextStyle(color: Colors.white),
      ),
      brightness: Brightness.dark,
      cardColor: Colors.black,
      visualDensity: const VisualDensity(horizontal: 2.0, vertical: 2.0),
      dividerColor: Colors.black12,
      buttonTheme: const ButtonThemeData(colorScheme: ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        iconTheme: IconThemeData(color: Colors.white, opacity: 10, size: 20),
      ));
}
