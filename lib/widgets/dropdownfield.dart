import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_textfield.dart';

class DropdownList extends StatelessWidget {
  final Icon? dropDownIcon;

  const DropdownList({Key? key, this.dropDownIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0,right: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              width: 70,
            ),

            Flexible(
                flex: 1,
                child: LoginTextForm(
                  hintText: 'Enter name',
                  labelText: 'Province',
                  trailingIcon: dropdo, color: Color(0xFF6C63FF),
                  width: 20,
                  height: 10,)),

            const SizedBox(
              width: 10,
            ),

            Flexible(
                flex: 1,
                child: LoginTextForm(
                  hintText: 'enter ',
                  labelText: 'City',
                  trailingIcon:  Icon(CupertinoIcons.chevron_down_circle_fill, color: const Color(0xFF6C63FF),),
                )),

          ],
        ),
      ),
    );
  }
}
