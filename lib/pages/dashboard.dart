import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/models/carddata.dart';
import 'package:login_page/pages/my_missing_checkout.dart';
import 'package:login_page/pages/myleaves_transaction.dart';
import 'package:login_page/services/dashboard_services.dart';
import 'package:login_page/utils/pref_services.dart';
import 'package:login_page/widgets/GridView.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import '../services/daily_update_services.dart';
import '../widgets/Card.dart';

class DashBoard extends StatefulWidget {
  final String? checkDashCount;
  const DashBoard({
    Key? key,
    this.checkDashCount,
  }) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String? missingCheckout = '';
  String? ghostCount = '';
  CardData? dashboardCardData;
  DailyUpdatesModel? recentUpdates2;

  // String? dashboardCount;

  // var nullCheck = NullCheck.NullChecker();

  @override
  void initState() {
    super.initState();
    // fetchCardData();
  }

  dashCountNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final getDashCount = prefs.getString(AppConstants.missingCheckout);
    final getGhostCount = prefs.getString(AppConstants.ghostCount);
    if (getDashCount != null && mounted) {
      setState(() {
        missingCheckout = getDashCount;
        ghostCount = getGhostCount;
      });
    }
  }

  fetchCardData() {
    DashBoardServices().fetchCardData().then((value) {
      if (value != null) {
        setState(() {
          dashboardCardData = value;
        });
        PrefsServices().setString(AppConstants.missingCheckout,
            dashboardCardData!.myMissingCheckoutCount.toString());
        PrefsServices().setString(AppConstants.ghostCount,
            dashboardCardData!.myGhostCount.toString());
      }
    });
  }

  fetchDailyUpdate() {
    DailyUpdateServices().fetchDailyUpdate().then((value) {
      if (value != null && mounted) {
        setState(() {
          recentUpdates2 = value;
          var title = recentUpdates2?.data?[0].title ?? '';
          PrefsServices().setString(AppConstants.title, title.toString());
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
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: RefreshIndicator(
          onRefresh: () async {
            await fetchDailyUpdate();
          },
          child: Builder(builder: (context) {
            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Grid(
                  shrinkWrap: true,
                  children: [
                    CardView(
                        onTap: (() => Navigator.pushNamed(
                            context, MyMissingCheckout.routeName)),
                        dashboardIcon: CupertinoIcons.clock,
                        title: 'My Missing Checkout',
                        color:
                            missingCheckout == '0' ? Colors.green : Colors.red,
                        // count: dashboardCardData?.myMissingCheckoutCount != null
                        //     ? dashboardCardData?.myMissingCheckoutCount.toString()
                        //     : 'Updating..',
                        count: missingCheckout),
                    CardView(
                      dashboardIcon: CupertinoIcons.creditcard,
                      // onTap:(() =>  Navigator.pushNamed(context, Mygo.routeName)),

                      title: 'My Ghost Count',
                      color: ghostCount == '0' ? Colors.green : Colors.red,
                      count: ghostCount ?? '0',
                    ),
                    CardView(
                        dashboardIcon: CupertinoIcons.creditcard,
                        onTap: (() => Navigator.pushNamed(
                            context, MyLeaveTransaction.routeName)),
                        title: 'My Leave Balance',
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        count:
                            dashboardCardData?.myLeaveBalanceCount.toString() ??
                                'N/A'),
                    CardView(
                        dashboardIcon: CupertinoIcons.tv,
                        title: 'My NODailyUpdates',
                        // onTap:(() =>  Navigator.pushNamed(context, Myndai.routeName)),

                        color: Theme.of(context).textTheme.bodyText1!.color,
                        count: dashboardCardData?.myNoDailyUpdatesCount
                                .toString() ??
                            'N/A'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            'Recent Daily Update:',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline6,
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
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  'Title',
                                  style: Theme.of(context).textTheme.headline6,
                                )
                              ],
                            ),
                          ),
                          const Divider(),
                          ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: recentUpdates2?.data!.length,
                            itemBuilder: ((context, index) {
                              return recentUpdates2 == null
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : ListTile(
                                      leading: Text(
                                          recentUpdates2?.data != null
                                              ? recentUpdates2!
                                                  .data![index].dailyupdateFor
                                                  .toString()
                                              : 'N/A',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      title: Column(
                                        children: [
                                          Text(
                                            recentUpdates2
                                                    ?.data![index].title ??
                                                'N/A',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          // WebView(
                                          //   initialUrl: UriData.fromString(
                                          //           recentUpdates2!.data![0].description
                                          //               .toString(),
                                          //           encoding: Encoding.getByName('utf-8'),
                                          //           mimeType: 'text/html')
                                          //       .toString(),
                                          // )
                                          // Html(data: recentUpdates2!.data![0].description),
                                          Text(
                                            recentUpdates2?.data![index]
                                                    .description ??
                                                'N/A',
                                          ),
                                        ],
                                      ),
                                    );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
