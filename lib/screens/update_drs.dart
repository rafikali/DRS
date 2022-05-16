import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_page/widgets/date_picker.dart';
import '../repo/models/update_message.dart';
import '../repo/services/add_daily_update.dart';
import '../utils/input_validators.dart';
import '../widgets/my_textfield.dart';

class UpdateDrs extends StatefulWidget {
  static const String routeName = '/adddailyupdate';
  const UpdateDrs({Key? key}) : super(key: key);

  @override
  State<UpdateDrs> createState() => UpdateDrsState();
}

class UpdateDrsState extends State<UpdateDrs> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  // final HtmlEditorController _htmlEditorController = HtmlEditorController();

  Message msg = Message();

  @override
  void initState() {
    super.initState();
    fillTextController(DateTime.now());
    // fetchAddUpdate();
  }

  validationCheck() async {
    if (_formKey.currentState!.validate()) {
      postUpdate();
    } else {
      return "required*";
    }
  }

  postUpdate() async {
    await AddDrs()
        .postUpdate(_dateController.text, _titleController.text,
            _dataController.text, context)
        .then((value) {
      if (value != null) {
        setState(() {
          msg = value;
        });
      }
    });
  }

  fillTextController(DateTime dateTime) async {
    // final String? todayDate =
    //     // await PrefsServices().getString(AppConstants.todayDate);
    final DateTime? todayDate = dateTime;
    String updateToday = DateFormat('yyyy-MM-dd').format(todayDate!);
    String day = DateFormat('EEE', 'en_US').format(todayDate);
    String? title = 'Daily Update [ $updateToday ($day)]';
    _dateController.text = updateToday;
    _titleController.text = title;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        // backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 130),
            child: Card(
              // color: Theme.of(context).dialogBackgroundColor,
              elevation: 10,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50))),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.6,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text('Add Daily Update',
                          style: Theme.of(context).textTheme.headline6),
                      const Divider(
                        color: Colors.black,
                      ),

                      LoginTextForm(
                        readonly: true,
                        hintText: '2022-03-26',
                        labelText: 'Update for*',
                        dataController: _dateController,
                        onTap: () async {
                          String? date = await datePicker(
                            context,
                          );
                          setState(() {
                            _dateController.text = date;
                            fillTextController(DateTime.parse(date));
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
                      Text(
                        'Mention your Productivity (Work done) of the Day*',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(height: 18),
                      // Expanded(
                      //   child: HtmlEditor(
                      //     controller: _htmlEditorController,
                      //     htmlEditorOptions: const HtmlEditorOptions(
                      //       hint: "Your text here...",

                      //       //initalText: "text content initial, if any",
                      //     ),
                      //     otherOptions: const OtherOptions(
                      //       height: 100,
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: LoginTextForm(
                          maxLine: 6,
                          hintText: 'Enter something',
                          fillcolor: Colors.white,
                          dataController: _dataController,
                          validator: InputValidator.validateDate,
                          outlineBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.red,
                            ),
                          ),

                          // contentPadding: const EdgeInsets.symmetric(
                          //     horizontal: 5, vertical: 80),
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            onPressed: () {
                              validationCheck();
                            },
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
    );
  }
}
