import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/input_validators.dart';
import 'package:login_page/widgets/login_textfield.dart';

class DialogBox {
  final String? password;
  final Alignment? alignment;
  dynamic insetPadding;
  dynamic height;
  dynamic padding;
  dynamic width;
  final Widget? action;
  final IconData? firsticon;
  final EdgeInsetsGeometry? dialogBoxPadding;
  final IconData? secondicon;
  final Widget? content;
  final bool? barrierDismissile;
  final contentPadding;

  DialogBox(
      {this.alignment,
        this.action,
      this.width,
       required this.content,
      this.insetPadding,
        this.dialogBoxPadding,
      this.height,
      this.barrierDismissile,
      this.firsticon,
      this.secondicon,
      this.contentPadding,
      this.password,
      });

  getAlertDialogBox(BuildContext context) async {
    final _formKey = GlobalKey<FormState>();
    showDialog(
        context: context,
        barrierDismissible: barrierDismissile!,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Padding(
              padding: dialogBoxPadding ?? EdgeInsets.zero,
              child: AlertDialog(
                alignment: alignment ?? Alignment.center,
                contentPadding: contentPadding ?? EdgeInsets.zero,
                insetPadding: insetPadding ?? EdgeInsets.zero,
                content: content  ?? Container(),
                actions: [
                  action ??
                  TextButton(
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        const CircularProgressIndicator();
                        Navigator.pop(context);
                      } else {}
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }
}
