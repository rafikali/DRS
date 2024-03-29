import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final String title;

  const SimpleButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 35,
        width: 130,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          softWrap: true,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
        ),
      ),
    );
  }
}
