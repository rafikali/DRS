// TODO Implement this library.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/utils/input_validators.dart';
import 'package:login_page/widgets/appbar.dart';
import 'package:login_page/widgets/login_button.dart';
import 'package:login_page/widgets/login_textfield.dart';

class CreateNewPass extends StatelessWidget {
  static const String routeName = '/newpass';
  final controller;

  const CreateNewPass({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: NewPassAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SizedBox(
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

                const Text('Your new password must be different from previous used passwords.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xF2727272),

                  ),),

                SingleChildScrollView(
                  child: Wrap(
                    runSpacing: 12,
                    children: [
                      const Text('Password'),
                      LoginTextForm(
                        validator: InputValidator.validatePassword,
                          hintText: 'New Password',
                        trailingIcon:  const Icon(CupertinoIcons.eye, color: Colors.black,)
                      ),
                      const Text('Confirm Password'),
                      LoginTextForm(
                        validator: InputValidator.validatePassword,
                        hintText: 'Confirm Password',
                        trailingIcon:  const Icon(CupertinoIcons.eye_slash),
                      ),

                    ],
                  ),
                ),

                Button(
                  buttonTitle: 'Reset Password',
                  buttonHeight: 50.0,
                  validFunc: () {
                    if(_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, HomePage.routeName);
                    }

                  },

                 )



              ],
            ),
          ),
        ),
      ),


    );

  }
}
