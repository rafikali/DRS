import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String buttonTitle;
  final buttonHeight;
  final buttonWidth;
  const LoginButton({required this.buttonTitle, this.buttonHeight, this.buttonWidth}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Text(
        buttonTitle,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: <Color>[Colors.deepPurpleAccent, Colors.black]),
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(8)),
      width: buttonWidth,
      height: buttonHeight,
      alignment: Alignment.center,
    );
  }

}
