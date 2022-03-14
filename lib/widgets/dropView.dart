import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/widgets/dropdownfield.dart';

import 'login_textfield.dart';

class DropView extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData? dropTrailing;
  final height;
  final width;
   DropView({Key? key,  required this.hintText, required this.labelText, this.dropTrailing, this.height, this.width}) : super(key: key);

   List<String> list = [
    'text 1',
    'text 2',
    'text 3'

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,

         height:height,
         width: width,
         child: Flexible(
           child: DropdownButton(items:  list.map((String e) {
             return DropdownMenuItem(value: e,
               child: Text(e),
             );
           }).toList(),

             onChanged: (e) {
               print(e.toString());
             },),
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
