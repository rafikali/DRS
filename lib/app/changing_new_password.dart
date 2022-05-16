// TODO Implement this library.

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/input_validators.dart';
import 'package:login_page/widgets/appbar.dart';
import 'package:login_page/widgets/login_button.dart';

import '../../widgets/my_textfield.dart';
import '../change_password.dart';


class ChangePassword extends StatefulWidget {
  static const String routeName = '/createpass';

  const ChangePassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String Msg = '';

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  validationCheck() async {
    if (_formKey.currentState!.validate()) {
      passwordChanged();
      print('valid');
    } else {
      return "required*";
    }
  }

  passwordChanged() async {
    await ChangePassApi()
        .changePassword(_currentPasswordController.text,
            _passwordController.text, _confirmPasswordController.text, context)
        .then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewPassAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Create new password',
                        style: Theme.of(context).textTheme.headline4),
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
                      height: 20,
                    ),
                    const Text('Current Password'),
                    LoginTextForm(
                        autofillHints: [AutofillHints.password],
                        validator: InputValidator.validatePassword,
                        hintText: 'New Password',
                        dataController: _currentPasswordController,
                        trailingIcon: const Icon(
                          CupertinoIcons.eye,
                          color: Colors.black,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Password'),
                    LoginTextForm(
                      validator: InputValidator.validatePassword,
                      hintText: 'New Password',

                      dataController: _passwordController,
                      // trailingIcon:  const Icon(CupertinoIcons.eye, color: Colors.black,)
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Confirm Password'),
                    LoginTextForm(
                      validator: InputValidator.validatePassword,
                      hintText: 'Confirm Password',
                      dataController: _confirmPasswordController,
                      trailingIcon: const Icon(CupertinoIcons.eye_slash),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Button(
                      buttonTitle: 'Reset Password',
                      buttonHeight: 50.0,
                      validFunc: () {
                        validationCheck();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
