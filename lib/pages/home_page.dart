import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/widgets/login_button.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250.0),
        child: AppBar(

          automaticallyImplyLeading: false,
          elevation: 2,
          backgroundColor: const Color(0xFF6C63FF),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(200, 40),

              )
          ),


          actions:  [
            Container(
              height: 120,
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(CupertinoIcons.moon, color: Colors.white, ),
                  Icon(CupertinoIcons.profile_circled, color: Colors.white),
                  Icon(CupertinoIcons.settings_solid, color: Colors.white),
                ],
              )

            )

          ],
          flexibleSpace: Center(
            child: Container(
              height: 120,
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Wrap(
                  runSpacing: 10.0,
                  spacing: 1,
                  alignment: WrapAlignment.center,
                  direction: Axis.vertical,


                  children:  [
                    SimpleButton(title: 'Checked In :' + AppConstants.mobileNumber,

                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    SimpleButton(title: 'Checked Out :',),
                  ],
                ),
              ),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const SizedBox(
              //       height: 10,
              //     ),
              //     SimpleButton(),
              //     const SizedBox(
              //       height: 8,
              //     ),
              //     SimpleButton(),
              //   ],
              // ),
            ),
          ),

        ),
      ),
      body: const Center(child: Text('Welcome to your profile')),

    );
  }
}


