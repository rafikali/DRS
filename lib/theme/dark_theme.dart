import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: Colors.black,
  dialogBackgroundColor: Colors.white,
  fontFamily: 'Gotham',
  cardColor: Colors.black54,
  textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 50),
      headline2: TextStyle(fontSize: 40),
      headline3: TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
      headline4: TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
      headline5: TextStyle(color: Colors.white, fontSize: 20),
      headline6: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
      // caption: TextStyle(color: Colors.black),
      bodyText1: TextStyle(color: Colors.white, fontSize: 15),
      // bodyText1: TextStyle()
      bodyText2: TextStyle(color: Colors.white, fontSize: 15),
      subtitle1: TextStyle(
        color: Colors.white,
      ),
      subtitle2: TextStyle(
        color: Colors.white,
      )),
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


// textTheme: const TextTheme(
//     headline4: TextStyle(
//       color: Colors.black,
//     ),
//     headline6: TextStyle(color: Colors.white),

//     bodyText1: TextStyle(color: Colors.white, fontSize: 15),
//     // bodyMedium: const TextStyle(color: Colors.white, fontSize: 25),
//     // displaySmall: TextStyle(color: Colors.white),
//     bodyText2: TextStyle(color: Colors.white, fontSize: 15),
//     subtitle1: TextStyle(
//       color: Colors.black54,
//     ),
//     subtitle2: TextStyle(
//       color: Colors.black54,
//     ),
    
//   ),