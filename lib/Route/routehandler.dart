
import 'package:flutter/material.dart';
import '../pages/home_page.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch(settings.name) {
      case HomePage.routeName:
      return MaterialPageRoute(builder: (context) => HomePage());

    default:
    return MaterialPageRoute(builder: (context) => HomePage());
    }

  }
}