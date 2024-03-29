import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String buttonTitle;
  final buttonHeight;
  Function()? validFunc;
  dynamic bottonRadius;
  Color? buttonColor;
  final buttonWidth;

  Button(
      {Key? key,
      required this.buttonTitle,
      this.buttonHeight,
      this.buttonWidth,
      this.validFunc,
      this.buttonColor,
      this.bottonRadius})
      : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          // border: Border.all(color: Colors(widget)widget.buttonColor),
          border: Border.all(color: Colors.white, width: 2),

          // boxShadow: const [
          //   BoxShadow(
          //       color: Color(0xFFCFCFCF),
          //       spreadRadius: 2,
          //       blurRadius: 7,
          //       offset: Offset(1, 2)),
          // ],
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xFF6C63FF), Color(0xFF3b4043)]),
          borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        // splashColor: Colors.red,

        onTap: widget.validFunc,
        // overlayColor: MaterialStateProperty.all(Colors.green),
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            child: Text(
              widget.buttonTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            // decoration: BoxDecoration(
            //   // border: Border.all(color: Colors(widget)widget.buttonColor),
            //
            //     boxShadow: const [
            //       BoxShadow(
            //           color: Color(0xFFCFCFCF),
            //           spreadRadius: 5,
            //           blurRadius: 7,
            //           offset: Offset(1, 2)
            //       ),
            //     ],
            //     gradient: const LinearGradient(
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //         colors: <Color>[Color(0xFF6C63FF), Color(0xDC000000)]),
            //     borderRadius: BorderRadius.circular(8)),
            width: widget.buttonWidth,
            height: widget.buttonHeight,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
