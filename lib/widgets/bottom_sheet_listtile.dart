import 'package:flutter/material.dart';

class BottomSheetListTile extends StatelessWidget {
  final Function()? onTap;
  final IconData leadingIcon;
  final String title;
  final Color? backgroundColor;
  final Color? color;

  const BottomSheetListTile(
      {required this.onTap,
      required this.leadingIcon,
      required this.title,
      this.backgroundColor,
      this.color})
      : super();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
        child: Icon(
          leadingIcon,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: color ?? Theme.of(context).backgroundColor),
      ),
    );
  }
}
