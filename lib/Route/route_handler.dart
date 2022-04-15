import 'package:flutter/material.dart';
import 'package:login_page/onboardingpages/onboarding_page.dart';
import 'package:login_page/pages/add_daily_update.dart';
import 'package:login_page/pages/change_pass.dart';
import 'package:login_page/pages/changing_new_passing.dart';
import 'package:login_page/pages/create_new_password.dart';
import 'package:login_page/pages/hr_policy.dart';
import 'package:login_page/pages/my_attendances.dart';
import 'package:login_page/pages/my_daily_updates.dart';
import 'package:login_page/pages/my_dashboard.dart';
import 'package:login_page/pages/my_late_arrival.dart';
import 'package:login_page/pages/my_leaves.dart';
import 'package:login_page/pages/my_missing_checkout.dart';
import 'package:login_page/pages/myleaves_transaction.dart';
import 'package:login_page/pages/reset_password.dart';
import 'package:login_page/pages/verify_otp.dart';
import 'package:login_page/utils/random_transition.dart';
import 'package:login_page/widgets/setting_page.dart';
import 'package:page_transition/page_transition.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/newregister.dart';
import '../widgets/profile_page_appbar.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return PageTransition(
            child: LoginPage(), type: PageTransitionType.rightToLeft);

      case Register.routeName:
        return MaterialPageRoute(builder: (context) => const Register());
      case OnBoardPage.routeName:
        return MaterialPageRoute(builder: ((context) => const OnBoardPage()));
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
      case MyLeaveTransaction.routeName:
        return MaterialPageRoute(
            builder: (context) => const MyLeaveTransaction());
      case MyMissingCheckout.routeName:
        return MaterialPageRoute(
            builder: (context) => const MyMissingCheckout());
      case ChangePassword.routeName:
        return MaterialPageRoute(builder: (context) => const ChangePassword());
      case HRPolicy.routeName:
        return MaterialPageRoute(builder: (context) => const HRPolicy());

      case MySettings.routeName:
        return PageTransition(
          child: const MySettings(),
          type: PageTransitionType.rightToLeft,
        );
      case AddDailyUpdae.routeName:
        return PageTransition(
          child: const AddDailyUpdae(),
          type: PageTransitionType.fade,
        );

      case MyDailyUpdates.routeName:
        return PageTransition(
            child: const MyDailyUpdates(),
            type: PageTransitionType.bottomToTop);

      case Profile.routeName:
        return PageTransition(
            child: const Profile(), type: PageTransitionType.fade);

      default:
        return MaterialPageRoute(builder: (context) => const OnBoardPage());
    }
  }
}
