import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/pages/change_pass.dart';
import 'package:login_page/pages/create_new_password.dart';
import 'package:login_page/pages/login_page.dart';

class MyDrawer extends StatefulWidget {
  List<Contents>? data;

  MyDrawer({this.data}) : super();

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: ListView.builder(
                    itemCount: widget.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: widget.data![index].iconName,
                        title: Text(widget.data![index].title),
                      );
                    }),
              ),
              Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ChangePassword.routeName);
                      },
                      child: const ListTile(
                        leading: const Icon(Icons.fingerprint,
                        color: Colors.red,),
                        title: const Text('Change Password',
                        style: TextStyle(
                          color: Colors.red
                        ),),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, LoginPage.routeName);
                      },
                      child: const ListTile(
                        leading:  Icon(CupertinoIcons.profile_circled,
                        color: Color(0xFF6C63FF),),
                        title:  Text(
                          'Log Out',
                          style: TextStyle(
                            color: Color(0xFF6C63FF)
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Contents {
  dynamic iconName;
  final String title;

  Contents({required this.iconName, required this.title});
}
