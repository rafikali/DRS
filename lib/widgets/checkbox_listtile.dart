import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  final bool checkValue;
  final labelTitle;

  const CheckBox({Key? key, required this.checkValue, required this.labelTitle})
      : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxListTileState();
}

class _CheckBoxListTileState extends State<CheckBox> {
  bool checkedValue = true;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(widget.labelTitle),
      value: checkedValue,
      onChanged: (newValue) {
        setState(() {
          checkedValue = newValue!;
          print(newValue);
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
