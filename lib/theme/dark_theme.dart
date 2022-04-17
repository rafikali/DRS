import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    primaryColor: Colors.black,
    textTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white),
      bodyText1: TextStyle(color: Colors.white, fontSize: 15),
      // bodyMedium: const TextStyle(color: Colors.white, fontSize: 25),
      bodyText2: TextStyle(color: Colors.white, fontSize: 15),
    ),
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    cardColor: Colors.black,
    visualDensity: const VisualDensity(horizontal: 2.0, vertical: 2.0),
    dividerColor: Colors.black12,
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
    ));
