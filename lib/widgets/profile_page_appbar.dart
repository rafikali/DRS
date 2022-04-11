import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Constants/Images.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/pages/login_page.dart';
import 'package:login_page/utils/confirmation_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/change_pass.dart';

class Profile extends StatefulWidget {
  static const String routeName = 'profile';

  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Stack(
                children: [
                  Container(
                    height: 160,
                    color: Colors.black,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.width * 0.28,
                    left: MediaQuery.of(context).size.width * 0.35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          child: CircleAvatar(
                            // foregroundColor: Colors.white,
                            radius: 55,

                            backgroundImage: AssetImage(ImageConstants.profile),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ChangePassword.routeName);
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.fingerprint,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Change Password',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                InkWell(
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
                  child: const ListTile(
                    leading: Icon(
                      CupertinoIcons.profile_circled,
                      color: Color(0xFF6C63FF),
                    ),
                    title: Text(
                      'Log Out',
                      style: TextStyle(color: Color(0xFF6C63FF)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
