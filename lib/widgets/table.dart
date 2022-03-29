import 'package:flutter/material.dart';

//ignore: must_be_immutable
class TableData extends StatefulWidget {
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

  TableData({
    Key? key,
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
      columns: widget.columns
          .map<DataColumn>((e) => DataColumn(label: e.label))
          .toList(),
      // columns:  <DataColumn>[
      // DataColumn(
      //     label: Text(widget.projectName ?? 'project'),
      // ),

      // DataColumn(
      //   label: widget.fourthTitle ?? 'attendances',
      // ),

      // ],

      rows: widget.rows
          .map<DataRow>((e) => DataRow(
                  cells: e.dataCell.map<DataCell>((f) {
                return DataCell(Text(f));
              }).toList()))
          .toList(),
    );
  }
}

class AttendanceTable extends StatefulWidget {

  final List<DataLabels> columns;
  final List<DataLabels> rows;


  AttendanceTable({
    Key? key,
    required this.columns,
    required this.rows
  }) : super(key: key);

  @override
  State<AttendanceTable> createState() => _AttendanceTableState();
}

class _AttendanceTableState extends State<AttendanceTable> {
  IconData? addIcon;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: widget.columns
        .map<DataColumn>((e) => DataColumn(label: e.label2))
          .toList(),

      rows: widget.rows
          .map<DataRow>((e) => DataRow(
          cells: e.dataCell2.map<DataCell>((f) {
            return DataCell(Text(f));
          }).toList()))
          .toList(),

    );
  }
}

class DataLabels {
  dynamic label;
  final dataCell;
  dynamic label2;
  dynamic dataCell2;


  DataLabels({this.label,this. dataCell2, this.label2, this.dataCell});
}
