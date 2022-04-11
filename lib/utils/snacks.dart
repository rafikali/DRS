import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Snacks {
  static getSnackBar(
    BuildContext context,
    String message,
  ) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    ));
  }
}
