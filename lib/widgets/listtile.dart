import 'package:flutter/material.dart';
import 'login_textfield.dart';

class ListTileRegister extends StatelessWidget {
  final IconData? leadingIcon;
  final String hint;
  final String label;
  const ListTileRegister({this.leadingIcon, required this.hint, required this.label}) : super();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon, size: 30, color: Colors.white,),
      title: Container(
          width: MediaQuery.of(context).size.width*1/3,
          child: LoginTextForm(hintText: hint, labelText: label)),
    );

  }
}
