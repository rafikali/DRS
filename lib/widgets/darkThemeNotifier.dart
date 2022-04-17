import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Class that contains all your app settings
/// Consists only of Theme setting as of now
class DarkThemeNotifier extends ChangeNotifier {
  SharedPreferences? sharedPreferences;

  // DarkThemeNotifier(this.sharedPreferences);

  Future<bool> getTheme() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return sharedPreferences?.getBool("isDarkMode") ?? false;
  }

  void setDarkMode(bool val) {
    sharedPreferences?.setBool("isDarkMode", val);
    notifyListeners();
  }
}
