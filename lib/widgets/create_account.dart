import 'package:flutter/material.dart';
import 'package:login_page/pages/register_page.dart';

class CreateAcc extends StatelessWidget {
  const CreateAcc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Forgot password?',
          style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
               fontSize: 16),

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
            Navigator.pushNamed(context, RegisterPage.routeName);
          },

          child: const Text(
            'Create new account',
            style: TextStyle(
              color: Colors.white,
                decoration: TextDecoration.underline, fontSize: 16),
          ),
        )
      ],
    );
  }
}
