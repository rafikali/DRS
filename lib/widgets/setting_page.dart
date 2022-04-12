import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/pages/hr_policy.dart';
import 'package:login_page/widgets/appbar.dart';

import '../pages/my_daily_updates.dart';
import '../pages/my_dashboard.dart';

class MySettings extends StatefulWidget {
  static const String routeName = '/settings';

  const MySettings({
    Key? key,
  }) : super(key: key);

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  List<Contents> data = [
    Contents(
      routeName: MyDashBoard.routeName,
      iconName: CupertinoIcons.home,
      title: 'My Dashboard',
    ),
    Contents(
      routeName: MyDailyUpdates.routeName,
      iconName: CupertinoIcons.bars,
      title: 'My DailyUpdate',
    ),
    Contents(
      routeName: MyDashBoard.routeName,
      iconName: CupertinoIcons.up_arrow,
      title: 'My Attendances',
    ),
    Contents(
      routeName: MyDashBoard.routeName,

      iconName: CupertinoIcons.leaf_arrow_circlepath,
      title: 'My Leaves',
      // navigators: Navigator.pushNamed(context, MyDashBoard.routeName)
    ),
    Contents(
      routeName: MyDashBoard.routeName,

      iconName: CupertinoIcons.creditcard,
      title: 'My Leave Transaction',
      // navigators: Navigator.pushNamed(context, MyDashBoard.routeName)
    ),
    Contents(
      routeName: MyDashBoard.routeName,

      iconName: CupertinoIcons.hourglass_bottomhalf_fill,
      title: 'My Missing Checkout',
      // navigators: Navigator.pushNamed(context, MyDashBoard.routeName)
    ),
    Contents(
      iconName: CupertinoIcons.speedometer,
      title: 'My Late Arrival',
      routeName: MyDashBoard.routeName,
      // navigators: Navigator.pushNamed(context, MyDashBoard.routeName)
    ),
    Contents(
      iconName: CupertinoIcons.control,
      title: 'Hr Policy',
      routeName: HRPolicy.routeName,

      // navigators: Navigator.pushNamed(context, MyDashBoard.routeName)
    ),
    Contents(
      routeName: MyDashBoard.routeName,
      iconName: CupertinoIcons.calendar,
      title: 'Holiday',

      // navigators: Navigator.pushNamed(context, MyDashBoard.routeName)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const NewPassAppbar(),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            onTap: () async {
                              Navigator.pushNamed(
                                  context, data[index].routeName.toString());
                            },
                            leading: Icon(data[index].iconName),
                            title: Text(data[index].title.toString()),
                          ),
                        );
                      }),
                ),
              ),
              // Column(
              //   children: [
              //     InkWell(
              //       onTap: () {f
              //         Navigator.pushNamed(context, ChangePassword.routeName);
              //       },
              //       child: const ListTile(
              //         leading: Icon(
              //           Icons.fingerprint,
              //           color: Colors.red,
              //         ),
              //         title: Text(
              //           'Change Password',
              //           style: TextStyle(color: Colors.red),
              //         ),
              //       ),
              //     ),
              //     InkWell(
              //       onTap: () {
              //         Navigator.pushNamed(context, LoginPage.routeName);
              //       },
              //       child: const ListTile(
              //         leading: Icon(
              //           CupertinoIcons.profile_circled,
              //           color: Color(0xFF6C63FF),
              //         ),
              //         title: Text(
              //           'Log Out',
              //           style: TextStyle(color: Color(0xFF6C63FF)),
              //         ),
              //       ),
              //     )
              //   ],
              // )
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

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:login_page/Constants/Images.dart';
// import 'package:login_page/pages/change_pass.dart';
// import 'package:login_page/pages/login_page.dart';
//
// import '../pages/my_daily_updates.dart';
// import '../pages/my_dashboard.dart';
//
// class MyDrawer extends StatefulWidget {
//
//   MyDrawer({Key? key,}) : super(key: key);
//
//   @override
//   State<MyDrawer> createState() => _MyDrawerState();
// }
//
// class _MyDrawerState extends State<MyDrawer> {
//   List<Contents> data = [
//     Contents(
//       routeName: MyDashBoard.routeName,
//       iconName: CupertinoIcons.home,
//       title: 'My Dashboard',
//     ),
//     Contents(
//       routeName: MyDailyUpdates.routeName,
//       iconName: CupertinoIcons.bars,
//       title: 'My DailyUpdate',
//     ),
//     Contents(
//       routeName: MyDashBoard.routeName,
//       iconName: CupertinoIcons.up_arrow,
//       title: 'My Attendances',
//     ),
//     Contents(
//       routeName: MyDashBoard.routeName,
//
//       iconName: CupertinoIcons.leaf_arrow_circlepath,
//       title: 'My Leaves',
//       // navigators: Navigator.pushNamed(context, MyDashBoard.routeName)
//     ),
//     Contents(
//       routeName: MyDashBoard.routeName,
//
//       iconName: CupertinoIcons.creditcard,
//       title: 'My Leave Transaction',
//       // navigators: Navigator.pushNamed(context, MyDashBoard.routeName)
//     ),
//     Contents(
//       routeName: MyDashBoard.routeName,
//
//       iconName: CupertinoIcons.hourglass_bottomhalf_fill,
//       title: 'My Missing Checkout',
//       // navigators: Navigator.pushNamed(context, MyDashBoard.routeName)
//     ),
//     Contents(
//       iconName: CupertinoIcons.speedometer,
//       title: 'My Late Arrival',
//       routeName: MyDashBoard.routeName,
//       // navigators: Navigator.pushNamed(context, MyDashBoard.routeName)
//     ),
//     Contents(
//       iconName: CupertinoIcons.control,
//       title: 'Hr Policy',
//       routeName: MyDashBoard.routeName,
//
//       // navigators: Navigator.pushNamed(context, MyDashBoard.routeName)
//     ),
//     Contents(
//       routeName: MyDashBoard.routeName,
//       iconName: CupertinoIcons.calendar,
//       title: 'Holiday',
//
//       // navigators: Navigator.pushNamed(context, MyDashBoard.routeName)
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: SizedBox(
//         height: MediaQuery
//             .of(context)
//             .size
//             .height * 1,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const DrawerHeader(
//                 padding: EdgeInsets.zero,
//                 child: UserAccountsDrawerHeader(
//                   decoration: BoxDecoration(
//                       color: Colors.black
//                   ),
//
//                   accountName: Text('Rafik Ali'),
//                   accountEmail: Text('ra3210304@gmail.com'),
//                   currentAccountPictureSize: Size(100, 100),
//                   currentAccountPicture: CircleAvatar(
//                     backgroundImage: AssetImage(ImageConstants.profile),
//                   ),
//                 )),
//             Flexible(
//               child: ListView.builder(
//                   itemCount: data.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       onTap: () async {
//                         Navigator.pushNamed(
//                             context, data[index].routeName.toString());
//                       },
//                       leading: Icon(data[index].iconName),
//                       title: Text(data[index].title.toString()),
//                     );
//                   }),
//             ),
//             Column(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.pushNamed(context, ChangePassword.routeName);
//                   },
//                   child: const ListTile(
//                     leading: Icon(
//                       Icons.fingerprint,
//                       color: Colors.red,
//                     ),
//                     title: Text(
//                       'Change Password',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.pushNamed(context, LoginPage.routeName);
//                   },
//                   child: const ListTile(
//                     leading: Icon(
//                       CupertinoIcons.profile_circled,
//                       color: Color(0xFF6C63FF),
//                     ),
//                     title: Text(
//                       'Log Out',
//                       style: TextStyle(color: Color(0xFF6C63FF)),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Contents {
//   final IconData? iconName;
//   final String? title;
//   final String? routeName;
//
//   Contents({this.iconName, this.routeName, this.title});
// }
//
//
//
