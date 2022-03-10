
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/widgets/login_textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/listtile.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/Register';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.black87, Color(0x7C7A9FE8), ]
        )
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color(0x7C7A9FE8),

        ),

          // PreferredSize(
        //   preferredSize: const Size.fromHeight(200.0),
        //   child: AppBar(
        //     backgroundColor: Colors.indigo[600],
        //     shape: const RoundedRectangleBorder(
        //       borderRadius: BorderRadius.vertical(
        //         bottom: Radius.elliptical(150, 35),
        //       )
        //     ),
        //
        //   ),
        //
        // ),
        body: Padding(
          padding:  const EdgeInsets.all(10.0),
          child: ListView(

            shrinkWrap: true,
            children:   [
               const ListTileRegister(
            leadingIcon: CupertinoIcons.profile_circled,
              hint: 'Enter fullname',
              label: 'Full Name',
              ),

              const ListTileRegister(
                 leadingIcon: CupertinoIcons.mail_solid,
                 hint: 'Enter Email',
                 label: 'Email'),

              const ListTileRegister(
                 leadingIcon: CupertinoIcons.phone_fill,
                 hint: 'Phone Number',
                 label: 'Phone'),

              const ListTileRegister(
                 leadingIcon: CupertinoIcons.mail,
                 hint: 'Enter Email',
                 label: 'Email'),

              const ListTileRegister(
                 leadingIcon: CupertinoIcons.home,
                 hint: 'Enter Address',
                  label: 'Address'),
               SizedBox(
                 height: 6,
               ),

               Container(
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
                           trailingIcon: const Icon(CupertinoIcons.chevron_down_circle_fill),
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
                             trailingIcon: const Icon(CupertinoIcons.chevron_down_circle_fill),
                           )),

                     ],
                   ),
                 ),
               )

            ],
                ),
              ),

          ),

    );
  }
}


