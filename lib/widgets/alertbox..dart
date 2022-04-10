import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogBox {
  final String? password;
  final Alignment? alignment;
  dynamic insetPadding;
  final Function()? submitFunc;
  dynamic height;
  dynamic padding;
  dynamic width;
  final List<Widget>? action;
  final IconData? firsticon;
  final EdgeInsetsGeometry? dialogBoxPadding;
  final IconData? secondicon;
  final Widget? content;
  final bool? barrierDismissile;
  final contentPadding;

  DialogBox({
    this.alignment,
    this.action,
    this.width,
    this.submitFunc,
    required this.content,
    this.insetPadding,
    this.dialogBoxPadding,
    this.height,
    required this.barrierDismissile,
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
                content: content ?? Container(),
                actions: action ??
                    [
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
                        child: InkWell(
                          onTap: () {
                            submitFunc;
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
              ),
            );
          });
        });
  }
}
