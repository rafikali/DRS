import 'package:flutter/material.dart';
import 'package:login_page/pages/reset_password.dart';
import 'package:login_page/pages/newregister.dart';

class CreateAcc extends StatelessWidget {
  const CreateAcc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, ForgotPassword.routeName);
          },
          child: const Text(
            'Forgot password?',
            style: TextStyle(
                color: Color(0xFF6C63FF),
                decoration: TextDecoration.underline,
                fontSize: 16),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 15,
          width: 1,
          color: Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Register.routeName);
          },
          child: const Text(
            'Create new account',
            style: TextStyle(
                color: Color(0xFF6C63FF),
                decoration: TextDecoration.underline,
                fontSize: 16),
          ),
        )
      ],
    );
  }
}
