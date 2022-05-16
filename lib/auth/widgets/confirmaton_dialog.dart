import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/Constants/app_constants.dart';
import '../../utils/confirmation_dialog.dart';
import '../view/login_screen.dart';

class LogoutConfirmation {
  logoutConfimationDialog(BuildContext context) async {
    final bool value = await getDialog(context,
        title: const Text("Confirm"),
        content: const Text("Do you want to logout ?"));
    if (value == true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString(AppConstants.accessToken);
      prefs.remove(AppConstants.accessToken);

      Navigator.pushNamedAndRemoveUntil(
          context, LoginPage.routeName, (route) => false);
    }
  }
}
