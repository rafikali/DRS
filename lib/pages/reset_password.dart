import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/pages/create_new_password.dart';
import 'package:login_page/pages/verify_otp.dart';
import 'package:login_page/utils/input_validators.dart';
import 'package:login_page/utils/pref_services.dart';
import 'package:login_page/widgets/appbar.dart';
import 'package:login_page/widgets/login_button.dart';
import 'package:login_page/widgets/login_textfield.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = '/forgotpass';
  final controller;
   ForgotPassword({Key? key, this.controller}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewPassAppbar(),
      body: Padding(

        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Container(
            child: Wrap(
              runSpacing: 25,
              children:   [
                const Text('Reset password',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ),),

                const Text('Enter the mobile number associated with your account and we ll send an email with instructions to reset your password.',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xF2727272),
                ),),
                 Wrap(
                   runSpacing: 10,
                   children: [
                     Text('Mobile Phone'),
                     LoginTextForm(
                       dataController: controller,
                       typeKeyboard: TextInputType.number,
                       validator: InputValidator.validateMobile,
                         hintText: 'Enter Mobile no.'),],
                 ),






                LoginButton(
                  buttonTitle: 'GET OTP',
                  buttonHeight: 50.0,
                  validFunc: () async {
                    if(_formKey.currentState!.validate()) {
                      AppConstants.mobileNumber = controller.text;
                       // PrefsServices().setString('Mobile Num', controller.text);
                      print(controller.text);
                       Navigator.pushNamed(context, VerifyOtp.routeName, arguments: controller.text);
                    } else {
                      return null;
                    }

                  },
                ),


              ],
            ),

          ),
        ),
      ),
    );
  }
}
