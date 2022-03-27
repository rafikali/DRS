import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/widgets/alertbox..dart';

class TableData extends StatefulWidget {
  final String? leadingTitle;
  final String? projectTitle;
  final String? trailingTitle;
  dynamic updateDate;
  final addAtendence;
  final fourthTitle;
  final List<DataColumn> columns;

  final attendence;
  final String? projectName;
  final todayWork;
  IconData? addIcon;
  TableData({Key? key, this.addIcon,this.leadingTitle, this.projectName, this.trailingTitle, this.projectTitle, this.updateDate, this.todayWork, this.attendence, this.addAtendence, this.fourthTitle, this.columns}) : super(key: key);

  @override
  State<TableData> createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  IconData? addIcon;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns:  <DataColumn>[
        DataColumn(
          label: Text(widget.updateDate)
        ),
        DataColumn(
          label: Text(
            widget.projectTitle ?? 'Project'
          ),
        ),
        DataColumn(
          label: widget.addAtendence ?? 'project',
        ),
        // DataColumn(
        //   label: widget.fourthTitle ?? 'attendances',
        // ),

      ],

      rows:  <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text(widget.updateDate)),
            DataCell(Text(widget.projectName ?? 'N/A')),
            DataCell(Text(widget.todayWork)),
            // DataCell(Text(widget.fourthTitle))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(
                Text(widget.updateDate)),
            DataCell(Text(widget.projectName ?? 'N/A')),
            DataCell(Text(widget.todayWork)),
            // DataCell(Text(widget.fourthTitle))
          ],
        ),

      ],
    );
  }
}


class DataLabels {
  final label;
  DataLabels({this.label});
}
