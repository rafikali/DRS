// TODO Implement this library.

import 'package:flutter/material.dart';
import 'package:login_page/widgets/appbar.dart';
import 'package:login_page/widgets/login_button.dart';
import 'package:login_page/widgets/login_textfield.dart';

class CreateNewPass extends StatelessWidget {
  static const String routeName = '/newpass';
  const CreateNewPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewPassAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Wrap(
            runSpacing: 25,
            spacing: 10,
            children: [
              const Text('Create new password',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold
              ),),

              Wrap(
                runSpacing: 12,
                children: [
                  const Text('Your new password must be different from previous used passwords.',
                  style: TextStyle(
                    fontSize: 18,

                  ),),



                  const Text('Password'),
                  LoginTextForm(
                      hintText: 'New Password'
                  ),
                  const Text('Confirm Password'),
                  LoginTextForm(
                      hintText: 'Confirm Password'),
                ],
              ),
              LoginButton(
                buttonTitle: 'Reset Password',
                buttonHeight: 50.0,

               )



            ],
          ),
        ),
      ),
    );
  }
}
