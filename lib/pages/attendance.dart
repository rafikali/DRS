import 'package:flutter/material.dart';
import 'package:login_page/widgets/table.dart';

class Attendances extends StatelessWidget {
  const Attendances({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(children: [
          const SizedBox(
            height: 5,
          ),
          const Text(
            'My Attendances',
            style: TextStyle(fontSize: 24),
          ),
          TableData(
            columns: [
              DataLabels(label: const Text('Date')),
              DataLabels(label: const Text('Check In')),
              DataLabels(label: const Text('Check out')),
              DataLabels(label: const Text('Worked Duration')),
              // DataLabels(label2: Text('Check out')),
            ],

            rows: [
              DataLabels(
                dataCell: [
                  '2022-03-28 (Mon)',
                  '09:52:21',
                  '19:29:10',
                  '10 hrs 14 min (1.14 day) '
                ],
              ),
              DataLabels(
                dataCell: [
                  '2022-0328 (Mon)',
                  '09:52:21',
                  '19:29:10',
                  '10 hrs 14 min (1.14 day) '
                ],
              ),
              DataLabels(dataCell: [
                '2022-03-28 (Mon)',
                '09:52:21',
                '19:29:10',
                '10 hrs 14 min (1.14 day) '
              ]),
              DataLabels(dataCell: [
                '2022-03-28 (Mon)',
                '09:52:21',
                '19:29:10',
                '10 hrs 14 min (1.14 day) '
              ]),
              // DataLabels(
              //     dataCell: ['2022-03-28 (jaj)', '09:52:21', '19:29:11', 'slf']),
              // DataLabels(dataCell2: ['2022-03-28 (Mon)', '09:52:21','19:29:10']),
            ],

            // rows: [
            //   DataRow(
            //       cells: [
            //         DataCell(child)
            //       ])
            // ]
          ),
        ]),
      ),
    );
  }
}
