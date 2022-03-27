import 'package:flutter/material.dart';

//ignore: must_be_immutable
class TableData extends StatefulWidget  {
  final String? leadingTitle;
  final String? projectTitle;
  final String? trailingTitle;
  dynamic updateDate;
  dynamic addAtendence;
  dynamic fourthTitle;
  // final List<DataColumn> columns;

  dynamic attendence;
  final String? projectName;
  dynamic todayWork;
  final IconData? addIcon;
  TableData({Key? key, this.addIcon,this.leadingTitle, this.projectName, this.trailingTitle, this.projectTitle, this.updateDate, this.todayWork, this.attendence, this.addAtendence, this.fourthTitle, }) : super(key: key);

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
                label: Text(widget.projectName ?? 'project'),
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
  dynamic label;
  DataLabels({this.label});
}
