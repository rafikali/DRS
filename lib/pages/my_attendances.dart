import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_page/models/models.dart';
import 'package:login_page/widgets/login_textfield.dart';
import 'package:login_page/widgets/table.dart';

import '../widgets/dropView.dart';

class MyAttendances extends StatefulWidget {
  static const String routeName = '/myattendances';
  const MyAttendances({Key? key}) : super(key: key);

  @override
  State<MyAttendances> createState() => _MyAttendancesState();
}

class _MyAttendancesState extends State<MyAttendances> {
  DateTime? selectedDate = DateTime.now();
  TextEditingController dateInput = TextEditingController();

  DailyUpdatesModel? recentUpdates = DailyUpdatesModel();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    dateInput.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(
          'My Attendances',
          style: Theme.of(context).textTheme.headline3,
        ),
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
                    lastDate: DateTime.now(),
                  );
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
      ]),
    );
  }
}
