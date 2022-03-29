import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/widgets/dropView.dart';
import 'package:login_page/widgets/table.dart';

import '../widgets/alertbox..dart';
import '../widgets/login_textfield.dart';

class DailyUpdate extends StatefulWidget {
  const DailyUpdate({Key? key}) : super(key: key);

  @override
  State<DailyUpdate> createState() => _DailyUpdateState();
}

class _DailyUpdateState extends State<DailyUpdate> {
  DateTime? pickedDate;
  TextEditingController datePicker = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              child: Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      // onTap: () async {
                      //   var time = await showDatePicker(
                      //       context: context,
                      //       initialDate: DateTime.now(),
                      //       firstDate: DateTime(1990),
                      //       lastDate: DateTime(2022));
                      //   // var time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                      //   if (time != null) {
                      //     datePicker.text = time.toString();
                      //   }
                      // },
                      // child: Text("data"),

                      child: LoginTextForm(
                        readonly: true,
                        onTap: () async {
                          // // var time = await showDatePicker(
                          // //     context: context,
                          // //     initialDate: DateTime.now(),
                          // //     firstDate: DateTime(1990),
                          // //     lastDate: DateTime(2022));
                          // var time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                          // if (time != null) {
                          //   datePicker.text = time.format(context);
                          // }
                          showDialog(
                              context: context,
                              builder: (context) {
                                return DatePickerDialog(
                                  firstDate: DateTime.now(),
                                  initialDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 365)),
                                );
                              });
                        },
                        dataController: datePicker,
                        hintText: 'Date',
                        width: 100,
                        fillcolor: Colors.white,
                        height: 50,
                        trailingIcon: const Icon(CupertinoIcons.calendar),
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
                  DataLabels(label: Text('Update')),
                  DataLabels(label: Text("Project")),
                  DataLabels(
                    label: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Title'),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {
                                DialogBox(
                                        barrierDismissile: false,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.6,
                                        padding: EdgeInsets.all(14))
                                    .getAlertDialogBox(context);
                              },
                              child: Icon(
                                CupertinoIcons.add_circled_solid,
                                color: Colors.green,
                              )),
                        ],
                      ),
                    ),
                  )
                ],

                rows: [
                  DataLabels(dataCell: [
                    '2022-03-30[Tuesday]',
                    'N/A',
                    'Homepage worked, loginpage '
                  ]),
                  DataLabels(dataCell: [
                    '2022-03-30[Tuesday]',
                    'N/A',
                    'Homepage worked, loginpage '
                  ]),
                  DataLabels(dataCell: [
                    '2022-03-30[Tuesday]',
                    'N/A',
                    'Homepage worked, loginpage '
                  ]),
                ],

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
                //                 padding: EdgeInsets.all(14)
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
    );
  }
}
