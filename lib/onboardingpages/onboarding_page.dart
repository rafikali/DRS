import 'package:flutter/material.dart';
import 'package:login_page/onboardingpages/onboarding_one.dart';
import 'package:login_page/pages/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Constants/app_colors.dart';
import 'onboarding_three.dart';
import 'onboarding_two.dart';

class OnBoardPage extends StatefulWidget {
  static const String routeName = 'OnBoard';

  const OnBoardPage({Key? key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  int pagesIndex = 0;
  bool? isLastPage = false;
  final pageController = PageController();
  List<Widget> pages = [
    const OnBoardOne(),
    const OnBoardTwo(),
    const OnBoardThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: isLastPage!
          ? Container(
              color: AppColors.primaryColor,
              width: double.infinity,
              child: TextButton(
                  style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Color(0xFFD3D3D3)),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColor),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () async {
                    Future.delayed(const Duration(seconds: 2));

                    await Navigator.pushNamedAndRemoveUntil(context,
                        LoginPage.routeName, (Route<dynamic> route) => false);
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 20),
                  )),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    SmoothPageIndicator(
                        effect: const WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            dotColor: Colors.grey,
                            activeDotColor: Colors.green),
                        onDotClicked: (index) {
                          pageController.animateToPage(index,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        controller: pageController,
                        count: 3),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryColor),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        pageController.nextPage(
                            curve: Curves.easeIn,
                            duration: const Duration(milliseconds: 300));
                      },
                      child: const Text(
                        'Next ->',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
      body: PageView(
        onPageChanged: (int index) {
          setState(() {
            isLastPage = index == 2;
          });
        },
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        children: pages,
        // HomePage(),
        // LoginPage(),
        // Profile(),
      ),
    );
  }
}
