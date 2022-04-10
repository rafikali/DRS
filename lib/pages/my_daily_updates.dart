import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_page/models/models.dart';
import 'package:login_page/widgets/dropView.dart';
import 'package:login_page/widgets/login_textfield.dart';
import 'package:login_page/widgets/table.dart';

import '../services/daily_update_services.dart';

class MyDailyUpdates extends StatefulWidget {
  static const String routeName = '/myDailyUpdate';

  const MyDailyUpdates({Key? key}) : super(key: key);

  @override
  State<MyDailyUpdates> createState() => _MyDailyUpdatesState();
}

class _MyDailyUpdatesState extends State<MyDailyUpdates> {
  DateTime? selectedDate = DateTime.now();
  TextEditingController dateInput = TextEditingController();
  DailyUpdates? recentUpdates = DailyUpdates();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    fetchDailyUpdate();
    dateInput.text = '';
  }

  fetchDailyUpdate() async {
    final DailyUpdates? updates =
        await DailyUpdateServices().fetchDailyUpdate();
    if (updates != null) {
      setState(() {
        recentUpdates = updates;
        // print(recentUpdates);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Card(
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: LoginTextForm(
                      dataController: dateInput,
                      readonly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          initialDate: DateTime.now(),
                          lastDate:
                              DateTime(2030).add(const Duration(days: 365)),
                        );
                        print(pickedDate);
                        if (pickedDate != null && pickedDate != selectedDate) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            dateInput.text = formattedDate.toString();
                            selectedDate = pickedDate;
                          });
                        }
                      },
                      hintText: 'Date',
                      fillcolor: Colors.white,
                    ),
                  ),
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
                child: TableData(columns: [
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
                    recentUpdates?.data?[0].dailyupdateFor != null
                        ? recentUpdates!.data![0].dailyupdateFor
                        : 'updating...',
                    'N/A',
                    recentUpdates?.data?[0].description != null
                        ? recentUpdates!.data![0].description
                        : 'updating...',
                    recentUpdates?.data?[0].acknowledgeAt != null
                        ? recentUpdates!.data![0].acknowledgeAt
                        : 'updating...',
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
      )),
    );
  }
}
