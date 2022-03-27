import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Constants/Images.dart';
import 'package:login_page/pages/attendance.dart';
import 'package:login_page/pages/daily_update.dart';
import 'package:login_page/pages/dash_board.dart';
import 'package:login_page/widgets/Drawer.dart';
import 'package:login_page/widgets/alertbox..dart';
import '../widgets/simple_button.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: MyDrawer(
         data: [
            Contents(iconName: CupertinoIcons.home, title: 'My Dashboard'),
            Contents(iconName: CupertinoIcons.bars, title: 'My Daily Updates'),
            Contents(iconName: CupertinoIcons.up_arrow, title: 'My Attendances'),
            Contents(iconName: CupertinoIcons.leaf_arrow_circlepath, title: 'My Leaves'),
            Contents(iconName: CupertinoIcons.creditcard, title: 'My Leave Transaction'),
            Contents(iconName: CupertinoIcons.arrow_counterclockwise, title: 'My Missing Checkout'),
            Contents(iconName: CupertinoIcons.speedometer, title: 'My Late Arrival'),
            Contents(iconName: CupertinoIcons.control, title: 'Hr Policy'),
            Contents(iconName: CupertinoIcons.calendar, title: 'Holiday'),


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

                )
            ),
            title: const SizedBox(
              child: Text('Grow-Teamly',
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 22,
                  color: Colors.white,
                ),

                textAlign: TextAlign.center,
               ),
            ),


            actions:  [
              SizedBox(
                height: 120,
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                      const Icon(CupertinoIcons.moon, color: Colors.white, ),
                    IconButton( onPressed: () { DialogBox().getAlertDialogBox(context);}, icon: const Icon(CupertinoIcons.profile_circled, color: Colors.white),),

                    InkWell(onTap: () {

                    },
                        child: Builder(
                          builder: (context) {
                            return InkWell(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                                child: const Icon(CupertinoIcons.gear_solid, color: Colors.white));
                          }
                        )),
                  ],
                )

              )

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
                        children: const  [
                          SimpleButton(title: 'Checked In :',
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          SimpleButton(title: 'Checked Out :',),
                        ],
                      ),
                    ],

                  ),
                ),

              ),
            ),
            bottom:  PreferredSize(
              preferredSize: const Size(10,12),
              child: Container(
                decoration:  BoxDecoration(
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
                        ]
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                child:  const TabBar(
                  labelColor: Color(0xFF6C63FF),
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Color(0xFF6C63FF),
                    tabs: [
                  Tab(child: Text('Dashboard', style: TextStyle(
                    fontSize: 13
                  ),),),

                  Tab(child: Text('Daily Update',  style: TextStyle(
                      fontSize: 13),),),

                  Tab(child: Text('Attendance',  style: TextStyle(
                      fontSize: 13),),
                  ),
                ]),
              ),
            ),

              )),



        body:  const Padding(
          padding: EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              DashBoard(),
              DailyUpdate(),

              MyAttendances(),

            ],
          ),
        )

      ),
    );
  }
}


