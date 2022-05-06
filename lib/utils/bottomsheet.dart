import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Auth_Services/logout_session.dart';
import 'package:login_page/widgets/bottom_sheet_listtile.dart';
import '../pages/changing_new_password.dart';

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
          return Column(mainAxisSize: MainAxisSize.min, children: children

              // ListTile(
              //   onTap: () => Navigator.pushReplacementNamed(
              //       context, ChangePassword.routeName),
              //   leading: const CircleAvatar(
              //     backgroundColor: Colors.red,
              //     child: Icon(
              //       Icons.fingerprint,
              //       color: Colors.white,
              //     ),
              //   ),
              //   title: const Text(
              //     'Change Password',
              //     style: TextStyle(color: Colors.red),
              //   ),
              // ),
              //  ListTile(
//               onTap: () async {
//                 LogoutConfirmation().logoutConfimationDialog(context);
//               },
//               leading: CircleAvatar(
//                 backgroundColor: Theme.of(context).backgroundColor,
//                 child: const Icon(
//                   CupertinoIcons.profile_circled,
//                   color: Colors.white,
//                 ),
//               ),
//               title: const Text(
//                 'Log Out',
//                 style: TextStyle(color: Color(0xFF6C63FF)),
//               ),
//             ),

              );
        });
  }
}
