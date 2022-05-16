import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const MyAppBar({Key? key, required this.title, this.actions})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      automaticallyImplyLeading: false,
      // centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      actions: actions,
    );
  }
}
