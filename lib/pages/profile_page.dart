import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Constants/Images.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/pages/login_page.dart';
import 'package:login_page/utils/confirmation_dialog.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'changing_new_passing.dart';

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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Stack(
                children: [
                  Container(
                    height: 160,
                    color: Colors.black,
                  ),
                  Positioned(
                    top: 20,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // height: MediaQuery.of(context).size.height,

                            decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage(ImageConstants.profile))),
                            height: 100,
                            width: 100,
                          ),

                          // const CircleAvatar(
                          //   backgroundColor: Colors.white,
                          //   radius: 50,
                          //   child: CircleAvatar(
                          //     // foregroundColor: Colors.white,
                          //     radius: 45,
                          //     backgroundImage:
                          //         AssetImage(ImageConstants.profile),
                          //   ),
                          // ),

                          CircularPercentIndicator(
                            animationDuration: 1200,
                            lineWidth: 8.0,
                            animation: true,
                            backgroundColor: Colors.white,
                            restartAnimation: true,
                            progressColor: Colors.green,
                            percent: 60 / 100,
                            radius: 50,
                            circularStrokeCap: CircularStrokeCap.butt,
                            center: const Text("Progress",
                                style: TextStyle(color: Colors.white)),
                          ),

                          // Expanded(
                          CircularPercentIndicator(
                            backgroundColor: Colors.white,
                            percent: 60 / 100,
                            animation: true,
                            lineWidth: 8.0,
                            animationDuration: 1200,
                            progressColor: Colors.green,
                            radius: 50,
                            center: Text(
                              "Dedication",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                // LinearPercentIndicator(
                //   animationDuration: 1000,
                //   width: 8.0,
                //   animation: true,
                //   backgroundColor: Colors.blue,
                //   restartAnimation: true,
                //   progressColor: Colors.green,
                //   percent: 60 / 100,
                //   barRadius: Radius.circular(10),
                //   leading: const Text("Progress",
                //       style: TextStyle(color: Colors.black)),
                // ),
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
