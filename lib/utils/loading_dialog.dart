import 'package:flutter/material.dart';

class LoadingAlert {
  getAlertDialogBox(
    BuildContext context,
    String title,
  ) {
    showDialog(
        context: (context),
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,

              // textAlign: TextAlign.center,
            ),
            titleTextStyle: const TextStyle(color: Colors.black, fontSize: 22),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Center(child: CircularProgressIndicator()),
              ],
            ),
          );
        });
  }
}
