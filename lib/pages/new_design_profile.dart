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
        body: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  // color: Colors.blue,
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
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
                      const SizedBox(
                        height: 10,
                      ),
                      LoginTextForm(
                        hintText: 'Search',
                        trailingIcon: const Icon(
                          CupertinoIcons.search,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
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
                          color: Theme.of(context).backgroundColor,
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
                    ],
                  )),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Column(children: [
                  const ListTile(
                    leading: const Text("Recently Assigned"),
                    trailing: const Text("All Tasks"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        elevation: 15,
                        child: Column(
                          children: [
                            const ListTile(
                              leading: const Text(
                                'Mobile App',
                                style: const TextStyle(fontSize: 23),
                              ),
                              trailing: const Text('High Priority'),
                            ),
                            const Text(
                                'mksdflkdjsflkdjaflkjsdfljsdflakjdsf;lakjsdfa'),
                            const Divider(),
                            const ListTile(
                              leading: const Icon(CupertinoIcons.clock),
                              title: const Text('12 oct 2022'),
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
