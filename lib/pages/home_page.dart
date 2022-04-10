import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/Constants/app_colors.dart';
import 'package:login_page/Curved_navigation_bar/curved_navigation_bar.dart';
import 'package:login_page/pages/attendance.dart';
import 'package:login_page/pages/dash_board.dart';
import 'package:login_page/pages/my_daily_updates.dart';
import 'package:login_page/pages/my_late_arrival.dart';
import 'package:login_page/pages/my_leaves.dart';

import '../Constants/Images.dart';
import '../Constants/app_constants.dart';
import '../models/models.dart';
import '../services/schedule_services.dart';
import '../utils/pref_services.dart';
import '../widgets/profile_page_appbar.dart';
import '../widgets/setting_page.dart';
import '../widgets/simple_button.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool changeButton = true;
  @override
  void initState() {
    super.initState();
    fetchSchedule();

    PrefsServices().getString(AppConstants.accessToken);
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

  // ignore: non_constant_identifier_names
  void darkMode() {
    setState(() {
      changeButton = !changeButton;
    });
  }

  int? selectedIndex = 0;
  List<Widget> widgetOptions = [
    const DashBoard(),
    const MyDailyUpdates(),
    const Attendances(),
    const MyLeaves(),
    const MyLateArrival(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          // body: NestedScrollView(
          //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          //     return <Widget>[
          //       const SliverBar(),
          //     ];
          //   },
          //   body: TabBarView(children: [
          //     CustomScrollView(
          //       slivers: [
          //       ],
          //     )
          //   ]),
          // ),
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(170.0),
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
                        icon: changeButton
                            ? const Icon(
                                CupertinoIcons.moon,
                              )
                            : const Icon(CupertinoIcons.sun_dust),
                        onPressed: () {
                          darkMode();
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
                            icon: const ImageIcon(
                              AssetImage(ImageConstants.menuIcon),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MySettings.routeName);
                            },
                            color: Colors.white);
                      })
                    ],
                  ))
                ],
                flexibleSpace: Center(
                  child: Container(
                    height: 100,
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child:
                                Image.asset(ImageConstants.profile, height: 80),
                          ),
                          // Container(
                          //   child: Column(children: [
                          //     Text(
                          //       'Mobile AppDeveloper',
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 20,
                          //       ),
                          //     ),1
                          //     Text('Project CPN'),
                          //   ]),
                          // ),
                          //yedi chai hamlai post and detail of the employee in homepage chaiyexa vane chai yo app garda hunxa
                          Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              SimpleButton(
                                  title: schedule?.checkIn != null
                                      ? 'CheckedIn :   ${schedule?.checkIn}'
                                      : 'CheckedIn: N/A'),
                              const SizedBox(
                                height: 8,
                              ),
                              SimpleButton(
                                  title: schedule?.checkOut != null
                                      ? 'CheckedOut : ${schedule?.checkOut}'
                                      : 'CheckedOut: N/A'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
          body: widgetOptions.elementAt(selectedIndex!),
          bottomNavigationBar: CurvedNavigationBar(
            iconColor: Colors.white,
            iconHeight: 20,

            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Colors.transparent,
            // color: const Color(0xFF6C63FF),
            index: selectedIndex!,
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              TabItem(ImageConstants.dashboardLogo, 'dashboard'),
              TabItem(ImageConstants.dailyUpdateLogo, 'dailyUpdate'),
              TabItem(ImageConstants.attendance, 'attendance'),
              TabItem(ImageConstants.leaveLogo, 'Leave'),
              TabItem(ImageConstants.leaveTransactionLogo, 'Leave Trans')
            ],
          ),
        ),
      ),
    );
  }
}
