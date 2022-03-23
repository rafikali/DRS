import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/widgets/simple_button.dart';

import 'login_button.dart';

class ProfilePageAppBar extends StatelessWidget {
  const ProfilePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
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
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,

              ),),
          ),




          flexibleSpace: Center(
            child: Container(
              height: 120,

              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network('https://scontent.fktm10-1.fna.fbcdn.net/v/t39.30808-6/251866722_1471513583220352_7206582625725183106_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=ULttbaBi5QUAX-ZNNfj&tn=pwi-Uq17f60A-ioL&_nc_ht=scontent.fktm10-1.fna&oh=00_AT-_K63asaBXDkYu5M2LiFWOBRCTCLGEN8_zPGIuRsdnGA&oe=623D573A'),
                    ),

                    Wrap(
                      runSpacing: 10.0,
                      spacing: 1,
                      alignment: WrapAlignment.center,
                      direction: Axis.vertical,

                      children: const  [
                        SimpleButton(title: 'Checked Ub:',

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
          actions:  [
            SizedBox(
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
        ));
  }
}
