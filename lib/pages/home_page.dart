import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_page/main.dart';
import 'package:login_page/models/models.dart';
import 'package:login_page/pages/attendance.dart';
import 'package:login_page/pages/daily_update.dart';
import 'package:login_page/pages/dash_board.dart';
import 'package:login_page/pages/my_daily_updates.dart';
import 'package:login_page/widgets/setting_page.dart';

import '../Constants/Images.dart';
import '../services/schedule_services.dart';
import '../widgets/alertbox..dart';
import '../widgets/profile_page_appbar.dart';
import '../widgets/simple_button.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSchedule();
    // loadData();
  }

  Schedule? schedule;
  fetchSchedule() async {
    final Schedule? sch = await ScheduleServices().fetchSchedule();
    if (sch != null) {
      setState(() {
        schedule = sch;
      });
    }
  }

  int? selectedIndex = 2;
  List<Widget> widgetOptions = [
    const MyDailyUpdates(),
    const Attendances(),
    const DashBoard(),
    const DailyUpdate(),
    const Attendances(),
  ];

  bool mode = true;
  var value = MyApp(
    changeMode: true,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBody: true,

        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(250.0),
            child: AppBar(
              automaticallyImplyLeading: false,
              elevation: 2,
              backgroundColor: const Color(0xFF6C63FF),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(200, 30),
              )),
              title: const SizedBox(
                child: Text(
                  'Grow-Teamly',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              actions: <Widget>[
                SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: mode
                          ? const Icon(
                              CupertinoIcons.moon,
                            )
                          : const Icon(CupertinoIcons.sun_dust),
                      onPressed: () {
                        // darkMode();
                      },
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Profile.routeName);
                      },
                      icon: const Icon(CupertinoIcons.profile_circled,
                          color: Colors.white),
                    ),

                    // const SizedBox(
                    //   width: 4,ont
                    // ),
                    Builder(builder: (context) {
                      return IconButton(
                          icon: const Icon(
                            CupertinoIcons.gear_solid,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, MySettings.routeName);
                          },
                          color: Colors.white);
                    })
                  ],
                ))
              ],
              flexibleSpace: Center(
                child: Container(
                  height: 100,
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            DialogBox(
                              barrierDismissile: false,
                              content: SingleChildScrollView(
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: Column(
                                    children: [
                                      const ListTile(
                                        leading: Text('Cancel'),
                                        title: Text('Add Item'),
                                      ),
                                      Column(
                                        children: const [
                                          ListTile(
                                              leading: FaIcon(
                                                  FontAwesomeIcons.fileImage),
                                              title: Text('Photos')),
                                          ListTile(
                                              leading: FaIcon(
                                                  FontAwesomeIcons.fileImage),
                                              title: Text('Photos')),
                                          ListTile(
                                              leading: FaIcon(
                                                  FontAwesomeIcons.fileImage),
                                              title: Text('Photos')),
                                          ListTile(
                                              leading: FaIcon(
                                                  FontAwesomeIcons.fileImage),
                                              title: Text('Photos')),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ).getAlertDialogBox(context);
                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.6,
                            //   child: SingleChildScrollView(
                            //   ),
                            // ),));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(ImageConstants.profile),
                          ),
                        ),
                        Wrap(
                          runSpacing: 10.0,
                          spacing: 1,
                          alignment: WrapAlignment.center,
                          direction: Axis.vertical,
                          children: [
                            SimpleButton(
                                title: schedule?.checkIn != null
                                    ? 'CheckedIn : ${schedule?.checkIn}'
                                    : ''),
                            const SizedBox(
                              height: 8,
                            ),
                            SimpleButton(
                                title: schedule?.checkOut != null
                                    ? 'CheckedOut : ${schedule?.checkOut}'
                                    : 'CheckedOut:'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size(10, 12),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                      //   border: Border.all(
                      //     color: Colors.white
                      // ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFd3d3d3),
                          blurRadius: 3.0,
                          // has the effect of softening the shadow
                          // has the effect of extending the shadow
                          offset: Offset(
                            0.0, // horizontal, move right 10
                            10.0, // vertical, move down 10
                          ),
                        )
                      ]),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const TabBar(
                      labelColor: Color(0xFF6C63FF),
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Color(0xFF6C63FF),
                      tabs: [
                        FittedBox(
                          child: Tab(
                            child: Text(
                              'Dashboard',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Tab(
                            child: Text(
                              'Daily Update',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Tab(
                            child: Text(
                              'Attendance',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            )),
        body: widgetOptions.elementAt(selectedIndex!),
        bottomNavigationBar: Theme(
          data: ThemeData(
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          child: CurvedNavigationBar(
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Colors.transparent,
            color: const Color(0xFF6C63FF),
            index: selectedIndex!,
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            height: 50,
            items: const [
              ImageIcon(AssetImage(ImageConstants.leaveTransactionLogo)),
              ImageIcon(AssetImage(ImageConstants.dailyUpdateLogo)),
              ImageIcon(AssetImage(ImageConstants.dashboardLogo)),
              ImageIcon(AssetImage(ImageConstants.attendance)),
              ImageIcon(AssetImage(ImageConstants.leaveTransactionLogo)),
            ],
          ),
        ),
        // BottomNavigationBarItem(

        //     icon: ImageIcon(AssetImage(
        //       ImageConstants.leaveLogo,
        //     )),
        //     label: 'dashboard'),

        // onTap: onItemTapped,
      ),
    );
  }
}

// appBar: PreferredSize(
//     preferredSize: const Size.fromHeight(250.0),
//     child: AppBar(
//       automaticallyImplyLeading: false,
//       elevation: 2,
//       backgroundColor: const Color(0xFF6C63FF),
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//         bottom: Radius.elliptical(200, 30),
//       )),
//       title: const SizedBox(
//         child: Text(
//           'Grow-Teamly',
//           style: TextStyle(
//             letterSpacing: 1,
//             fontSize: 20,
//             color: Colors.white,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//       actions: <Widget>[
//         SizedBox(
//             child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               icon: mode
//                   ? const Icon(
//                       CupertinoIcons.moon,
//                     )
//                   : const Icon(CupertinoIcons.sun_dust),
//               onPressed: () {
//                 // darkMode();
//               },
//               color: Colors.white,
//             ),
//             Builder(builder: (context) {
//               return IconButton(
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//                 icon: const Icon(CupertinoIcons.profile_circled,
//                     color: Colors.white),
//               );
//             }),
//             // const SizedBox(
//             //   width: 4,
//             // ),
//             InkWell(
//                 onTap: () {},
//                 child: Builder(builder: (context) {
//                   return IconButton(
//                       icon: const Icon(
//                         CupertinoIcons.gear_solid,
//                       ),
//                       onPressed: () {
//                         Scaffold.of(context).openDrawer();
//                       },
//                       color: Colors.white);
//                 })),
//             // const SizedBox(
//             //   width: 15,
//             // ),
//           ],
//         ))
//       ],
//       flexibleSpace: Center(
//         child: Container(
//           height: 100,
//           alignment: Alignment.centerRight,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     DialogBox(
//                       barrierDismissile: false,
//                       content: SingleChildScrollView(
//                         child: Container(
//                           width: double.infinity,
//                           height:
//                               MediaQuery.of(context).size.height * 0.5,
//                           child: Column(
//                             children: [
//                               const ListTile(
//                                 leading: Text('Cancel'),
//                                 title: Text('Add Item'),
//                               ),
//                               Column(
//                                 children: const [
//                                   ListTile(
//                                       leading: FaIcon(
//                                           FontAwesomeIcons.fileImage),
//                                       title: Text('Photos')),
//                                   ListTile(
//                                       leading: FaIcon(
//                                           FontAwesomeIcons.fileImage),
//                                       title: Text('Photos')),
//                                   ListTile(
//                                       leading: FaIcon(
//                                           FontAwesomeIcons.fileImage),
//                                       title: Text('Photos')),
//                                   ListTile(
//                                       leading: FaIcon(
//                                           FontAwesomeIcons.fileImage),
//                                       title: Text('Photos')),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ).getAlertDialogBox(context);
//                     // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: SizedBox(
//                     //   height: MediaQuery.of(context).size.height * 0.6,
//                     //   child: SingleChildScrollView(
//                     //   ),
//                     // ),));
//                   },
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(100),
//                     child: Image.asset(ImageConstants.profile),
//                   ),
//                 ),
//                 Wrap(
//                   runSpacing: 10.0,
//                   spacing: 1,
//                   alignment: WrapAlignment.center,
//                   direction: Axis.vertical,
//                   children: const [
//                     SimpleButton(
//                       title: 'Checked In :',
//                     ),
//                     SizedBox(
//                       height: 8,
//                     ),
//                     SimpleButton(
//                       title: 'Checked Out :',
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottom: PreferredSize(
//         preferredSize: const Size(10, 12),
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(6),
//               color: Colors.white,
//               //   border: Border.all(
//               //     color: Colors.white
//               // ),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Color(0xFFd3d3d3),
//                   blurRadius: 3.0,
//                   // has the effect of softening the shadow
//                   // has the effect of extending the shadow
//                   offset: Offset(
//                     0.0, // horizontal, move right 10
//                     10.0, // vertical, move down 10
//                   ),
//                 )
//               ]),
//           width: MediaQuery.of(context).size.width * 0.8,
//           child: const TabBar(
//               labelColor: Color(0xFF6C63FF),
//               unselectedLabelColor: Colors.black,
//               indicatorColor: Color(0xFF6C63FF),
//               tabs: [
//                 FittedBox(
//                   child: Tab(
//                     child: Text(
//                       'Dashboard',
//                       style: TextStyle(fontSize: 13),
//                     ),
//                   ),
//                 ),
//                 FittedBox(
//                   child: Tab(
//                     child: Text(
//                       'Daily Update',
//                       style: TextStyle(fontSize: 13),
//                     ),
//
//                 ),
//                 FittedBox(
//                   child: Tab(
//                     child: Text(
//                       'Attendance',
//                       style: TextStyle(fontSize: 13),
//                     ),
//                   ),
//                 ),
//               ]),
//         ),
//       ),
//     )),
// body: const  Padding(
//   padding: EdgeInsets.all(8.0),
//   child: TabBarView(
//     physics: BouncingScrollPhysics(),
//     children: [
//       DashBoard(),
//       DailyUpdate(),
//       Attendances(),
//     ],
//   ),
//
//
// ),
