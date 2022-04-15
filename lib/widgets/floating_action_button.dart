import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyFloatingButton {
  static DateTime selectedDate = DateTime.now();
  final DateTime? pickedDate = DateTime(2000);
  static TextEditingController dateInput = TextEditingController();
  static getFloatingActionButton(BuildContext context, IconData icon) {
    return FloatingActionButton(onPressed: () async {
      DateTime pickedDate = await showDialog(
          context: context,
          builder: (context) {
            return DatePickerDialog(
              firstDate: DateTime(2000),
              initialDate: selectedDate,
              lastDate: DateTime.now().add(const Duration(days: 365)),
              initialEntryMode: DatePickerEntryMode.input,
            );
          });

      // if (pickedDate != selectedDate) {
      //   String formattedDate =
      //       DateFormat('yyyy-MM-dd').format(pickedDate);
      //   setState(() {
      //     dateInput.text = formattedDate.toString();
      //     selectedDate = pickedDate;
      //   });
      // }
    });
  }
}

// ignore: must_be_immutable
class CustomFloatingActionButton extends StatelessWidget {
  final Color? backgroundcolor;

  CustomFloatingActionButton(
      {Key? key,
      this.child = const Icon(Icons.add),
      this.backgroundcolor,
      this.onPressed})
      : super(key: key);

  Widget? child;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: backgroundcolor,
      onPressed: onPressed,
      child: child,
    );
  }
}
