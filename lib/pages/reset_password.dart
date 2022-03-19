import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/pages/create_new_password.dart';
import 'package:login_page/widgets/login_button.dart';
import 'package:login_page/widgets/login_textfield.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = '/forgotpass';
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F3F3),
        elevation: 0,


        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Back',
              style: TextStyle(
                fontSize: 20
              ),),
              Icon(CupertinoIcons.question_circle)
            ]
          ),
        )
      ),
      body: Padding(

        padding: const EdgeInsets.all(24.0),
        child: Container(
          child: Wrap(
            spacing: 15,
            runSpacing: 30,
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
                 children: [const Text('Mobile Phone'),
                   LoginTextForm(
                       hintText: 'Enter Mobile no.'),],
               ),




              LoginButton(
                buttonTitle: 'Send OTP',
                buttonHeight: 50.0,
                validFunc: () {
                  Navigator.pushNamed(context, CreatenewPass.routeName);
                },
              ),


            ],
          ),

        ),
      ),
    );
  }
}
