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
              const Text('My Missing Checkout'),
            ]),
            TableData(
              columns: [
                // DataLabels(label: 'hi'),
                DataLabels(label: const Text('hi')),
                DataLabels(label: const Text('hi')),
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
