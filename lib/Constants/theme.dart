// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final setLightTheme = _buildLightTheme();
final setDarkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  return ThemeData(
      primaryColor: const Color(0xFF343434),
      brightness: Brightness.light,
      visualDensity: VisualDensity(horizontal: 2.0, vertical: 2.0),
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: Colors.white54,
      scaffoldBackgroundColor: const Color(0xFFF3F3F3),
      cardColor: Colors.red,
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.white)),
      iconTheme: IconThemeData(color: Colors.black87, size: 15.0, opacity: 10));
}

ThemeData _buildDarkTheme() {
  return ThemeData(
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      cardColor: Colors.yellow,
      visualDensity: VisualDensity(horizontal: 2.0, vertical: 2.0),
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black12,
      iconTheme:
          const IconThemeData(color: Colors.white, size: 15.0, opacity: 10));
}
