import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/repository/services/daily_update_services.dart';
import 'package:login_page/utils/daily_update_alertbox.dart';
import 'package:login_page/utils/pref_services.dart';
import 'package:login_page/widgets/date_picker.dart';
import 'package:login_page/widgets/dropView.dart';
import 'package:login_page/widgets/table.dart';

import '../repository/models/daily_update.dart';
import '../widgets/alertbox..dart';
import '../widgets/login_textfield.dart';

class DailyUpdate extends StatefulWidget {
  const DailyUpdate({Key? key}) : super(key: key);

  @override
  State<DailyUpdate> createState() => _DailyUpdateState();
}

class _DailyUpdateState extends State<DailyUpdate> {
  DateTime selectedDate = DateTime.now();
  final DateTime? pickedDate = DateTime(2000);
  final TextEditingController _dateController = TextEditingController();
  DailyUpdatesModel? recentUpdates;

  @override
  void initState() {
    super.initState();
    fetchDailyUpdate();
  }

  fetchDailyUpdate() async {
    DailyUpdateServices().fetchDailyUpdate().then((value) {
      if (value != null && mounted) {
        setState(() {
          recentUpdates = value;
          String? title = recentUpdates?.data![0].title.toString();
          PrefsServices().setString(AppConstants.title, title.toString());
        });
      }
    });
    // if (updates != null) {
    //   if (mounted) {}
    // }
  }

  @override
  Widget build(BuildContext context) {
    return recentUpdates == null
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(6),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      child: Row(
                        children: [
                          Flexible(
                            child: GestureDetector(
                              child: LoginTextForm(
                                fillcolor: Theme.of(context).cardColor,
                                onTap: () async {
                                  String? pickedDate =
                                      await datePicker(context);
                                  setState(() {
                                    _dateController.text = pickedDate;
                                  });
                                },
                                dataController: _dateController,
                                hintText: 'Date',
                                readonly: true,
                                width: 100,
                                height: 50,
                                trailingIcon:
                                    const Icon(CupertinoIcons.calendar),
                              ),
                            ),
                          ),
                          Expanded(
                            child: DropView(
                              dropdownheight: 200.0,
                              date: 'Filter By Project',
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
                              width: double.infinity,
                              height: 50.0,
                            ),
                          ),
                          // DropView(
                          //   height: 50.0,
                          //   dropdownItems: ['hello','hi'],
                          //   date: 'jk',
                          //   labelText: 'hi',
                          //   width: 60.0,
                          //   hintText: 'Filter by project',
                          // )
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Card(
                      child: TableData(
                        columns: [
                          DataLabels(label: const Text('Update')),
                          DataLabels(label: const Text("Project")),
                          DataLabels(
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Title'),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      DialogBox(
                                        dialogBoxPadding:
                                            const EdgeInsets.all(15),
                                        barrierDismissile: false,
                                        content: DailyUpdateAlertBox(
                                          padding: const EdgeInsets.all(10),
                                        ),
                                      ).getAlertDialogBox(context);
                                    },
                                    child: const Icon(
                                      CupertinoIcons.add_circled_solid,
                                      color: Colors.green,
                                    )),
                              ],
                            ),
                          )
                        ],

                        rows: recentUpdates!.data!
                            .map<DataLabels>(
                              (e) => DataLabels(dataCell: [
                                e.dailyupdateFor.toString(),
                                e.project ?? "N/A",
                                e.title.toString(),
                              ]),
                            )
                            .toList(),

                        // rows: [
                        //   DataLabels(dataCell: [
                        //     '${recentUpdates?.data![0].dailyupdateFor}',
                        //     'N/A',
                        //     'Homepage worked, loginpage '
                        //   ]),
                        //   DataLabels(dataCell: [
                        //     '2022-03-30[Tuesday]',
                        //     'N/A',
                        //     'Homepage worked, loginpage '
                        //   ]),
                        //   DataLabels(dataCell: [
                        //     '2022-03-30[Tuesday]',
                        //     'N/A',
                        //     'Homepage worked, loginpage '
                        //   ]),
                        // ],

                        // addAtendence:  Container(
                        //   width: 90,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     mainAxisSize: MainAxisSize.max,
                        //     children: [
                        //       Text(
                        //           'Title'
                        //       ),
                        //       InkWell(
                        //           onTap: () {
                        //             DialogBox(
                        //                 width: MediaQuery.of(context).size.width * 1,
                        //                 height: MediaQuery.of(context).size.height * 0.8,
                        //                 padding: EdgeInset s.all(14)
                        //             ).getAlertDialogBox(context);
                        //           },
                        //           child: Icon(CupertinoIcons.add_circled_solid, color: Colors.green,)),
                        //     ],
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
