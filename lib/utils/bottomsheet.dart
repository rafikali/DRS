import 'package:flutter/material.dart';

class MyBottomSheet {
  final List<Widget> children;
  MyBottomSheet({required this.children});
  getBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        )),
        context: context,
        builder: (context) {
          return Column(mainAxisSize: MainAxisSize.min, children: children);
        });
  }
}
