import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/widgets/Actionchip.dart';

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return MyActionChip(
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Introduction to the company',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Icon(
                        CupertinoIcons.chevron_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onPress: () {
                    scrollView();
                  });
            }),
      ),
    );
  }
}
