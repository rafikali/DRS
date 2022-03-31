import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/pages/change_pass.dart';
import 'package:login_page/pages/login_page.dart';

class MyDrawer extends StatefulWidget {
  List<Contents>? data;

  MyDrawer({Key? key, this.data}) : super(key: key);

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
                        onTap: () async {
                          Navigator.pushNamed(context,
                              widget.data![index].routeName.toString());
                        },
                        leading: Icon(widget.data![index].iconName),
                        title: Text(widget.data![index].title.toString()),
                      );
                    }),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ChangePassword.routeName);
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.fingerprint,
                        color: Colors.red,
                      ),
                      title: Text(
                        'Change Password',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                    child: const ListTile(
                      leading: Icon(
                        CupertinoIcons.profile_circled,
                        color: Color(0xFF6C63FF),
                      ),
                      title: Text(
                        'Log Out',
                        style: TextStyle(color: Color(0xFF6C63FF)),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Contents {
  final IconData? iconName;
  final String? title;
  final String? routeName;

  Contents({this.iconName, this.routeName, this.title});
}
