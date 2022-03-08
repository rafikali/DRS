

import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/register_page.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch(settings.name) {
      case HomePage.routeName:
      return MaterialPageRoute(builder: (context) => HomePage());
      case RegisterPage.routeName:
        return MaterialPageRoute(builder: (context) => RegisterPage());

    default:
    return MaterialPageRoute(builder: (context) => HomePage());
    }

  }
}