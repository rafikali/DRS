import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DialogBox {
  getAlertDialogBox(BuildContext context) {
    showDialog(context: context,
        builder: (context) {
     return  AlertDialog(
       alignment: Alignment.topRight,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        content: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          padding: EdgeInsets.zero,
          child: Column(
            children: const [
              ListTile(
                minLeadingWidth: 10,
                leading: FaIcon(FontAwesomeIcons.fingerprint),
                title: Text('Change Password'),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.arrowCircleRight),
                title: Text('Log Out'),
              )
            ],
          ),
        ),
      );
    });
  }
}