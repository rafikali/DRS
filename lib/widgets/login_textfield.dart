import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginTextForm extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool? passView;
  final Color? iconColor;
  final Icon? accountIcon;
  final Border? outlineBorder;
  // ignore: use_key_in_widget_constructors
  const LoginTextForm(
      {required this.hintText, required this.labelText, this.accountIcon,  this.iconColor,  this.passView, this.outlineBorder})
      : super();

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool? passView;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: TextFormField(
        obscureText: widget.passView == true,

        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: const UnderlineInputBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4)),

            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Colors.blue,
            ),
          ),
          labelText: widget.labelText,
          hintText: widget.hintText,
          prefixIcon: widget.accountIcon,
          //
          prefixIconColor: Colors.green,

        ),

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

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        hintText: 'Enter your username',
        labelText: 'Username',
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid
          )
        )
      ),

    );
  }
}

