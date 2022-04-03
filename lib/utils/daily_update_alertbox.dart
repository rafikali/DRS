import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/login_textfield.dart';
import 'input_validators.dart';
class DailyUpdateAlertBox extends StatefulWidget {
  final double? height;
  final EdgeInsetsGeometry? padding;
   DailyUpdateAlertBox({Key? key, this.height, this.padding}) : super(key: key);

  @override
  State<DailyUpdateAlertBox> createState() => _DailyUpdateAlertBoxState();
}

class _DailyUpdateAlertBoxState extends State<DailyUpdateAlertBox> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: widget.height ?? MediaQuery.of(context).size.height * 0.5,
        padding: widget.padding ?? EdgeInsets.zero,
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
    );
  }
}
