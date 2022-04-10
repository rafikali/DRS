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
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 130,
      ),
    ));
  }
}
