import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:login_page/widgets/bottom_sheet_listtile.dart';
import 'package:provider/provider.dart';

import '../app/Constants/Images.dart';
import '../app/theme/theme_changer.dart';
import '../auth/view/changing_new_password.dart';
import '../auth/widgets/confirmaton_dialog.dart';
import '../repo/models/schedule.dart';
import '../repo/services/schedule_services.dart';
import '../widgets/setting_page.dart';
import '../widgets/simple_button.dart';
import 'bottomsheet.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(170.0);
}

class _HomeAppBarState extends State<HomeAppBar> {
  var selectedImage;
  List<Image> imageObject = [];
  bool changeButton = true;
  Schedule? schedules;

  // Future pickImage(ImageSource source) async {
  //   final ImagePicker _imagePicker = ImagePicker();
  //   //pick an image
  //   final XFile? image = await _imagePicker.pickImage(source: source);
  //   if (image == null) return;
  //   final imageTemporary = File(imageObject, image.path);

  //   setState(() {
  //     selectedImage = imageTemporary;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    fetchSchedule();
  }

  fetchSchedule() async {
    Schedule? sch = await ScheduleServices().fetchSchedule();
    if (sch != null && mounted) {
      setState(() {
        schedules = sch;
      });
    }
  }

  darkMode() {
    setState(() {
      changeButton = !changeButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return AppBar(
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
              },
            ),
            IconButton(
              onPressed: () {
                MyBottomSheet(children: [
                  BottomSheetListTile(
                      onTap: () => Navigator.pushNamed(
                          context, ChangePassword.routeName),
                      leadingIcon: Icons.fingerprint,
                      color: Colors.red,
                      backgroundColor: Colors.red,
                      title: 'Change Password'),
                  BottomSheetListTile(
                      onTap: () =>
                          LogoutConfirmation().logoutConfimationDialog(context),
                      leadingIcon: CupertinoIcons.profile_circled,
                      title: 'Log Out')
                ]).getBottomSheet(context);
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
                              selectedImage,
                              height: 80,
                            ),
                          )
                        : Image.asset(
                            ImageConstants.profile,
                            height: 80,
                          ),
                    onTap: () {
                      MyBottomSheet(children: const [
                        BottomSheetListTile(
                          onTap: null,
                          leadingIcon: CupertinoIcons.camera,
                          title: 'Take Photo',
                        ),
                        BottomSheetListTile(
                          onTap: null,
                          leadingIcon: CupertinoIcons.folder,
                          title: 'Upload Photo',
                        ),
                        BottomSheetListTile(
                          onTap: null,
                          leadingIcon: CupertinoIcons.person,
                          title: 'View Profile',
                        )
                      ]).getBottomSheet(context);
                    },
                    // onClosing: null,
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
                        title: "CheckedIn : ${schedules?.checkIn ?? 'N/A'}"),
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
    );
  }
}
