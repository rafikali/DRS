
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_page/Constants/Images.dart';
import 'package:login_page/pages/register_page.dart';
import 'package:login_page/utils/input_validators.dart';
import 'package:login_page/widgets/buttons.dart';
import 'package:login_page/widgets/login_textfield.dart';

import '../widgets/create_account.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  final TextEditingController? userController;
  final TextEditingController? passController;

  const LoginPage({this.passController, this.userController}) : super();

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<LoginPage> {
  String loginIllustrate = 'assets/Images/login_image.svg';

  final _formKey = GlobalKey<FormState>();

  moveToHome() async {
    if(_formKey.currentState!.validate()) {
      await Navigator.pushNamed(context, RegisterPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF16165E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                 const SizedBox(height: 50,),
                SvgPicture.asset(
                  loginIllustrate,
                  height: 330,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),

                 LoginTextForm(
                  dataController: widget.userController,
                  hintText: 'Enter your username',
                  labelText: 'Username',
                  validator: InputValidator.validateName,
                  accountIcon: const Icon(CupertinoIcons.profile_circled,
                  color: Colors.black,),

                ),

                 LoginTextForm(
                  dataController: widget.passController,
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  validator: InputValidator.validatePassword,
                  requiredMsg: 'Password required*',
                  accountIcon: const Icon(CupertinoIcons.lock_circle_fill,
                      color: Colors.black ),
                  passView: true,

                ),

                const SizedBox(
                  height: 20,
                ),

                 LoginButton(
                   buttonTitle: 'Login',
                   buttonHeight: 45.0,
                   buttonWidth: 330.0,
                   validFunc:(){
                     moveToHome();
                   },),

                const SizedBox(
                  height: 25,
                ),

                //edit
                const CreateAcc(),
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
      ),
    );
  }
}
