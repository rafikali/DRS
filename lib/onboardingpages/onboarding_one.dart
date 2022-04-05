import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/Constants/Images.dart';

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
        body: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ImageConstants.collaboration,
                height: 220,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: const [
                    Text(
                      'Enhance Collaboration',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Levels up  your inner capabilities with collaborating environment',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
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
      ),
    );
  }
}
