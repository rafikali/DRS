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
  dynamic firsticon;
  dynamic secondicon;
  final barrierDismissile;
  final logout;
  final contentPadding;

  DialogBox(
      {this.alignment,
      this.width,
      this.insetPadding,
      this.height,
      this.barrierDismissile,
      this.firsticon,
      this.secondicon,
      this.padding,
      this.contentPadding,
      this.password,
      this.logout});

  getAlertDialogBox(BuildContext context) async {
    final _formKey = GlobalKey<FormState>();
    showDialog(
        context: context,
        barrierDismissible: barrierDismissile,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                alignment: alignment ?? Alignment.center,
                contentPadding: contentPadding ?? EdgeInsets.zero,
                insetPadding: insetPadding ?? EdgeInsets.zero,
                content: Card(
                  child: Container(
                    width: width,
                    height: height! ?? MediaQuery.of(context).size.height * 0.5,
                    padding: padding ?? EdgeInsets.zero,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            'Add Daily Update',
                            style: TextStyle(fontSize: 25),
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          LoginTextForm(
                            hintText: '2022-03-26',
                            labelText: 'Update for',
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return DatePickerDialog(
                                      firstDate: DateTime(2000),
                                      initialDate: DateTime.now(),
                                      lastDate: DateTime(2030)
                                          .add(const Duration(days: 365)),
                                    );
                                  });
                            },
                            validator: InputValidator.validateDate,
                            trailingIcon: const Icon(
                              CupertinoIcons.calendar,
                            ),
                            fillcolor: Colors.white,
                          ),
                          const SizedBox(height: 5),
                          LoginTextForm(
                            hintText: 'Daily Update [ 2022-03-26 (Sat) ]',
                            labelText: 'Title*',
                            fillcolor: Colors.white,
                            validator: InputValidator.validateDate,
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            'Mention your Productivity (Work done) of the Day *',
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 18),
                          LoginTextForm(
                            maxLine: 6,
                            hintText: 'Enter something',
                            fillcolor: Colors.white,
                            outlineBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.red,
                              ),
                            ),

                            // contentPadding: const EdgeInsets.symmetric(
                            //     horizontal: 5, vertical: 80),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                actions: [
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
              );
            }),
          );
        });
  }
}
