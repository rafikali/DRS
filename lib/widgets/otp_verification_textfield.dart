import 'package:flutter/material.dart';


class OtpInput extends StatefulWidget {
  TextEditingController? controller;
  final bool? autoFocus;
  bool? changeButton;

   OtpInput({Key? key, this.controller, this.autoFocus, this.changeButton}) : super(key: key);

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  bool changeButton = false;
  void changeHint() {
    setState(() {
      changeButton = !changeButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: TextFormField(
        maxLength: 1,
        controller: widget.controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.length == 1 ) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },

        decoration:  const InputDecoration(

          border: OutlineInputBorder(
            borderSide: BorderSide(

            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color(0xFF6C63FF)
            ),
          ),
          counterText: '',
            hintText: '0',
         ),
      ),

    );

  }

}
