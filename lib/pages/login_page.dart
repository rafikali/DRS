import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:login_page/Constants/Images.dart';
import 'package:login_page/Constants/api_endpoints.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/pages/register_page.dart';
import 'package:login_page/utils/header.dart';
import 'package:login_page/utils/input_validators.dart';
import 'package:login_page/utils/pref_services.dart';
import 'package:login_page/utils/snacks.dart';
import 'package:login_page/widgets/login_button.dart';
import 'package:login_page/widgets/login_textfield.dart';
import '../widgets/create_account.dart';
import 'package:http/http.dart' as http;
import 'models.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  final Padding? padding;
  final TextEditingController? userController;
  final TextEditingController? passController;
  bool? toogleView;
  bool? changeButton;


   LoginPage({this.passController, this.userController, this.padding, this.changeButton, this.toogleView})
      : super();

  @override
  _HomePageState createState() => _HomePageState();
}

Future fetchLogin(String username, String password, BuildContext context) async {

  Response? response = await http.post(
    Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.login),
    body: jsonEncode({"username": username, "password": password}),
    headers: getHeader(),
  );


  var jsonResponse = jsonDecode(response.body);
  var loginResponse = LoginResponse.fromJson(jsonResponse);

  if (response.statusCode == 200 ||
      response.statusCode == 201 ||
      response.statusCode == 202) {

    if (loginResponse.data != null) {
      await PrefsServices().setString(AppConstants.accessToken, loginResponse.data!);
    }
    Snacks.getSnackBar(context, loginResponse.message??"Successfully logged in.");
    Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName , (route) => true);
  } else {
    Snacks.getSnackBar(context, loginResponse.message ??"Invalid credentials.");
  }
}

class _HomePageState extends State<LoginPage> {
  String loginIllustrate = 'assets/Images/login_image.svg';
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;
  bool toogleView = true;

  moveToHome() async {

    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      fetchLogin(_usernameController.text, _passwordController.text, context);
    }
  }

  void toogle() {
    setState(() {
      toogleView = !toogleView;
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F3F3),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SvgPicture.asset(
                  loginIllustrate,
                  height: 330,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: LoginTextForm(
                    dataController: _usernameController,
                    hintText: 'Enter your username',
                    labelText: 'Username',
                    validator: InputValidator.validateName,
                    accountIcon: const Icon(
                      CupertinoIcons.profile_circled,
                      color: Color(0xFF6C63FF),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: LoginTextForm(
                    dataController: _passwordController,
                    trailingIcon: InkWell(onTap: () {
                      toogle();
                     },
                        child: toogleView? const Icon(CupertinoIcons.eye_slash): const Icon(CupertinoIcons.eye)),
                    passView: toogleView,
                    hintText: 'Enter your password',
                    labelText: 'Password',
                    validator: InputValidator.validatePassword,
                    requiredMsg: 'Password required*',
                    accountIcon: const Icon(CupertinoIcons.lock_circle_fill,
                      color: Color(0xFF6C63FF),

                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                LoginButton(
                  buttonColor: changeButton? Color(0x7C7A9FE8):  Colors.white,
                  buttonTitle: 'Login',
                  buttonHeight: 45.0,
                  buttonWidth: 330.0,
                  validFunc: () {
                    moveToHome();
                  },
                ),

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
                    SignInButtons(
                        signLogo: SvgPicture.asset(
                      ImageConstants.googleLogo,
                    )),
                    SignInButtons(
                        signLogo: SvgPicture.asset(
                      ImageConstants.facebookLogo,
                    )),
                    SignInButtons(
                        signLogo: SvgPicture.asset(
                      ImageConstants.linkedinLogo,
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
