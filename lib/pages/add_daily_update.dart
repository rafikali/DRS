import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/utils/pref_services.dart';
import 'package:login_page/widgets/date_picker.dart';

import '../services/daily_update_services.dart';
import '../utils/input_validators.dart';
import '../widgets/login_textfield.dart';

class AddDailyUpdae extends StatefulWidget {
  static const String routeName = '/adddailyupdate';
  const AddDailyUpdae({Key? key}) : super(key: key);

  @override
  State<AddDailyUpdae> createState() => AddDailyUpdaeState();
}

class AddDailyUpdaeState extends State<AddDailyUpdae> {
  final selectedDate = DateTime.now();
  final pickedDate = DateTime.now();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final todayDate = DateTime(DateTime.now().day);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fillTextController();
  }

  fillTextController() async {
    // final String? todayDate =
    //     // await PrefsServices().getString(AppConstants.todayDate);
    final DateTime? todayDate = DateTime.now();
    String updateToday = DateFormat('yyyy-MM-dd').format(todayDate!);
    String formatTitle = DateFormat('yyyy-MM-dd').format(todayDate);
    String day = todayDate.day.toString();
    String? title = 'Daily Update [ $formatTitle ($day)]';

    _dateController.text = updateToday;
    _titleController.text = title;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 130),
            child: Center(
              child: Card(
                elevation: 10,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50))),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Form(
                    child: Column(
                      children: [
                        const Text(
                          'Add Daily Update',
                          style: TextStyle(fontSize: 25),
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        LoginTextForm(
                          readonly: true,
                          hintText: '2022-03-26',
                          labelText: 'Update for',
                          dataController: _dateController,
                          onTap: () async {
                            String date = await datePicker(
                              context,
                            );
                            setState(() {
                              _dateController.text = date;
                            });

                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return DatePickerDialog(
                            //         firstDate: DateTime(2000),
                            //         initialDate: DateTime.now(),
                            //         lastDate: DateTime(2030)
                            //             .add(const Duration(days: 365)),
                            //       );
                            //     });
                          },
                          validator: InputValidator.validateDate,
                          trailingIcon: const Icon(
                            CupertinoIcons.calendar,
                          ),
                          fillcolor: Colors.white,
                        ),
                        const SizedBox(height: 5),
                        LoginTextForm(
                          dataController: _titleController,
                          hintText: '',
                          labelText: 'Title*',
                          fillcolor: Colors.white,
                          validator: InputValidator.validateDate,
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'Mention your Productivity (Work done) of the Day *',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 18),
                        LoginTextForm(
                          maxLine: 6,
                          hintText: 'Enter something',
                          fillcolor: Colors.white,
                          outlineBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.red,
                            ),
                          ),

                          // contentPadding: const EdgeInsets.symmetric(
                          //     horizontal: 5, vertical: 80),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: const Text('Submit'),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
