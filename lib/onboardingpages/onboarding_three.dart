import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/Constants/Images.dart';

class OnBoardThree extends StatefulWidget {
  static const String routeName = 'onBoardThree';
  const OnBoardThree({Key? key}) : super(key: key);

  @override
  State<OnBoardThree> createState() => _OnBoardThreeState();
}

class _OnBoardThreeState extends State<OnBoardThree> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImageConstants.joyfulEnvironment,
              height: 220,
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              'Research BuildUp',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Builds up your research level to be the better version everyday',
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
