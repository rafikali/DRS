import 'package:flutter/material.dart';

Future<bool> getDialog(BuildContext context,
    {required Widget title, required Widget content}) async {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: title,
          content: content,
          actions: [
            TextButton(
              child: Text("Yes"),
              onPressed: () => Navigator.pop(context, true),
            ),
            TextButton(
              child: Text("No"),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      }).then((value) => value ?? false);
}
