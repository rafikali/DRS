import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/app_constants.dart';
import '../pages/changing_new_password.dart';
import '../pages/login_page.dart';
import 'confirmation_dialog.dart';

class MyBottomSheet {
  getBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        )),
        context: context,
        builder: (context) {
          return Column(mainAxisSize: MainAxisSize.min, children: [
            ListTile(
              onTap: () => Navigator.pushReplacementNamed(
                  context, ChangePassword.routeName),
              leading: const CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.fingerprint,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Change Password',
                style: TextStyle(color: Colors.red),
              ),
            ),
            ListTile(
              onTap: () async {
                final bool value = await getDialog(context,
                    title: const Text("Confirm"),
                    content: const Text("Do you want to logout ?"));
                if (value == true) {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.getString(AppConstants.accessToken);
                  prefs.remove(AppConstants.accessToken);

                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginPage.routeName, (route) => false);
                  // .then(
                  //       (value) => Navigator.pushNamedAndRemoveUntil(
                  //         context,
                  //         LoginPage.routeName,
                  //         (route) => false,
                  //       ),
                  //     );
                }
              },
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).backgroundColor,
                child: const Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Log Out',
                style: const TextStyle(color: Color(0xFF6C63FF)),
              ),
            ),
          ]);
        });
  }
}
