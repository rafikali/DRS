import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/Curved_navigation_bar/curved_navigation_bar.dart';
import 'package:login_page/pages/add_daily_update.dart';
import 'package:login_page/pages/attendance.dart';
import 'package:login_page/pages/daily_update.dart';
import 'package:login_page/pages/dash_board.dart';
import 'package:login_page/pages/my_leaves.dart';
import 'package:login_page/pages/myleaves_transaction.dart';
import 'package:login_page/widgets/floating_action_button.dart';
import 'package:provider/provider.dart';

import '../Constants/Images.dart';
import '../main.dart';
// import 'CssBaseline  from '@mui/material/';
import 'dart:developer' as devtools show log;
import '../models/models.dart';
import '../services/schedule_services.dart';
import '../utils/daily_update_alertbox.dart';
import '../widgets/alertbox..dart';
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
    // PrefsServices().getString(AppConstants.accessToken);
    // loadData();
  }

  // @override
  // void dispose() {
  //   super.initState();
  //   _users
  // }

  Schedule? schedules;

  fetchSchedule() async {
    Schedule? sch = await ScheduleServices().fetchSchedule();
    if (sch != null) {
      setState(() {
        schedules = sch;
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
    const DailyUpdate(),
    const Attendances(),
    const MyLeaves(),
    const MyLeaveTransaction(),
    // const DailyUpdate(),
    // const Attendances(),
    // const MyLeaves(),
    // const MyLeaveTransaction(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();

        return true;
      },
      child: schedules == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
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
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(200, 30),
                      )),
                      title: const SizedBox(
                        child: Text(
                          'Grow-Teamly',
                          style: TextStyle(color: Colors.white, fontSize: 23),
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
                                  : const Icon(
                                      CupertinoIcons.brightness_solid,
                                    ),
                              onPressed: () {
                                darkMode();
                                var themeMode = themeChanger.getThemeMode;
                                if (themeMode == ThemeMode.light) {
                                  themeChanger.setTheme(ThemeMode.dark);
                                } else {
                                  themeChanger.setTheme(ThemeMode.light);
                                }

                                // changeTheme(
                                //     Provider.of<DarkThemeNotifier>(context,
                                //                 listen: false)
                                //             .isDarkMode
                                //         ? false
                                //         : true,
                                //     context);
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Profile.routeName);
                              },
                              icon: Icon(
                                CupertinoIcons.profile_circled,
                                size: Theme.of(context).iconTheme.size,
                              ),
                            ),
                            Builder(builder: (context) {
                              return IconButton(
                                  icon: const ImageIcon(
                                    AssetImage(
                                      ImageConstants.menuIcon,
                                    ),
                                    // size: Theme.of(context).iconTheme.size,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: InkWell(
                                    child: Image.asset(ImageConstants.profile,
                                        height: 80),
                                    onTap: () {
                                      BottomSheet(
                                        builder: (context) {
                                          return Column(children: const [
                                            ListTile(
                                              leading: Icon(CupertinoIcons.add),
                                              title: Text("Upload photo"),
                                            ),
                                          ]);
                                        },
                                        onClosing: () {},
                                      );
                                    },
                                  ),
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
                                        title:
                                            "CheckedIn : ${schedules?.checkIn ?? 'N/A'}"),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SimpleButton(
                                        title: schedules?.checkOut != null
                                            ? 'CheckedOut : ${schedules?.checkOut}'
                                            : 'CheckedOut: N/A'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                // body: Center(
                //   child: Text("data"),
                // ),
                body: widgetOptions.elementAt(selectedIndex!),
                bottomNavigationBar: SafeArea(
                  child: CurvedNavigationBar(
                    iconColor: Colors.white,
                    iconHeight: 23,
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
                      TabItem(
                          ImageConstants.leaveTransactionLogo, 'Leave Trans')
                    ],
                  ),
                ),
                floatingActionButton: CustomFloatingActionButton(
                  backgroundcolor: Colors.green,
                  onPressed: (() {
                    Navigator.pushNamed(context, AddDailyUpdae.routeName);
                    // DialogBox(
                    //   dialogBoxPadding: const EdgeInsets.all(15),
                    //   barrierDismissile: false,
                    //   content: DailyUpdateAlertBox(
                    //     padding: const EdgeInsets.all(10),
                    //   ),
                    // ).getAlertDialogBox(context);
                  }),
                ),
              ),
            ),
    );
  }

// void changeTheme(bool set, BuildContext context) {
//   ///Call setDarkMode method inside our Settings ChangeNotifier class to
//   ///Notify all the listeners of the change.
//   Provider.of<DarkThemeNotifier>(context, listen: false).setDarkMode(set);
// }
}
