import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/models/carddata.dart';
import 'package:login_page/services/dashboard_services.dart';
import 'package:login_page/utils/pref_services.dart';
import 'package:login_page/widgets/GridView.dart';

import '../models/models.dart';
import '../services/daily_update_services.dart';
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
  DailyUpdatesModel? recentUpdates2 = DailyUpdatesModel();
  // String? dashboardCount;

  // var nullCheck = NullCheck.NullChecker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCardData();
    fetchDailyUpdate();
  }

  // Future DashCount() async {
  //    dashboardCount =
  //        await PrefsServices().getString(AppConstants.dashBoardCount);
  //  }

  fetchCardData() async {
    final CardData? cardData = await DashBoardServices().fetchCardData();
    if (cardData != null) {
      if (mounted) {
        setState(() {
          dashboardCardData = cardData;
        });
        PrefsServices().setString(AppConstants.dashBoardCount,
            dashboardCardData!.myMissingCheckoutCount.toString());
      }
    }
  }

  fetchDailyUpdate() async {
    final DailyUpdatesModel? updates2 =
        await DailyUpdateServices().fetchDailyUpdate();
    if (updates2 != null) {
      if (mounted) {
        setState(() {
          recentUpdates2 = updates2;
        });
      }
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
                  // count: dashboardCardData?.myMissingCheckoutCount != null
                  //     ? dashboardCardData?.myMissingCheckoutCount.toString()
                  //     : 'Updating..',
                  count: dashboardCardData?.myMissingCheckoutCount != null
                      ? dashboardCardData?.myMissingCheckoutCount.toString()
                      : 'N/A'),
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
                        leading: Text(recentUpdates2?.data != null
                            ? recentUpdates2!.data![0].dailyupdateFor.toString()
                            : 'N/A'),
                        title: Column(
                          children: [
                            Text(
                              recentUpdates2?.data != null
                                  ? recentUpdates2!.data![0].title.toString()
                                  : 'N/A',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(recentUpdates2?.data != null
                                ? recentUpdates2!.data![0].description
                                    .toString()
                                : "N/A"),
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
