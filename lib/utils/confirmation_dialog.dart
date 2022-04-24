import 'package:flutter/material.dart';

Future<bool> getDialog(BuildContext context,
    {required Widget title, required Widget content, actions}) async {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: title,
          titleTextStyle: TextStyle(color: Colors.black),
          content: content,
          contentTextStyle: TextStyle(color: Colors.black),
          actions: actions ??
              [
                TextButton(
                  child: const Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
                TextButton(
                  child: const Text("Yes"),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
        );
      }).then((value) => value ?? false);
}
