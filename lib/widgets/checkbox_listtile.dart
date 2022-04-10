import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  final bool checkValue;
  final Function() onChanged;
  final String labelTitle;

  const MyCheckBox(
      {Key? key,
      required this.onChanged,
      required this.checkValue,
      required this.labelTitle})
      : super(key: key);

  @override
  State<MyCheckBox> createState() => _MyCheckBoxListTileState();
}

class _MyCheckBoxListTileState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(widget.labelTitle),
      value: widget.checkValue,
      onChanged: (newValue) {
        widget.onChanged();
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
