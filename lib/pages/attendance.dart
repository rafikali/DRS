import 'package:flutter/material.dart';
import 'package:login_page/widgets/table.dart';

class MyAttendances extends StatelessWidget {
  const MyAttendances({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       scrollDirection: Axis.horizontal,

      child: TableData(
        columns: [
          DataLabels(label: Text('Date')),
          DataLabels(label: Text('Check In')),
          DataLabels(label: Text('Check out')),
        ],

        rows: [
          DataLabels(dataCell: 'children',),
          DataLabels(dataCell: 'children',),
          DataLabels(dataCell: 'chil'),
        ],






       // rows: [
       //   DataRow(
       //       cells: [
       //         DataCell(child)
       //       ])
       // ]



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
