import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_page/widgets/login_button.dart';

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
        appBar: PreferredSize(

          preferredSize: const Size.fromHeight(250.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 2,
            backgroundColor: const Color(0xFF6C63FF),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(200, 40),

                )
            ),
            title: const SizedBox(
              child: Text('STT NEPAL',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),

                textAlign: TextAlign.center,
               ),
            ),





            actions:  [
              Container(
                height: 120,
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(CupertinoIcons.moon, color: Colors.white, ),
                    Icon(CupertinoIcons.profile_circled, color: Colors.white),
                    Icon(CupertinoIcons.settings_solid, color: Colors.white),
                  ],
                )

              )

            ],
            bottom: TabBar(
                tabs: [
                  Tab(child: Text('hi'),),
                  Tab(child: Text('hi'),),
                  Tab(child: Text('hi'),),

                ]),

            flexibleSpace: Center(
              child: Container(
                height: 120,

                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network('https://scontent.fktm10-1.fna.fbcdn.net/v/t39.30808-6/251866722_1471513583220352_7206582625725183106_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=ULttbaBi5QUAX-ZNNfj&tn=pwi-Uq17f60A-ioL&_nc_ht=scontent.fktm10-1.fna&oh=00_AT-_K63asaBXDkYu5M2LiFWOBRCTCLGEN8_zPGIuRsdnGA&oe=623D573A'),
                        ),
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
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const SizedBox(
                //       height: 10,
                //     ),
                //     SimpleButton(),
                //     const SizedBox(
                //       height: 8,
                //     ),
                //     SimpleButton(),
                //   ],
                // ),
              ),
            ),
              )),



        body: Container(
        )

      ),
    );
  }
}


