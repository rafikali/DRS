import 'dart:convert';
// ignore: unused_import
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:login_page/utils/header.dart';
import 'package:login_page/utils/input_validators.dart';
import 'package:login_page/utils/pref_services.dart';
import 'package:login_page/widgets/checkbox_listtile.dart';
import 'package:login_page/widgets/login_button.dart';
import '../../app/Constants/Images.dart';
import '../../app/Constants/api_endpoints.dart';
import '../../app/Constants/app_constants.dart';
import '../../repo/models/login_response.dart';
import '../../screens/home_page.dart';
import '../../widgets/create_account.dart';
import '../../widgets/my_textfield.dart';


// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  final Padding? padding;

  bool? toogleView;
  bool? changeButton;

  LoginPage({Key? key, this.padding, this.changeButton, this.toogleView})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Future fetchLogin(
    String username, String password, BuildContext context) async {
  try {
    print("Inside login");
    Response? response = await http.post(
      Uri.parse(ApiEndpoints.devBaseUrl + ApiEndpoints.login),
      body: jsonEncode({"username": username, "password": password}),
      headers: await getHeader(),
    );
    var jsonResponse = jsonDecode(response.body);
    var loginResponse = LoginResponse.fromJson(jsonResponse);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      if (loginResponse.data != null) {
        await PrefsServices()
            .setString(AppConstants.accessToken, loginResponse.data!);
      }
      print(loginResponse.data);

  
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.routeName, (Route<dynamic> route) => false);
    } else {
      // print("failed");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(loginResponse.message ?? "Invalid Credentials.")));
    }
  } on Exception catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

class _HomePageState extends State<LoginPage> {
  static final TextEditingController _usernameController =
      TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;
  bool toogleView = true;
  bool _rememberPassword = true;

  moveToHome() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      if (_rememberPassword) {
        PrefsServices()
            .setString(AppConstants.mobileNumber, _usernameController.text);
        PrefsServices()
            .setString(AppConstants.password, _passwordController.text);
      }
      fetchLogin(_usernameController.text, _passwordController.text, context);
    }
  }

  void toogle() {
    setState(() {
      toogleView = !toogleView;
    });
  }

  fillTextController() async {
    final String? mobileNumber =
        await PrefsServices().getString(AppConstants.mobileNumber);
    final String? savedPassword =
        await PrefsServices().getString(AppConstants.password);
    if (mobileNumber != null) {
      _usernameController.text = mobileNumber;
    }
    if (savedPassword != null) {
      _passwordController.text = savedPassword;
    }
  }

  @override
  void initState() {
    fillTextController();
    // fetchLogin(_usernameController.text, _passwordController.text, context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SvgPicture.asset(
                  ImageConstants.loginIllustrate,
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
                    autofillHints: [
                      _usernameController.text,
                    ],
                    hintText: 'Enter your Mobile Number',
                    labelText: 'Mobile Number',
                    validator: InputValidator.validateMobile,
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
                    autofillHints: [_passwordController.text],
                    trailingIcon: InkWell(
                      onTap: () {
                        toogle();
                      },
                      child: toogleView
                          ? const Icon(
                              CupertinoIcons.eye_slash,
                              color: Colors.black,
                            )
                          : const Icon(
                              CupertinoIcons.eye,
                              color: Colors.black,
                            ),
                    ),
                    passView: toogleView,
                    hintText: 'Enter your password',
                    labelText: 'Password',
                    validator: InputValidator.validatePassword,
                    requiredMsg: 'Password required*',
                    accountIcon: const Icon(
                      CupertinoIcons.lock_circle_fill,
                      color: Color(0xFF6C63FF),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Button(
                  // buttonColor: Color(0xFF000000),
                  buttonTitle: 'Login',
                  buttonHeight: 45.0,
                  buttonWidth: 330.0,
                  validFunc: () {
                    moveToHome();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: MyCheckBox(
                    labelTitle: 'Remember Me?',
                    onChanged: () {
                      setState(() {
                        _rememberPassword = !_rememberPassword;
                      });
                    },
                    checkValue: _rememberPassword,
                  ),
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
                            'assets/Images/google_logo.svg',
                            height: 20,
                            width: 20)),
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
