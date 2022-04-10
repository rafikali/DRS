import 'package:flutter/material.dart';

class MyActionChip extends StatelessWidget {
  final Widget label;
  final Widget? avatar;
  final Function() onPress;
  const MyActionChip({required this.label, this.avatar, required this.onPress})
      : super();

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      backgroundColor: Colors.green,
      label: label,
      onPressed: onPress,
      avatar: avatar ?? null,
    );
  }
}
