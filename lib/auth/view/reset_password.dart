import 'package:flutter/material.dart';
import 'package:login_page/utils/input_validators.dart';
import 'package:login_page/widgets/appbar.dart';
import 'package:login_page/widgets/login_button.dart';

import '../../widgets/my_textfield.dart';
import 'otp_verfication_page.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = '/forgotpass';
  final TextEditingController? controller;

  const ForgotPassword({Key? key, this.controller}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewPassAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Wrap(
            runSpacing: 25,
            children: [
              const Text(
                'Reset password',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Enter the mobile number associated with your account and we ll send an email with instructions to reset your password.',
                softWrap: true,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xF2727272),
                ),
              ),
              Wrap(
                runSpacing: 10,
                children: [
                  const Text('Mobile Phone'),
                  LoginTextForm(
                      dataController: controller,
                      typeKeyboard: TextInputType.number,
                      validator: InputValidator.validateMobile,
                      hintText: 'Enter Mobile no.'),
                ],
              ),
              Button(
                buttonTitle: 'GET OTP',
                buttonHeight: 50.0,
                validFunc: () async {
                  if (_formKey.currentState!.validate()) {
                    // PrefsServices().setString('Mobile Num', controller.text);
                    Navigator.pushNamed(context, OtpVerification.routeName,
                        arguments: controller.text);
                  } else {  
                    return null;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
