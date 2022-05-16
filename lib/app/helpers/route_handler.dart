import 'package:flutter/material.dart';
import 'package:login_page/app/changing_new_password.dart';
import 'package:login_page/auth/view/create_new_password.dart';
import 'package:login_page/auth/view/otp_verfication_page.dart';
import 'package:login_page/auth/view/reset_password.dart';
import 'package:login_page/onboardingpages/onboarding_page.dart';
import 'package:login_page/screens/my_attendances.dart';
import 'package:login_page/screens/my_dashboard.dart';
import 'package:login_page/screens/newregister.dart';
import 'package:login_page/widgets/setting_page.dart';
import 'package:page_transition/page_transition.dart';
import '../../auth/view/login_screen.dart';
import '../../screens/home_page.dart';
import '../../screens/hr_policy.dart';
import '../../screens/my_daily_updates.dart';
import '../../screens/my_late_arrival.dart';
import '../../screens/my_leaves.dart';
import '../../screens/my_missing_checkout.dart';
import '../../screens/myleaves_transaction.dart';
import '../../screens/new_design_profile.dart';
import '../../screens/profile_page.dart';
import '../../screens/update_drs.dart';

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

      case OtpVerification.routeName:
        return MaterialPageRoute(builder: (context) => OtpVerification());

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
        return PageTransition(
          child: const ChangePassword(),
          type: PageTransitionType.fade,
        );
      case HRPolicy.routeName:
        return MaterialPageRoute(builder: (context) => const HRPolicy());

      case MySettings.routeName:
        return PageTransition(
          child: const MySettings(),
          type: PageTransitionType.rightToLeft,
        );
      case UpdateDrs.routeName:
        return PageTransition(
          child: const UpdateDrs(),
          type: PageTransitionType.fade,
        );

      case MyDailyUpdates.routeName:
        return PageTransition(
            child: const MyDailyUpdates(),
            type: PageTransitionType.bottomToTop);

      case Profile.routeName:
        return PageTransition(
            child: const Profile(), type: PageTransitionType.fade);
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (context) => const ProfilePage());

      default:
        return MaterialPageRoute(builder: (context) => const OnBoardPage());
    }
  }
}
