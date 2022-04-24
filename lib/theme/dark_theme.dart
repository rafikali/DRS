import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  textTheme: TextTheme(
    headline4: TextStyle(
      color: Colors.black,
    ),
    headline6: TextStyle(color: Colors.white),

    bodyText1: TextStyle(color: Colors.white, fontSize: 15),
    // bodyMedium: const TextStyle(color: Colors.white, fontSize: 25),
    // displaySmall: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white, fontSize: 15),
  ),
  brightness: Brightness.dark,
  backgroundColor: Colors.black,
  dialogBackgroundColor: Colors.white,
  cardColor: Colors.black,
  visualDensity: const VisualDensity(horizontal: 2.0, vertical: 2.0),
  // dividerColor: Colors.black12,
  buttonTheme: const ButtonThemeData(colorScheme: ColorScheme.light()),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.white, opacity: 10,
      //  size: 20
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.green, foregroundColor: Colors.white),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: Colors.green,
    selectedIconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
);
