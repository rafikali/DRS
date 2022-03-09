
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/widgets/login_textfield.dart';




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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: AppBar(
          backgroundColor: Colors.indigo[600],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(150, 35),
            )
          ),

        ),

      ),
      body: ListView(
        children:  const [
         // ListTile(
         //   leading: Icon(CupertinoIcons.profile_circled,
         //   color: Colors.blue,
         //   size: 40,),
         //   contentPadding: EdgeInsets.zero,
         //   title: LoginTextForm(hintText: 'hintText', labelText: 'hey',),
         //
         // )

        ],
      ),




    );
  }
}
