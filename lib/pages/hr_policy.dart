import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HRPolicy extends StatefulWidget {
  static const String routeName = 'hrPolicy';

  const HRPolicy({Key? key}) : super(key: key);

  @override
  State<HRPolicy> createState() => _HRPolicyState();
}

class _HRPolicyState extends State<HRPolicy> {
  bool changeButton = false;

  scrollView() {
    setState(() {
      changeButton = !changeButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://app.growteamly.com/company/hr-Policy',
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(10),
      //   child: ListView.builder(
      //       itemCount: 20,
      //       itemBuilder: (context, index) {
      //         // ignore: prefer_const_constructors
      //         return Container(
      //           child: Text('Introduction to the company'),
      //           decoration:
      //               BoxDecoration(color: Colors.green, shape: BoxShape.circle),
      //         );
      //       }),
      // ),
    );
  }
}
