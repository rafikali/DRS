

import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch(settings.name) {
      case LoginPage.routeName:
      return MaterialPageRoute(builder: (context) => const LoginPage());
      case RegisterPage.routeName:
        return MaterialPageRoute(builder: (context) => RegisterPage());

    default:
    return MaterialPageRoute(builder: (context) => const LoginPage());
    }

  }
}