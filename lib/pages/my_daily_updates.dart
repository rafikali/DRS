import 'package:flutter/material.dart';
import 'package:login_page/pages/my_dashboard.dart';
import 'package:login_page/widgets/dropView.dart';
import 'package:login_page/widgets/login_textfield.dart';
import 'package:login_page/widgets/table.dart';

class MyDailyUpdates extends StatefulWidget {
  static const String routeName = '/myDailyUpdate';

  const MyDailyUpdates({Key? key}) : super(key: key);

  @override
  State<MyDailyUpdates> createState() => _MyDailyUpdatesState();
}

class _MyDailyUpdatesState extends State<MyDailyUpdates> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF6C63FF),
          title: const Text(
            'STT NEPAL' + SuperVisior.watcher + SuperVisior.watcherName,
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Card(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'My Daily Update',
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(
                        child: LoginTextForm(
                      readonly: true,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return DatePickerDialog(
                                firstDate: DateTime(2000),
                                initialDate: DateTime.now(),
                                lastDate: DateTime(2030)
                                    .add(const Duration(days: 365)),
                              );
                            });
                      },
                      hintText: 'Date',
                      fillcolor: Colors.white,
                    )),
                    Expanded(
                      child: DropView(
                        date: 'Filter by project',
                        dropdownItems: const [
                          'Newskark',
                          'Bagmati VRS',
                          'CPN UML',
                          'NOC',
                          'Nepal ',
                          'Aayojak',
                          'hamrosms247',
                          'Ambition Guru'
                        ],
                      ),
                    )
                  ],
                ),
                InteractiveViewer(
                  panEnabled: false,
                  child: TableData(
                      columns: [
                    DataLabels(label: const Text('SN')),
                    DataLabels(label: const Text('Update for')),
                    DataLabels(label: const Text('Project')),
                    DataLabels(
                      label: const Text('Title'),
                    ),
                    DataLabels(
                      label: const Text('Acknowledge At'),
                    ),
                    DataLabels(
                      label: const Text('Created At'),
                    ),
                  ], rows: [
                    DataLabels(dataCell: [
                      '#',
                      '	2022-03-30 (Wed)',
                      'N/A',
                      'Daily Update [ 2022-03-30 (Wed) ]',
                      '2022-03-31 09:16:52',
                      '2022-03-30 19:46:34'
                    ]),
                    DataLabels(dataCell: [
                      '#',
                      '	2022-03-30 (Wed)',
                      'N/A',
                      'Daily Update [ 2022-03-30 (Wed) ]',
                      '2022-03-31 09:16:52',
                      '2022-03-30 19:46:34'
                    ]),
                    DataLabels(dataCell: [
                      '#',
                      '	2022-03-30 (Wed)',
                      'N/A',
                      'Daily Update [ 2022-03-30 (Wed) ]',
                      '2022-03-31 09:16:52',
                      '2022-03-30 19:46:34'
                    ]),
                    DataLabels(dataCell: [
                      '#',
                      '	2022-03-30 (Wed)',
                      'N/A',
                      'Daily Update [ 2022-03-30 (Wed) ]',
                      '2022-03-31 09:16:52',
                      '2022-03-30 19:46:34'
                    ]),
                    DataLabels(dataCell: [
                      '#',
                      '	2022-03-30 (Wed)',
                      'N/A',
                      'Daily Update [ 2022-03-30 (Wed) ]',
                      '2022-03-31 09:16:52',
                      '2022-03-30 19:46:34'
                    ]),
                    DataLabels(dataCell: [
                      '#',
                      '	2022-03-30 (Wed)',
                      'N/A',
                      'Daily Update [ 2022-03-30 (Wed) ]',
                      '2022-03-31 09:16:52',
                      '2022-03-30 19:46:34'
                    ]),
                    DataLabels(dataCell: [
                      '#',
                      '	2022-03-30 (Wed)',
                      'N/A',
                      'Daily Update [ 2022-03-30 (Wed) ]',
                      '2022-03-31 09:16:52',
                      '2022-03-30 19:46:34'
                    ]),
                    DataLabels(dataCell: [
                      '#',
                      '	2022-03-30 (Wed)',
                      'N/A',
                      'Daily Update [ 2022-03-30 (Wed) ]',
                      '2022-03-31 09:16:52',
                      '2022-03-30 19:46:34'
                    ]),
                    DataLabels(dataCell: [
                      '#',
                      '	2022-03-30 (Wed)',
                      'N/A',
                      'Daily Update [ 2022-03-30 (Wed) ]',
                      '2022-03-31 09:16:52',
                      '2022-03-30 19:46:34'
                    ]),
                    DataLabels(dataCell: [
                      '#',
                      '	2022-03-30 (Wed)',
                      'N/A',
                      'Daily Update [ 2022-03-30 (Wed) ]',
                      '2022-03-31 09:16:52',
                      '2022-03-30 19:46:34'
                    ]),
                    DataLabels(dataCell: [
                      '#',
                      '	2022-03-30 (Wed)',
                      'N/A',
                      'Daily Update [ 2022-03-30 (Wed) ]',
                      '2022-03-31 09:16:52',
                      '2022-03-30 19:46:34'
                    ]),
                    DataLabels(dataCell: [
                      '#',
                      '	2022-03-30 (Wed)',
                      'N/A',
                      'Daily Update [ 2022-03-30 (Wed) ]',
                      '2022-03-31 09:16:52',
                      '2022-03-30 19:46:34'
                    ]),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
