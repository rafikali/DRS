import 'package:flutter/material.dart';
import 'package:login_page/widgets/table.dart';

class Attendances extends StatelessWidget {
  const Attendances({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Card(
        child: TableData(
          columns: [
            DataLabels(label: Text('Date')),
            DataLabels(label: Text('Check In')),
            DataLabels(label: Text('Check out')),
            DataLabels(label: Text('Worked Duration')),
            // DataLabels(label2: Text('Check out')),
          ],

          rows: [
            DataLabels(
              dataCell: ['2022-03-28 (Mon)', '09:52:21', '19:29:10', '10 hrs 14 min (1.14 day) '],
            ),
            DataLabels(
              dataCell: ['2022-03-28 (Mon)', '09:52:21', '19:29:10', '10 hrs 14 min (1.14 day) '],
            ),
            DataLabels(
                dataCell: ['2022-03-28 (Mon)', '09:52:21', '19:29:10', '10 hrs 14 min (1.14 day) ']),
            DataLabels(
                dataCell: ['2022-03-28 (Mon)', '09:52:21', '19:29:10', '10 hrs 14 min (1.14 day) ']),
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
      ),
      // child: DataTable(
      //   showBottomBorder: true,
      //
      //   columns:  const <DataColumn>[
      //     DataColumn(
      //       label: Text(
      //          'Date'
      //       ),
      //     ),
      //     DataColumn(
      //       label: Text(
      //          'Check-In'
      //       ),
      //     ),
      //     DataColumn(
      //       label: Text('Check-out')
      //     ),
      //     DataColumn(
      //       label: Text('Worked duration')
      //     ),
      //
      //
      //
      //
      //     // DataColumn(
      //     //   label: widget.fourthTitle ?? 'attendances',
      //     // ),
      //
      //   ],
      //
      //   rows:  const <DataRow>[
      //
      //     DataRow(
      //       cells: <DataCell>[
      //         DataCell(Text('hi')),
      //         DataCell(Text('hi')),
      //         DataCell(Text('hello')),
      //         DataCell(Text('hello')),
      //         // DataCell(Text(widget.fourthTitle))
      //       ],
      //     ),
      //     DataRow(
      //       cells: <DataCell>[
      //         DataCell(Text('hello')),
      //         DataCell(Text('N/A')),
      //         DataCell(Text('hello')),
      //         DataCell(Text('hello')),
      //         // DataCell(Text(widget.fourthTitle))
      //       ],
      //     ),
      //
      //   ],
      // ),
    );
  }
}
