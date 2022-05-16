import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../app/Constants/Images.dart';
import '../auth/view/changing_new_password.dart';

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
          //  mainAxisAlignment: MainAxisAlignment,
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
                            center: const Text(
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

                const ListTile(
                  leading: Icon(
                    CupertinoIcons.profile_circled,
                    color: Color(0xFF6C63FF),
                  ),
                  title: Text(
                    'Log Out',
                    style: TextStyle(color: Color(0xFF6C63FF)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
