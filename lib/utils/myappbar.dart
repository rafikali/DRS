// import 'package:flutter/material.dart';
// class MyAppBar extends StatefulWidget {
//   MyAppBar({Key? key}) : super(key: key);

//   @override
//   State<MyAppBar> createState() => _MyAppBarState();
// }

// class _MyAppBarState extends State<MyAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//               preferredSize: const Size.fromHeight(170.0),
//               child: AppBar(
//                 automaticallyImplyLeading: false,
//                 elevation: 2,
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.vertical(
//                   bottom: Radius.elliptical(200, 30),
//                 )),
//                 title: const SizedBox(
//                   child: Text(
//                     'Grow-Teamly',
//                     style: TextStyle(color: Colors.white, fontSize: 23),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 actions: <Widget>[
//                   SizedBox(
//                       child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       IconButton(
//                         icon: changeButton
//                             ? const Icon(
//                                 CupertinoIcons.moon,
//                               )
//                             : const Icon(
//                                 CupertinoIcons.brightness_solid,
//                               ),
//                         onPressed: () {
//                           darkMode();
//                           var themeMode = themeChanger.getThemeMode;
//                           if (themeMode == ThemeMode.light) {
//                             themeChanger.setTheme(ThemeMode.dark);
//                           } else {
//                             themeChanger.setTheme(ThemeMode.light);
//                           }

//                           // changeTheme(
//                           //     Provider.of<DarkThemeNotifier>(context,
//                           //                 listen: false)
//                           //             .isDarkMode
//                           //         ? false
//                           //         : true,
//                           //     context);
//                         },
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           MyBottomSheet().getBottomSheet(context);
//                         },
//                         icon: Icon(
//                           CupertinoIcons.profile_circled,
//                           size: Theme.of(context).iconTheme.size,
//                         ),
//                       ),
//                       Builder(builder: (context) {
//                         return IconButton(
//                             icon: const ImageIcon(
//                               AssetImage(
//                                 ImageConstants.menuIcon,
//                               ),
//                               // size: Theme.of(context).iconTheme.size,
//                             ),
//                             onPressed: () {
//                               Navigator.pushNamed(
//                                   context, MySettings.routeName);
//                             },
//                             color: Colors.white);
//                       })
//                     ],
//                   ))
//                 ],
//                 flexibleSpace: Center(
//                   child: Container(
//                     height: 100,
//                     alignment: Alignment.bottomCenter,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(100),
//                             child: InkWell(
//                               child: selectedImage != null
//                                   ? ClipRRect(
//                                       borderRadius: BorderRadius.circular(100),
//                                       child: Image.file(
//                                         selectedImage!,
//                                         height: 80,
//                                       ),
//                                     )
//                                   : Image.asset(
//                                       ImageConstants.profile,
//                                       height: 80,
//                                     ),
//                               onTap: () {
//                                 showModalBottomSheet(
//                                   shape: const RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.vertical(
//                                     top: Radius.circular(20),
//                                   )),
//                                   builder: (context) {
//                                     return Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           ListTile(
//                                             onTap: (() =>
//                                                 pickImage(ImageSource.camera)),
//                                             leading: CircleAvatar(
//                                                 backgroundColor:
//                                                     Theme.of(context)
//                                                         .backgroundColor,
//                                                 child: const Icon(
//                                                   CupertinoIcons.camera,
//                                                   color: Colors.white,
//                                                 )),
//                                             title: const Text("Take photo"),
//                                           ),
//                                           ListTile(
//                                             onTap: () =>
//                                                 pickImage(ImageSource.gallery),
//                                             leading: CircleAvatar(
//                                                 backgroundColor:
//                                                     Theme.of(context)
//                                                         .backgroundColor,
//                                                 child: const Icon(
//                                                     CupertinoIcons.folder,
//                                                     color: Colors.white)),
//                                             title: const Text("Upload photo"),
//                                           ),
//                                           ListTile(
//                                             onTap: () {
//                                               Navigator.pushNamed(context,
//                                                   ProfilePage.routeName);
//                                             },
//                                             leading: CircleAvatar(
//                                               backgroundColor: Theme.of(context)
//                                                   .backgroundColor,
//                                               child: const Icon(
//                                                   CupertinoIcons.person,
//                                                   color: Colors.white),
//                                             ),
//                                             title: const Text("View profile"),
//                                           ),
//                                         ]);
//                                   },
//                                   // onClosing: null,
//                                   context: context,
//                                 );
//                               },
//                             ),
//                           ),
//                           // Container(
//                           //   child: Column(children: [
//                           //     Text(
//                           //       'Mobile AppDeveloper',
//                           //       style: TextStyle(
//                           //         color: Colors.white,
//                           //         fontSize: 20,
//                           //       ),
//                           //     ),1
//                           //     Text('Project CPN'),
//                           //   ]),
//                           // ),
//                           //yedi chai hamlai post and detail of the employee in page chaiyexa vane chai yo app garda hunxa
//                           Column(
//                             children: [
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                               SimpleButton(
//                                   title:
//                                       "CheckedIn : ${schedules?.checkIn ?? 'N/A'}"),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               SimpleButton(
//                                   title: schedules?.checkOut != null
//                                       ? 'CheckedOut : ${schedules?.checkOut}'
//                                       : 'CheckedOut: N/A'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               )),
//   }
// }