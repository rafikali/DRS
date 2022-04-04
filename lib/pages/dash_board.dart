import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/models/carddata.dart';
import 'package:login_page/services/dashboard_services.dart';
import 'package:login_page/widgets/GridView.dart';

import '../widgets/Card.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  CardData? dashboardCardData;
  // var nullCheck = NullCheck.NullChecker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCardData();
  }

  fetchCardData() async {
    final CardData? cardData = await DashBoardServices().fetchCardData();
    if (cardData != null) {
      setState(() {
        dashboardCardData = cardData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Grid(
            children: [
              CardView(
                dashboardIcon: CupertinoIcons.clock,
                title: 'My Missing Checkout',
                color: Colors.lightGreen,
                count: dashboardCardData?.myMissingCheckoutCount != null
                    ? dashboardCardData?.myMissingCheckoutCount.toString()
                    : 'Updating..',
              ),
              CardView(
                dashboardIcon: CupertinoIcons.creditcard,
                title: 'My Ghost Count',
                color: Colors.black,
                count: dashboardCardData?.myGhostCount != null
                    ? dashboardCardData?.myGhostCount.toString()
                    : 'Updating..',
              ),
              CardView(
                dashboardIcon: CupertinoIcons.creditcard,
                title: 'My Leave Balance',
                color: Colors.black,
                count: dashboardCardData?.myLeaveBalanceCount != null
                    ? dashboardCardData?.myLeaveBalanceCount.toString()
                    : 'Updating..',
              ),
              CardView(
                dashboardIcon: CupertinoIcons.tv,
                title: 'My NODailyUpdates',
                color: Colors.black,
                count: dashboardCardData?.myNoDailyUpdatesCount != null
                    ? dashboardCardData?.myNoDailyUpdatesCount.toString()
                    : 'Updating..',
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Recent Daily Update:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, right: 48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Update For',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Title',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: ListTile(
                        leading: const Text('2022-03-21 (Mon)'),
                        title: Column(
                          children: const [
                            Text('Daily Update [ 2022-03-21 (Mon ) ]'),
                            Text('1. worked on homepageappbar'),
                            Text('2.  forgot password completed'),
                            Text('3. added changes to OTP verification page'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      'Recent Daily Update:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, right: 48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Update For',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Title',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: ListTile(
                        leading: const Text('2022-03-21 (Mon)'),
                        title: Column(
                          children: const [
                            Text('Daily Update [ 2022-03-21 (Mon ) ]'),
                            Text('1. worked on homepageappbar'),
                            Text('2.  forgot password completed'),
                            Text('3. added changes to OTP verification page'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
