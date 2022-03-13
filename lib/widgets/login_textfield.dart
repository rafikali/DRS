
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_page/pages/login_page.dart';
import 'package:login_page/pages/register_page.dart';
import 'package:login_page/widgets/login_button.dart';

class LoginTextForm extends StatefulWidget {
  dynamic trailingIcon;
  final String labelText;
  final String hintText;
  bool? passView;
  final validator;
  final height;
  final width;
  final Color? iconColor;
  final Icon? accountIcon;
  final Border? outlineBorder;
  dynamic requiredMsg;

  final TextEditingController? dataController;

  // ignore: use_key_in_widget_constructors
   LoginTextForm(
      {required this.hintText,
        required this.labelText,
        this.validator,
        this.passView,
        this.trailingIcon,
        this.dataController,
        this.requiredMsg,
        this.accountIcon,
        this.iconColor,
        this.height,
        this.width,
        this.outlineBorder,})
      : super();

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}


class _LoginTextFormState extends State<LoginTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.passView == true,
      controller: widget.dataController,
      validator: widget.validator,

      decoration: InputDecoration(
        iconColor: Color(0xFF6C63FF),
        errorStyle:   const TextStyle(
            color: Color(0xFFB00020),
          letterSpacing: 0.2,
            fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(8),
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4)),

          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.red,

          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Color(0xFFB00020)
          )
        ),

        suffixIcon: widget.trailingIcon,
        labelText: widget.labelText,
        hintText: widget.hintText,

        // labelStyle: TextStyle(
        //   color: Color(0xFF6C63FF),
        // ),
        prefixIcon: widget.accountIcon,
        prefixIconColor: Colors.green,

      ),

    );
  }
}

class SignInButtons extends StatelessWidget {
  final SvgPicture signLogo;
   const SignInButtons({Key? key, required this.signLogo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.indigo,
              radius: 15,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.white,
                child: ClipRRect(
                    child: (signLogo)),
              ),
            )),
      ],
    );
  }
}



