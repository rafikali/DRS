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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text('Rafik Ali'),
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
            Text(
              'My Task',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 28),
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
        ),
      ),
    );
  }
}
