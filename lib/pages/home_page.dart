// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_page/Constants/Images.dart';
import 'package:login_page/widgets/buttons.dart';
import 'package:login_page/widgets/login_textfield.dart';

import '../widgets/create_account.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';


  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String loginIllustrate = 'assets/Images/login_image.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[600],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                loginIllustrate,
                height: 330,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 10,
              ),
              LoginTextForm(
                hintText: 'Enter your username',
                labelText: 'Username',
                accountIcon: Icon(CupertinoIcons.profile_circled,
                color: Colors.black,),

              ),

              LoginTextForm(
                hintText: 'Enter your password',
                labelText: 'Password',
                accountIcon: Icon(CupertinoIcons.lock_circle_fill,
                    color: Colors.black ),
                passView: true,

              ),
              const SizedBox(
                height: 20,
              ),
              LoginButton(buttonTitle: 'Login', buttonHeight: 45.0, buttonWidth: 330.0,),
              // Container(
              //   child: const Text(
              //     'Login',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //       letterSpacing: 1.2,
              //     ),
              //   ),
              //   decoration: BoxDecoration(
              //       gradient: const LinearGradient(
              //           colors: <Color>[Colors.deepPurpleAccent, Colors.black]),
              //       color: Colors.indigoAccent,
              //       borderRadius: BorderRadius.circular(8)),
              //   width: 325,
              //   height: 45,
              //   alignment: Alignment.center,
              // ),
              const SizedBox(
                height: 20,
              ),
              //edit
              CreateAcc(),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInButtons(signLogo: SvgPicture.asset(ImageConstants.googleLogo,)),
                  SignInButtons(signLogo: SvgPicture.asset(ImageConstants.facebookLogo,)),
                  SignInButtons(signLogo: SvgPicture.asset(ImageConstants.linkedinLogo,))

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
