import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_page/Curved_navigation_bar/curved_navigation_bar.dart';
import 'package:login_page/pages/new_design_profile.dart';
import 'package:login_page/pages/update_drs.dart';
import 'package:login_page/pages/attendance.dart';
import 'package:login_page/pages/daily_update.dart';
import 'package:login_page/pages/dashboard.dart';
import 'package:login_page/pages/my_leaves.dart';
import 'package:login_page/utils/confirmation_dialog.dart';
import 'package:login_page/utils/myappbar.dart';
import 'package:login_page/widgets/floating_action_button.dart';
import '../Constants/Images.dart';
import '../repository/models/schedule.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? selectedImage;
  bool changeButton = true;
  Schedule? schedules;
  int? selectedIndex = 0;

  List<Widget> widgetOptions = [
    const DashBoard(),
    const DailyUpdate(),
    const Attendances(),
    const MyLeaves(),
    const ProfilePage(),
  ];

  void darkMode() {
    setState(() {
      changeButton = !changeButton;
    });
  }

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

  @override
  Widget build(BuildContext context) {
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
        });
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          appBar: selectedIndex == 0
              ? const PreferredSize(
                  preferredSize: Size.fromHeight(170.0), child: MyAppBar())
              : null,
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
                TabItem(ImageConstants.dashboardLogo, 'Home'),
                TabItem(ImageConstants.dailyUpdateLogo, 'DailyUpdate'),
                TabItem(ImageConstants.attendance, 'Attendance'),
                TabItem(ImageConstants.leaveLogo, 'Leave'),
                TabItem(ImageConstants.profileLogo, 'Profile')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
