import 'package:flutter/cupertino.dart';
// ignore: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:login_page/widgets/table.dart';

class MyLeaveTransaction extends StatefulWidget {
  static const String routeName = '/myleavetransaction';
  const MyLeaveTransaction({Key? key}) : super(key: key);

  @override
  State<MyLeaveTransaction> createState() => _MyLeaveTransactionState();
}

class _MyLeaveTransactionState extends State<MyLeaveTransaction> {
  bool refreshButton = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshPage();
  }

  refreshPage() {
    setState(() {
      refreshButton = refreshButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Leave Transaction',
                  style: Theme.of(context).textTheme.headline6,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.refresh_circled,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            TableData(columns: [
              DataLabels(label: const Text('#')),
              DataLabels(label: const Text('Narration')),
              DataLabels(label: const Text('Days')),
              DataLabels(label: const Text('Type')),
              DataLabels(label: const Text('Remaining Days')),
              DataLabels(label: const Text('Calender year')),
              DataLabels(label: const Text('Created At')),
            ], rows: [
              DataLabels(
                dataCell: [
                  '1',
                  'Annual Leave (10 days) - 2078/79',
                  '3.52',
                  'CR',
                  '3.52',
                  '2078/79',
                  '2022-03-14 15:33:38'
                ],
              ),
            ])
          ]),
        ),
      ),
    );
  }
}
