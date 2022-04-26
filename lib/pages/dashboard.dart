// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/pages/my_missing_checkout.dart';
import 'package:login_page/pages/myleaves_transaction.dart';
import 'package:login_page/services/daily_update_services.dart';
import 'package:login_page/services/dashboard_services.dart';
import 'package:login_page/utils/pref_services.dart';
import 'package:login_page/widgets/Card.dart';
import 'package:login_page/widgets/GridView.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/carddata.dart';
import '../models/models.dart';

class DashBoard extends StatefulWidget {
  // final String? checkDashCount;
  const DashBoard({
    Key? key,
    // this.checkDashCount,
  }) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String missingCheckout = '';
  String ghostCount = '';
  CardData? dashboardCardData;
  DailyUpdatesModel? recentUpdates2;
  @override
  void initState() {
    super.initState();
    fetchCardDataApi();
    fetchDailyUpdateApi();
  }

  dashCountNumber() async {
    final getDashCount =
        await PrefsServices().getString(AppConstants.missingCheckout);
    print(getDashCount);

    final getGhostCount =
        await PrefsServices().getString(AppConstants.ghostCount);
    print(getGhostCount);
    if (getDashCount != null && mounted) {
      setState(() {
        missingCheckout = getDashCount;
        ghostCount = getGhostCount!;
      });
    }
  }

  fetchCardDataApi() async {
    // dashboardCardData = await DashBoardServices().fetchCardData();
    DashBoardServices().fetchCardData().then((value) {
      if (value != null && mounted) {
        setState(() {
          dashboardCardData = value;
          PrefsServices().setString(AppConstants.missingCheckout,
              dashboardCardData!.myMissingCheckoutCount.toString());
          PrefsServices().setString(AppConstants.ghostCount,
              dashboardCardData!.myGhostCount.toString());
        });
      }
    });
  }

  fetchDailyUpdateApi() {
    DailyUpdateServices().fetchDailyUpdate().then((value) {
      if (value != null && mounted) {
        setState(() {
          recentUpdates2 = value;
          print(recentUpdates2!.data![0].dailyupdateFor);
        });
      }
    });
  }
  //  dashboardCardData == null
  //         ? const Center(
  //             child: CircularProgressIndicator(),
  //           )
  //         :

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: ListView(
        children: [
          Grid(
            shrinkWrap: true,
            children: [
              CardView(
                onTap: (() =>
                    Navigator.pushNamed(context, MyMissingCheckout.routeName)),
                dashboardIcon: CupertinoIcons.clock,
                title: 'My Missing Checkout',
                color:
                    dashboardCardData?.myMissingCheckoutCount.toString() == '0'
                        ? Colors.green
                        : Colors.red,
                count: dashboardCardData?.myMissingCheckoutCount.toString() ??
                    'N/A',
              ),
              CardView(
                dashboardIcon: CupertinoIcons.creditcard,
                // onTap:(() =>  Navigator.pushNamed(context, Mygo.routeName)),

                title: 'My Ghost Count',
                color: dashboardCardData?.myGhostCount.toString() == '0'
                    ? Colors.green
                    : Colors.red,
                count: dashboardCardData?.myGhostCount.toString() ?? 'N/A',
              ),
              CardView(
                  dashboardIcon: CupertinoIcons.creditcard,
                  onTap: (() => Navigator.pushNamed(
                      context, MyLeaveTransaction.routeName)),
                  title: 'My Leave Balance',
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  count: dashboardCardData?.myLeaveBalanceCount.toString() ??
                      'N/A'),
              CardView(
                  dashboardIcon: CupertinoIcons.tv,
                  title: 'My NoDailyUpdates',
                  // onTap:(() =>  Navigator.pushNamed(context, Myndai.routeName)),

                  color: Theme.of(context).textTheme.bodyText1!.color,
                  count: dashboardCardData?.myNoDailyUpdatesCount.toString() ??
                      'N/A'),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Card(
            elevation: 0.3,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Recent Daily Update:',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Update For',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          'Title',
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  recentUpdates2?.data!.length == null
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            ListTile(
                              leading: Text(
                                recentUpdates2?.data != null
                                    ? recentUpdates2!.data![0].dailyupdateFor
                                        .toString()
                                    : 'N/A',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.center,
                              ),
                              title: Column(
                                children: [
                                  Text(recentUpdates2?.data![0].title ?? 'N/A',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    recentUpdates2?.data![0].description ??
                                        'N/A',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
