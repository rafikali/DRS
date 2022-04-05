import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/Constants/Images.dart';

class OnBoardTwo extends StatefulWidget {
  static const String routeName = 'onBoardTwo';
  const OnBoardTwo({Key? key}) : super(key: key);

  @override
  State<OnBoardTwo> createState() => _OnBoardTwoState();
}

class _OnBoardTwoState extends State<OnBoardTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImageConstants.manageGoal,
              height: 220,
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              'Enhance Collaboration',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Levels up  your inner capabilities with collaborating environment',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  minRadius: 4,
                  maxRadius: 6,
                  backgroundColor: Colors.green,
                ),
                CircleAvatar(
                  minRadius: 4,
                  maxRadius: 6,
                  backgroundColor: Colors.black,
                ),
                CircleAvatar(
                  minRadius: 4,
                  maxRadius: 6,
                  backgroundColor: Colors.red,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
