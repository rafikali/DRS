// TODO Implement this library.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/input_validators.dart';
import 'package:login_page/widgets/appbar.dart';
import 'package:login_page/widgets/login_button.dart';

import '../../screens/home_page.dart';
import '../../widgets/my_textfield.dart';

class CreateNewPass extends StatefulWidget {
  static const String routeName = '/newPass';
  final TextEditingController? controller;

  const CreateNewPass({Key? key, this.controller}) : super(key: key);

  @override
  State<CreateNewPass> createState() => _CreateNewPassState();
}

class _CreateNewPassState extends State<CreateNewPass> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  PasswordChanged() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, HomePage.routeName);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: const NewPassAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create new password',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Your new password must be different from previous used passwords.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xF2727272),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text('Password'),
                LoginTextForm(
                    validator: InputValidator.validatePassword,
                    hintText: 'New Password',
                    dataController: _passwordController,
                    trailingIcon: const Icon(
                      CupertinoIcons.eye,
                      color: Colors.black,
                    )),
                const SizedBox(
                  height: 12,
                ),
                const Text('Confirm Password'),
                LoginTextForm(
                  validator: InputValidator.validatePassword,
                  hintText: 'Confirm Password',
                  dataController: _confirmPasswordController,
                  trailingIcon: const Icon(CupertinoIcons.eye_slash),
                ),
                const SizedBox(
                  height: 16,
                ),
                Button(
                  buttonTitle: 'Reset Password',
                  buttonHeight: 50.0,
                  validFunc: () {
                    PasswordChanged;
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
