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
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children:  [
            ListTile(
              title: Row(
                children: const [
                  Icon(CupertinoIcons.profile_circled),
                  Expanded(
                    child: LoginTextForm(
                        hintText: ' username', labelText: 'Username'),
                  ),

                ],
              )

            )

            // ListTile(
            //   leading: Icon(CupertinoIcons.profile_circled,
            //   size: 30,),
            //   title: SimpleTextField(),
            //
            // )
          ],
        ),
      ),

    );
  }
}
