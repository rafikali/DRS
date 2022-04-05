// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:login_page/pages/change_pass.dart';
//
// import '../Constants/Images.dart';
// import '../widgets/setting_page.dart';
// import 'login_page.dart';
// import 'my_daily_updates.dart';
// import 'my_dashboard.dart';
//
//
// class MySetting extends StatefulWidget {
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
//
//   MySettings({Key? key}) : super(key: key);
//
//   @override
//   State<MySettings> createState() => _MySettingsState();
// }
//
// class _MySettingsState extends State<MySettings> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//
//     Flexible(
//     child: ListView.builder(
//     itemCount: data.l,
//     itemBuilder: (context, index) {
//     return ListTile(
//     onTap: () async {
//     Navigator.pushNamed(
//     context, data[index].routeName.toString());
//     },
//     leading: Icon(data[index].iconName),
//     title: Text(data[index].title.toString()),
//     );
//     }),
//     ),
//     Column(
//     children: [
//     InkWell(
//     onTap: () {
//     Navigator.pushNamed(context, ChangePassword.routeName);
//     },
//     child: const ListTile(
//     leading: Icon(
//     Icons.fingerprint,
//     color: Colors.red,
//     ),
//     title: Text(
//     'Change Password',
//     style: TextStyle(color: Colors.red),
//     ),
//     ),
//     ),
//     InkWell(
//     onTap: () {
//     Navigator.pushNamed(context, LoginPage.routeName);
//     },
//     child: const ListTile(
//     leading: Icon(
//     CupertinoIcons.profile_circled,
//     color: Color(0xFF6C63FF),
//     ),
//     title: Text(
//     'Log Out',
//     style: TextStyle(color: Color(0xFF6C63FF)),
//     ),
//     ),
//     )
//     ],
//     )
//   }
// }
