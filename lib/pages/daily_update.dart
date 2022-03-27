import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/widgets/dropView.dart';
import 'package:login_page/widgets/table.dart';

import '../widgets/alertbox..dart';
import '../widgets/login_textfield.dart';

class DailyUpdate extends StatelessWidget {
  const DailyUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Column(
        children:  [
          SizedBox(
            width: double.infinity,
            child: Card(
              child: Row(
                children: [
                  Flexible(
                    child: LoginTextForm(hintText: 'Date',
                    width: 100,
                    fillcolor: Colors.white,
                    height: 50,
                      trailingIcon: Icon(CupertinoIcons.calendar),
                  ),
                  ),
                  Expanded(
                    child: DropView(
                      dropdownheight: 200.0,
                      date: 'Filter By Project',
                    dropdownItems: const ['Sociar',
                      'Nagrik App',
                      'Online acc',
                      'CPN UML',
                      'NOC',
                      'Aayojak'],

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
       Expanded(
        child: Card(
          child: TableData(
            updateDate: '2022-03-21',
            addIcon: CupertinoIcons.add_circled_solid,
            todayWork: 'Homepage worked , login page worked',
            addAtendence:  Container(
              width: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                      'Title'
                  ),
                  InkWell(
                      onTap: () {
                        DialogBox(
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.height * 0.8,
                            padding: EdgeInsets.all(14)
                        ).getAlertDialogBox(context);
                      },
                      child: Icon(CupertinoIcons.add_circled_solid, color: Colors.green,)),
                ],
              ),
            ),



          ),
        ),

      ),


        ],
      ),
    );
  }
}
