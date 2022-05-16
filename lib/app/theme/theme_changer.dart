import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/app_constants.dart';

class ThemeChanger with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get getThemeMode => _themeMode;
  void setTheme(ThemeMode theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (theme == ThemeMode.dark) {
      prefs.setBool(AppConstants.storedtheme, true);
    } else {
      prefs.setBool(AppConstants.storedtheme, false);
    }
    _themeMode = theme;
    notifyListeners();
  }

  ThemeChanger() {
    getTheme();
  }

  getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(AppConstants.storedtheme) ?? false) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
