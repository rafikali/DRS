import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/Constants/Images.dart';
import 'package:login_page/Constants/app_colors.dart';

class OnBoardOne extends StatefulWidget {
  static const String routeName = 'onBoardOne';
  const OnBoardOne({Key? key}) : super(key: key);

  @override
  State<OnBoardOne> createState() => _OnBoardOneState();
}

class _OnBoardOneState extends State<OnBoardOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SvgPicture.asset(ImageConstants.joyfulEnvironment),
            const Text('Enhance Collaboration'),
            const SizedBox(
              height: 15,
            ),
            const Text(
                'Levels up  your inner capabilities with collaborating environment'),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blue,
                  height: 5,
                  width: 5,
                ),
                Container(
                  color: Colors.black,
                  height: 5,
                  width: 5,
                ),
                Container(
                  height: 5,
                  color: Colors.green,
                  width: 5,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Skip'),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primaryColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {},
                  child: Text('Next'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
