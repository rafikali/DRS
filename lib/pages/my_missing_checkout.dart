import 'package:flutter/material.dart';
import 'package:login_page/widgets/login_textfield.dart';
import 'package:login_page/widgets/table.dart';

class MyMissingCheckout extends StatelessWidget {
  static const String routeName = '/manumissions';

  const MyMissingCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(children: [
              Text('My Missing Checkout'),
              LoginTextForm(hintText: 'Date')
            ]),
            TableData(
              columns: [
                DataLabels(label: Text('hi')),
                DataLabels(label: Text('hi')),
              ],
              rows: [
                DataLabels(dataCell: ['sdlfkd', 'sdfk'])
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
