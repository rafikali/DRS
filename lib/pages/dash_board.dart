import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/widgets/GridView.dart';

import '../widgets/Card.dart';

class DashBoard extends StatelessWidget {
   const DashBoard(
      {Key? key,
      })
      : super(key: key);

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
                color: const Color(0xFFff3333),
                count: '1',
              ),

              CardView(
                dashboardIcon: CupertinoIcons.creditcard,
                title: 'My Ghost Count',
                color: Colors.black,
                count: '0',
              ),

              CardView(
                dashboardIcon: CupertinoIcons.creditcard,
                title: 'My Leave Balance',
                color: Colors.black,
                count: '0',
              ),

              CardView(
                dashboardIcon: CupertinoIcons.tv,
                title: 'My NODailyUpdates',
                color: Colors.black,
                count: '0',
              ),
          ],),
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

