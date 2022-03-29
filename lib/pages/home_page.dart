import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Constants/Images.dart';
import 'package:login_page/Constants/api_endpoints.dart';
import 'package:login_page/pages/attendance.dart';
import 'package:http/http.dart' as http;
import 'package:login_page/pages/daily_update.dart';
import 'package:login_page/pages/dash_board.dart';
import 'package:login_page/pages/models.dart';
import 'package:login_page/pages/my_daily_updates.dart';
import 'package:login_page/pages/my_dashboard.dart';
import 'package:login_page/pages/my_late_arrival.dart';
import 'package:login_page/pages/my_leaves.dart';
import 'package:login_page/pages/my_missing_checkout.dart';
import 'package:login_page/widgets/Drawer.dart';
import 'package:login_page/widgets/alertbox..dart';
import '../widgets/simple_button.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Future<Schedule> fetchSchedule() async {
  final response = await http.get(Uri.parse(ApiEndpoints.checkTime));
  var bodyData = jsonDecode(response.body);

  if (response.statusCode == 200) {
    var Response = Schedule.fromJson(bodyData);
    print(Response.checkIn);
    return Response;
  } else {
    throw Exception('Failed to load');
  }
}

class _HomePageState extends State<HomePage> {
  bool mode = true;

  void DarkMode() {
    setState(() {
      mode = !mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          drawer: MyDrawer(
            data: [
              Contents(
                iconName: InkWell(
                  child: Icon(CupertinoIcons.home),
                  onTap: () {
                    Navigator.pushNamed(context, MyDashBoard.routeName);
                  },
                ),
                title: 'My Dashboard',
              ),
              Contents(
                iconName: Icon(CupertinoIcons.bars),
                title: 'My Dashboard',
              ),
              Contents(
                  iconName: Icon(CupertinoIcons.up_arrow),
                  title: 'My Attendances'),
              Contents(
                  iconName: Icon(CupertinoIcons.leaf_arrow_circlepath),
                  title: 'My Leaves'),
              Contents(
                  iconName: Icon(CupertinoIcons.creditcard),
                  title: 'My Leave Transaction'),
              Contents(
                  iconName: Icon(CupertinoIcons.hourglass_bottomhalf_fill),
                  title: 'My Missing Checkout'),
              Contents(
                  iconName: Icon(CupertinoIcons.speedometer),
                  title: 'My Late Arrival'),
              Contents(
                  iconName: Icon(CupertinoIcons.control), title: 'Hr Policy'),
              Contents(
                  iconName: Icon(CupertinoIcons.calendar), title: 'Holiday'),
            ],
          ),
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
                      fontSize: 22,
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
                            ? Icon(
                                CupertinoIcons.moon,
                              )
                            : Icon(CupertinoIcons.sun_dust),
                        onPressed: () {
                          DarkMode();
                        },
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          // DialogBox().getAlertDialogBox(context);
                        },
                        icon: const Icon(CupertinoIcons.profile_circled,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Builder(builder: (context) {
                            return InkWell(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: const Icon(CupertinoIcons.gear_solid,
                                    color: Colors.white));
                          })),
                      SizedBox(
                        width: 6,
                      ),
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(ImageConstants.profile),
                          ),
                          Wrap(
                            runSpacing: 10.0,
                            spacing: 1,
                            alignment: WrapAlignment.center,
                            direction: Axis.vertical,
                            children: const [
                              SimpleButton(
                                title: 'Checked In :',
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              SimpleButton(
                                title: 'Checked Out :',
                              ),
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
                          Tab(
                            child: Text(
                              'Dashboard',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Daily Update',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Attendance',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ]),
                  ),
                ),
              )),
          body: const Padding(
            padding: EdgeInsets.all(8.0),
            child:  TabBarView(
              physics: BouncingScrollPhysics(),
              children: [
                DashBoard(),
                DailyUpdate(),
                Attendances(),
              ],
            ),
          )),
    );
  }
}
