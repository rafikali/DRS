import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login_page/widgets/login_textfield.dart';

class LoginButton extends StatefulWidget {
  final String buttonTitle;
  final buttonHeight;
  final Function() validFunc;
  final buttonWidth;
  const LoginButton({required this.buttonTitle, this.buttonHeight, this.buttonWidth, required this.validFunc}) : super();

  @override

  State<LoginButton> createState() => _LoginButtonState();

}




class _LoginButtonState extends State<LoginButton> {
  // Bool changeButton;


  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   changeButton = !changeButton;
    // });
    return InkWell(
      onTap: widget.validFunc,
        child: Container(
          child:  Text(
            widget.buttonTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            // boxShadow:  const [
            //   BoxShadow(
            //     color: Color(0xFFCFCFCF),
            //     spreadRadius: 5,
            //     blurRadius: 7,
            //     offset: Offset(1,2)
            //   )
            // ],

              gradient: const LinearGradient(
                  colors: <Color>[Colors.deepPurpleAccent, Colors.black]),
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.circular(8)),
          width: widget.buttonWidth,
          height: widget.buttonHeight,
          alignment: Alignment.center,
        ),

    );
  }
}
