import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final String title;

  const SimpleButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 130,
      child: Text(
        title,
        softWrap: true,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0), color: Colors.white),
    );
  }
}
