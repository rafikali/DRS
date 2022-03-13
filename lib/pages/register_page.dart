
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/widgets/login_textfield.dart';
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
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6C63FF)

      ),



      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.white, Colors.white]
        )
        ),
        child: Padding(
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

               const SizedBox(
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
                           trailingIcon: const Icon(CupertinoIcons.chevron_down_circle_fill, color: Color(0xFF6C63FF),),
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
               )

            ],
                ),
              ),
      ),

        );
  }
}





