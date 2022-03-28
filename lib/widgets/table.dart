import 'package:flutter/material.dart';

//ignore: must_be_immutable
class TableData extends StatefulWidget  {
  final String? leadingTitle;
  final String? projectTitle;
  final String? trailingTitle;
  dynamic updateDate;
  dynamic addAtendence;
  dynamic fourthTitle;
  final List<DataLabels> columns;
  final List<DataCell>? shells;
  final List<DataLabels> rows;

  dynamic attendence;
  final String? projectName;
  dynamic todayWork;
  final IconData? addIcon;
  TableData({Key? key,
    this.addIcon,
    this.leadingTitle,
    this.projectName,
    this.trailingTitle,
    required this.columns,
    this.projectTitle,
    this.updateDate,
    this.todayWork,
    this.attendence,
    this.addAtendence,
    this.fourthTitle,
    required this.rows,
    this.shells,
  }) : super(key: key);

  @override
  State<TableData> createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  IconData? addIcon;
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: widget.columns.map<DataColumn>((e) => DataColumn(label: e.label)).toList(),
          // columns:  <DataColumn>[
            // DataColumn(
            //     label: Text(widget.projectName ?? 'project'),
            // ),

            // DataColumn(
            //   label: widget.fourthTitle ?? 'attendances',
            // ),

          // ],

      rows : widget.rows.map<DataRow>((e) => DataRow(cells:
      <DataCell>[
        DataCell(Text(e.dataCell)),
        DataCell(Text(e.dataCell)),
        DataCell(Text(e.dataCell)),])).toList(),

        );
      }


}


class DataLabels {
  dynamic label;
  final dataCell;
  DataLabels({this.label, this.dataCell});
}
