import 'package:flutter/material.dart';
import 'package:login_page/pages/change_pass.dart';
import 'package:login_page/pages/create_new_password.dart';
import 'package:login_page/pages/my_attendances.dart';
import 'package:login_page/pages/my_daily_updates.dart';
import 'package:login_page/pages/my_dashboard.dart';
import 'package:login_page/pages/my_late_arrival.dart';
import 'package:login_page/pages/my_leaves.dart';
import 'package:login_page/pages/my_missing_checkout.dart';
import 'package:login_page/pages/reset_password.dart';
import 'package:login_page/pages/verify_otp.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/newregister.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case Register.routeName:
        return MaterialPageRoute(builder: (context) => const Register());

      case HomePage.routeName:
        return MaterialPageRoute(
            builder: (context) => const HomePage(), settings: settings);

      case ForgotPassword.routeName:
        return MaterialPageRoute(builder: (context) => const ForgotPassword());

      case CreateNewPass.routeName:
        return MaterialPageRoute(builder: (context) => const CreateNewPass());

      case VerifyOtp.routeName:
        return MaterialPageRoute(builder: (context) => VerifyOtp());

      case MyDashBoard.routeName:
        return MaterialPageRoute(
            builder: (context) => const MyDashBoard(), settings: settings);

      case MyAttendances.routeName:
        return MaterialPageRoute(builder: (context) => const MyAttendances());

      case MyLateArrival.routeName:
        return MaterialPageRoute(builder: (context) => const MyLateArrival());
      case MyLeaves.routeName:
        return MaterialPageRoute(builder: (context) => const MyLeaves());
      case MyMissingCheckout.routeName:
        return MaterialPageRoute(
            builder: (context) => const MyMissingCheckout());
      case ChangePassword.routeName:
        return MaterialPageRoute(builder: (context) => const ChangePassword());

      case MyDailyUpdates.routeName:
        return MaterialPageRoute(builder: (context) => const MyDailyUpdates());

      default:
        return MaterialPageRoute(builder: (context) => LoginPage());
    }
  }
}
