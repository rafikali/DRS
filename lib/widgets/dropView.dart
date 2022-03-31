import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropView extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final IconData? dropTrailing;
  dynamic dropdownheight;
  dynamic height;
  final dropdownValidator;
  dynamic width;
  final String? date;
  final List<dynamic>? dropdownItems;

  DropView(
      {Key? key,
      this.hintText,
      this.dropdownheight,
      this.labelText,
      this.dropTrailing,
      this.height,
      this.width,
      this.date,
      this.dropdownItems,
      this.dropdownValidator})
      : super(key: key);

  @override
  State<DropView> createState() => _DropViewState();
}

class _DropViewState extends State<DropView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: DropdownButtonFormField<dynamic>(
        menuMaxHeight: widget.dropdownheight ?? 100,
        autovalidateMode: AutovalidateMode.always,
        validator: widget.dropdownValidator,
        hint: Text(widget.date!),
        items: widget.dropdownItems!.map((dynamic e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e.toString()),
          );
        }).toList(),
        onChanged: (e) {
          print(e.toString());
        },
      ),
    );

    // Flexible(
    //   child: DropdownButton(items:  list.map((String e) {
    //     Icon(CupertinoIcons.chevron_down);
    //     return DropdownMenuItem(value: e,
    //     child: Text(e),
    //     );
    //   }).toList(),
    //
    //     onChanged: (e) {
    //     print(e.toString());
    //     },),
    // );
  }
}
