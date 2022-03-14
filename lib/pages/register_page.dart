

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/widgets/dropView.dart';
import 'package:login_page/widgets/login_button.dart';
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
                 leadingIcon: CupertinoIcons.home,
                 hint: 'Enter Current Address',
                  label: 'Current Address'),

              const ListTileRegister(
                 leadingIcon: CupertinoIcons.home,
                 hint: 'Enter Permanent Address',
                  label: 'Permanent Address'),



               const SizedBox(
                 height: 6,
               ),

               Container(
                 child: Padding(
                   padding: const EdgeInsets.only(left: 2.0,right: 16),
                   child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                     children:  [
                        DropView(hintText: 'here', labelText: 'here',
                        dropTrailing: CupertinoIcons.chevron_down_circle_fill,
                          height: 60.0,
                          width: 135.0,
                        ),

                       const SizedBox(
                         width: 14,
                       ),

                       DropView(hintText: 'here', labelText: 'here',
                        dropTrailing: CupertinoIcons.chevron_down_circle_fill,
                         height: 60.0,
                         width: 135.0,
                       ),


                     ],
                   ),
                 ),
               ),
              const SizedBox(
                height: 4,
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:   [
                    DropView(hintText: 'Month',
                      labelText: 'Month',
                      dropTrailing: CupertinoIcons.chevron_down_circle_fill,
                      height: 50.0,
                      width: 94.0,
                      ),

                    const SizedBox(
                      width: 4,
                    ),

                     DropView(hintText: '', labelText: 'Month', dropTrailing: CupertinoIcons.chevron_down_circle_fill,
                       height: 50.0,
                       width: 94.0,),
                     const SizedBox(
                       width: 5,
                     ),

                     DropView(hintText: 'Month', labelText: 'Month', dropTrailing: CupertinoIcons.chevron_down_circle_fill,
                       height: 50.0,
                       width: 80.0,),
                  ],
                ),
              ),

              LoginButton(buttonTitle: 'Submit' )



            ],
                ),
              ),
      ),



        );



  }
}





