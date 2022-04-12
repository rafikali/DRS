import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Constants/Images.dart';
import '../widgets/alertbox..dart';
import '../widgets/simple_button.dart';

class SliverBar extends StatefulWidget {
  final String? checkIn;
  final String? checkOut;
  const SliverBar({this.checkOut, this.checkIn}) : super();

  @override
  State<SliverBar> createState() => _SliverBarState();
}

class _SliverBarState extends State<SliverBar> {
  bool mode = true;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      pinned: true,
      expandedHeight: 250,
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
            Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(CupertinoIcons.profile_circled,
                    color: Colors.white),
              );
            }),
            // const SizedBox(
            //   width: 4,
            // ),
            InkWell(
                onTap: () {},
                child: Builder(builder: (context) {
                  return IconButton(
                      icon: const Icon(
                        CupertinoIcons.gear_solid,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      color: Colors.white);
                })),
            // const SizedBox(
            //   width: 15,
            // ),
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
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Column(
                            children: [
                              const ListTile(
                                leading: Text('Cancel'),
                                title: Text('Add Item'),
                              ),
                              Column(
                                children: const [
                                  ListTile(
                                      leading:
                                          FaIcon(FontAwesomeIcons.fileImage),
                                      title: Text('Photos')),
                                  ListTile(
                                      leading:
                                          FaIcon(FontAwesomeIcons.fileImage),
                                      title: Text('Photos')),
                                  ListTile(
                                      leading:
                                          FaIcon(FontAwesomeIcons.fileImage),
                                      title: Text('Photos')),
                                  ListTile(
                                      leading:
                                          FaIcon(FontAwesomeIcons.fileImage),
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
                      title: widget.checkIn!,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SimpleButton(title: widget.checkOut!),
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
                    1.0, // vertical, move down 10
                  ),
                )
              ]),
          width: MediaQuery.of(context).size.width * 0.8,
          child: const TabBar(
              labelColor: Color(0xFF6C63FF),
              unselectedLabelColor: Color.fromRGBO(0, 0, 0, 1),
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
    );
  }
}
