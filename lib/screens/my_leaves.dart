import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/widgets/dropView.dart';
import 'package:login_page/widgets/myappbar.dart';
import 'package:login_page/widgets/table.dart';

import '../widgets/my_textfield.dart';

class MyLeaves extends StatefulWidget {
  static const String routeName = '/leaves';

  const MyLeaves({Key? key}) : super(key: key);

  @override
  State<MyLeaves> createState() => _MyLeavesState();
}

class _MyLeavesState extends State<MyLeaves> {
  Future refreshData() async {
    // var hello = 'hi';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: 'Leaves',
          actions: [
            IconButton(
              icon: const Icon(
                CupertinoIcons.color_filter,
              ),
              color: Colors.red,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.add_circled_solid,
                color: Colors.green,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.refresh,
                color: Colors.blue,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Card(
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     const Text(''),
              //     Text(
              //       'MY Leaves',
              //       style: Theme.of(context).textTheme.headline6,
              //     ),
              // Row(
              //   children: [
              //     Expanded(
              //       // flex: 1,
              //       child: LoginTextForm(
              //         readonly: true,
              //         fillcolor: Theme.of(context).cardColor,
              //         hintText: 'Date',
              //         trailingIcon: const Icon(CupertinoIcons.calendar),
              //       ),
              //     ),
              //     Expanded(
              //       // flex: 1,
              //       child: DropView(
              //         dropdownItems: const [
              //           'APPROVED',
              //           'APPLIED',
              //           'EDITED',
              //           'REJECTED'
              //         ],
              //         date: 'Filter by Status',
              //       ),
              //     ),
              //   ],
              // ),
              TableData(columns: [
                DataLabels(label: const Text('#')),
                DataLabels(label: const Text('Start Date')),
                DataLabels(label: const Text('No. of Days')),
                DataLabels(label: const Text('Reason')),
                DataLabels(label: const Text('Status')),
                DataLabels(label: const Text('Created at')),
                DataLabels(label: const Text('Actions')),
              ], rows: [
                DataLabels(
                    dataCell: ['No Data available', '', '', '', '', '', '']),
              ])
            ],
          ),
        ));
  }
}
