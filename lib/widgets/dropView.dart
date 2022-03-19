import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/input_validators.dart';
import 'package:login_page/widgets/dropdownfield.dart';

import 'login_textfield.dart';

class DropView extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData? dropTrailing;
  final height;
  final dropdownValidator;
  final width;
  final String? date;
  final List<dynamic>? dropdownItems;

   DropView({Key? key,  required this.hintText, required this.labelText, this.dropTrailing, this.height, this.width, this.date, this.dropdownItems, this.dropdownValidator}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Container(
         height:height,
         width: width,
         child: DropdownButtonFormField<dynamic>(

           menuMaxHeight: 100,
           autovalidateMode: AutovalidateMode.always,
           validator: dropdownValidator,
           hint: Text(date!),
           items:  dropdownItems!.map((dynamic e) {
           return DropdownMenuItem(value: e,
             child: Text(e.toString()),
           );
         }).toList(),

           onChanged: (e) {
             print(e.toString());
           },),
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
