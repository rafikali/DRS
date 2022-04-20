import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<String> datePicker(BuildContext context) async {
  DateTime? pickedDate = await showDialog(
      context: context,
      builder: (context) {
        return DatePickerDialog(
          firstDate: DateTime(2000),
          initialDate: DateTime.now(),
          lastDate: DateTime.now(),
          initialEntryMode: DatePickerEntryMode.input,
        );
      });

  if (pickedDate != null) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    return formattedDate;
  } else {
    return DateTime.now().toString();
  }
}
