import 'package:flutter/material.dart';


class OtpInput extends StatefulWidget {
  TextEditingController? controller;
  final bool? autoFocus;
  bool? changeButton;

   OtpInput({this.controller, this.autoFocus, this.changeButton}) : super();

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
    return Container(
      height: 50,
      width: 50,
      child: TextFormField(

        onTap: () {
        },

        maxLength: 1,

        controller: widget.controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.length == 1 ) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration:  const InputDecoration(
          border: OutlineInputBorder(

          ),
          counterText: '',
            hintText: '0',
         ),
      ),

    );

  }

}
