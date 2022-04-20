import 'package:flutter/material.dart';

var setLightTheme = ThemeData(
    primaryColor: Colors.red,
    brightness: Brightness.light,
    visualDensity: const VisualDensity(horizontal: 2.0, vertical: 2.0),
    backgroundColor: const Color(0xFF6C63FF),

    // dividerColor: Colors.white54,
    scaffoldBackgroundColor: const Color(0xFFF3F3F3),
    cardColor: Colors.white,
    textTheme: const TextTheme(
      headline4: TextStyle(
        color: Colors.black,
      ),
      bodyText1: TextStyle(color: Colors.black, fontSize: 15),
      bodyText2: TextStyle(color: Colors.black, fontSize: 15),
      headline6: TextStyle(color: Colors.black),
      headline3: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    ),
    // primaryIconTheme: IconThemeData(color: Colors.white),
    dialogBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        color: Color(0xFF6C63FF),
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actionsIconTheme: IconThemeData(color: Colors.white)),
    iconTheme: const IconThemeData(
      color: Colors.black,
      // size: 20.0,
      opacity: 10,
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.green),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: Colors.blue,
      ),
      backgroundColor: Color(0xFF6C63FF),
    ));
