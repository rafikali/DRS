import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class LoginTextForm extends StatefulWidget {
  dynamic trailingIcon;
  final String? labelText;
  final String hintText;
  final int? maxLength;
  bool? passView;
  final typeKeyboard;
  final validator;
  Alignment? textalign;
  dynamic contentPadding;
  final fillcolor;
  dynamic height;
  final int? maxLine;
  dynamic width;
  final String? username;
  final String? password;
  final Color? iconColor;
  final Icon? accountIcon;
  final OutlineInputBorder? outlineBorder;
  dynamic requiredMsg;
  final bool readonly;
  final autofillHints;
  final VoidCallback? onTap;

  final TextEditingController? dataController;

  // ignore: use_key_in_widget_constructors
  LoginTextForm(
      {required this.hintText,
      this.autofillHints,
      this.contentPadding,
      this.labelText,
      this.validator,
      this.passView,
      this.trailingIcon,
      this.dataController,
      this.requiredMsg,
      this.accountIcon,
      this.fillcolor,
      this.iconColor,
      this.height,
      this.width,
      this.outlineBorder,
      this.textalign,
      this.username,
      this.password,
      this.typeKeyboard,
      this.maxLine,
      this.readonly = false,
      this.onTap,
      this.maxLength})
      : super();

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: widget.autofillHints,
      onTap: widget.onTap,
      maxLength: widget.maxLength,
      keyboardType: widget.typeKeyboard,
      obscureText: widget.passView == true,
      controller: widget.dataController,
      maxLines: widget.maxLine ?? 1,
      // enabled: widget.enabled,
      readOnly: widget.readonly,
      validator: widget.validator,
      // onTap: widget.onTap,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        iconColor: const Color(0xFF6C63FF),
        errorStyle: const TextStyle(
          color: Color(0xFFB00020),
          letterSpacing: 0.2,
          fontWeight: FontWeight.w500,
        ),

        filled: true,
        fillColor: widget.fillcolor ?? Colors.grey[200],
        border: widget.outlineBorder ??
            const UnderlineInputBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(4),
                  bottomRight: const Radius.circular(4)),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Colors.red,
              ),
            ),

        hoverColor: Colors.black,
        focusedBorder: widget.outlineBorder ??
            const UnderlineInputBorder(
                borderSide: BorderSide(
                    style: BorderStyle.solid, color: Color(0xFF6C63FF))),
        labelStyle: const TextStyle(color: Color(0xFF6C63FF)),

        suffixIconColor: Theme.of(context).iconTheme.color,
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
                child: ClipRRect(child: (signLogo)),
              ),
            )),
      ],
    );
  }
}
