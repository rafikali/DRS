import 'package:flutter/material.dart';
import 'package:login_page/onboardingpages/onboarding_one.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/pages/login_page.dart';

import '../widgets/profile_page_appbar.dart';

class OnBoardPage extends StatefulWidget {
  static const String routeName = 'OnBoard';
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  int pagesIndex = 0;
  PageController? pageController = PageController();
  List<Widget> Pages = [
    HomePage(),
    LoginPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
        onPageChanged: (int index) {
          setState(() {
            pagesIndex = index;
          });
        },
        controller: pageController,
        physics: BouncingScrollPhysics(),
        children: [
          OnBoardOne(),
          LoginPage(),
          Profile(),
        ]
        // HomePage(),
        // LoginPage(),
        // Profile(),
        );
  }
}
