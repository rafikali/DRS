import 'package:flutter/material.dart';
import 'package:login_page/pages/create_new_password.dart';
import 'package:login_page/pages/reset_password.dart';
import 'package:login_page/pages/verify_otp.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/newregister.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch(settings.name) {
      case LoginPage.routeName:
      return MaterialPageRoute(builder: (context) =>  LoginPage());
      case Register.routeName:
        return MaterialPageRoute(builder: (context) => const Register());

      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());

      case ForgotPassword.routeName:
        return MaterialPageRoute(builder: (context) =>  const ForgotPassword());

      case CreateNewPass.routeName:
        return MaterialPageRoute(builder: (context) =>  const CreateNewPass());

      case VerifyOtp.routeName:
        return MaterialPageRoute(builder: (context) =>  VerifyOtp());


    default:
    return MaterialPageRoute(builder: (context) =>  LoginPage());

    }

  }
}