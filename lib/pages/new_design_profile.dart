import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Constants/Images.dart';
import 'package:login_page/widgets/login_textfield.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = 'profile_page';
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          // color: Colors.blue,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ListTile(
                title: Text(
                  'Rafik Ali',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: const Text('Flutter developer'),
                trailing: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageConstants.profile))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: LoginTextForm(
                  hintText: 'Search',
                  fillcolor: Colors.white,
                  trailingIcon: const Icon(
                    CupertinoIcons.search,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'My Task',
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 28),
                      ),
                      ListTile(
                        leading: Container(
                          height: 40,
                          color: Colors.red,
                          width: 40,
                          child: const Icon(
                            CupertinoIcons.calendar,
                            color: Colors.white,
                          ),
                        ),
                        title: const Text('To do'),
                        trailing: const Text('5 task'),
                      ),
                      ListTile(
                        leading: Container(
                          height: 40,
                          color: Color(0xFF6C63FF),
                          width: 40,
                          child: const Icon(
                            CupertinoIcons.calendar,
                            color: Colors.white,
                          ),
                        ),
                        title: const Text('In Progress'),
                        trailing: const Text('6 task'),
                      ),
                      ListTile(
                        leading: Container(
                          height: 40,
                          color: Colors.green,
                          width: 40,
                          child: const Icon(
                            CupertinoIcons.checkmark_shield,
                            color: Colors.white,
                          ),
                        ),
                        title: const Text('Done'),
                        trailing: const Text('25 task'),
                      ),
                    ]),
              ),
              Card(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Column(children: [
                  ListTile(
                    leading: Text(
                      "Recently Assigned",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    trailing: const Text("All Tasks"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 15,
                        child: Column(
                          children: const [
                            ListTile(
                              leading: Text(
                                'Mobile App',
                                style: TextStyle(fontSize: 23),
                              ),
                              trailing: Text('High Priority'),
                            ),
                            Text(
                                'mksdflkdjsflkdjaflkjsdfljsdflakjdsf;lakjsdfa'),
                            Divider(),
                            ListTile(
                              leading: Icon(CupertinoIcons.clock),
                              title: Text('12 oct 2022'),
                            )
                          ],
                        )),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
