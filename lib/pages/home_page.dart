import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_page/Curved_navigation_bar/curved_navigation_bar.dart';
import 'package:login_page/pages/changing_new_password.dart';
import 'package:login_page/pages/new_design_profile.dart';
import 'package:login_page/pages/profile_page.dart';
import 'package:login_page/pages/update_drs.dart';
import 'package:login_page/pages/attendance.dart';
import 'package:login_page/pages/daily_update.dart';
import 'package:login_page/pages/dashboard.dart';
import 'package:login_page/pages/my_leaves.dart';
import 'package:login_page/pages/myleaves_transaction.dart';
import 'package:login_page/utils/bottomsheet.dart';
import 'package:login_page/utils/confirmation_dialog.dart';
import 'package:login_page/widgets/floating_action_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/Images.dart';
import '../Constants/app_constants.dart';
import '../main.dart';
// import 'CssBaseline  from '@mui/material/';
import '../models/models.dart';
import '../services/schedule_services.dart';
import '../widgets/setting_page.dart';
import '../widgets/simple_button.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? selectedImage;

  bool changeButton = true;
  Future pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    //pick an image
    final XFile? image = await _imagePicker.pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      selectedImage = imageTemporary;
    });
  }

  //   //capture a photo
  //   final XFile? photo =
  //       await _imagePicker.pickImage(source: ImageSource.camera);
  //   final List<XFile>? images = await _imagePicker.pickMultiImage();
  Schedule? schedules;

  @override
  void initState() {
    super.initState();
    fetchSchedule();
    // PrefsServices().getString(AppConstants.accessToken);
    // loadData();
  }

  fetchSchedule() async {
    Schedule? sch = await ScheduleServices().fetchSchedule();
    if (sch != null && mounted) {
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
    // const DashBoard(),
    const DailyUpdate(),
    const DailyUpdate(),
    // const Attendances(),
    // const Attendances(),
    const Attendances(),
    const DashBoard(),
    // const MyLeaves(),
    const MyLeaveTransaction(),
  ];

  // List<ListTile> data = [];

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    // Future<bool> value = false;
    return WillPopScope(
      onWillPop: () async {
        await getDialog(context,
                title: Text(
                  'Confirm',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                content: Text('Do you want to exit?',
                    style: Theme.of(context).textTheme.bodyText1))
            .then((value) {
          if (value == true) {
            SystemNavigator.pop();
          } else {
            return null;
          }
          // return null;
        });

        return false;
      },
      // schedules == null
      //     ? const Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     :
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
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
                          MyBottomSheet().getBottomSheet(context);
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
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: InkWell(
                              child: selectedImage != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        selectedImage!,
                                        height: 80,
                                      ),
                                    )
                                  : Image.asset(
                                      ImageConstants.profile,
                                      height: 80,
                                    ),
                              onTap: () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  )),
                                  builder: (context) {
                                    return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            onTap: (() =>
                                                pickImage(ImageSource.camera)),
                                            leading: CircleAvatar(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .backgroundColor,
                                                child: const Icon(
                                                  CupertinoIcons.camera,
                                                  color: Colors.white,
                                                )),
                                            title: Text("Take photo"),
                                          ),
                                          ListTile(
                                            onTap: () =>
                                                pickImage(ImageSource.gallery),
                                            leading: CircleAvatar(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .backgroundColor,
                                                child: const Icon(
                                                    CupertinoIcons.folder,
                                                    color: Colors.white)),
                                            title: const Text("Upload photo"),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  ProfilePage.routeName);
                                            },
                                            leading: CircleAvatar(
                                              backgroundColor: Theme.of(context)
                                                  .backgroundColor,
                                              child: Icon(CupertinoIcons.person,
                                                  color: Colors.white),
                                            ),
                                            title: const Text("View profile"),
                                          ),
                                        ]);
                                  },
                                  // onClosing: null,
                                  context: context,
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
                          //yedi chai hamlai post and detail of the employee in page chaiyexa vane chai yo app garda hunxa
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
          floatingActionButton: selectedIndex == 1
              ? CustomFloatingActionButton(
                  backgroundcolor: Colors.green,
                  onPressed: (() {
                    Navigator.pushNamed(context, UpdateDrs.routeName);
                    // DialogBox(
                    //   dialogBoxPadding: const EdgeInsets.all(15),
                    //   barrierDismissile: false,
                    //   content: DailyUpdateAlertBox(
                    //     padding: const EdgeInsets.all(10),
                    //   ),
                    // ).getAlertDialogBox(context);
                  }),
                )
              : null,
          bottomNavigationBar: SafeArea(
            child: CurvedNavigationBar(
              buttonBackgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
              iconColor: Colors.white,

              //
              // iconHeight: 23,
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              foregroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              // color: const Color(0xFF6C63FF),
              index: selectedIndex!,
              onTap: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                TabItem(ImageConstants.dashboardLogo, 'Dashboard'),
                TabItem(ImageConstants.dailyUpdateLogo, 'DailyUpdate'),
                TabItem(ImageConstants.attendance, 'Attendance'),
                TabItem(ImageConstants.leaveLogo, 'Leave'),
                TabItem(ImageConstants.leaveTransactionLogo, 'Leave Trans')
              ],
            ),
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
