import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var setLightTheme = ThemeData(

    //  GoogleFonts.latoTextTheme(Theme.of(context).textTheme),

    primaryColor: Colors.red,
    brightness: Brightness.light,
    // primaryIconTheme: IconThemeData(color: Color(0xFF6C63FF)),
    visualDensity: const VisualDensity(horizontal: 2.0, vertical: 2.0),
    backgroundColor: const Color(0xFF6C63FF),
    primaryTextTheme: GoogleFonts.latoTextTheme(),

    // dividerColor: Colors.white54,
    scaffoldBackgroundColor: const Color(0xFFF3F3F3),
    cardColor: Colors.white,
    cardTheme: const CardTheme(
      color: Colors.white,
      elevation: 0.2,
    ),
    textTheme: GoogleFonts.openSansTextTheme(const TextTheme(
      headline1: TextStyle(fontSize: 50),
      headline2: TextStyle(fontSize: 40),
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 30,
      ),
      headline4: TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),
      headline5: TextStyle(color: Colors.black87, fontSize: 20),
      headline6: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 18),
      // caption: TextStyle(color: Colors.black),
      bodyText1: TextStyle(color: Colors.black87, fontSize: 15),
      bodyText2: TextStyle(color: Colors.black, fontSize: 15),
      subtitle1: TextStyle(
        color: Colors.black87,
      ),
      subtitle2: TextStyle(
        color: Colors.black54,
      ),
    )),

    // primaryIconTheme: IconThemeData(color: Colors.white),
    // dialogBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        color: Color(0xFF6C63FF),
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white)),
    iconTheme: const IconThemeData(
      color: Colors.black,
      // size: 20.0,
      opacity: 10,
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.green),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: Color(0xFF6C63FF),
      ),
      backgroundColor: Color(0xFF6C63FF),
    ));
