import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyUpdate extends StatelessWidget {
  const DailyUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        // Expanded(
        //   child: ListTile(
        //     leading: Container(
        //       width: double.infinity,
        //       child: Row(
        //         children: [
        //           Expanded(
        //             child: LoginTextForm(hintText: 'Date',
        //             width: 100,
        //             height: 50,
        //             trailingIcon: CupertinoIcons.calendar,),
        //           ),
        //           Expanded(
        //             child: LoginTextForm(hintText: 'Filter By Project',
        //               width: 100,
        //               height: 50,
        //             trailingIcon: CupertinoIcons.chevron_down,),
        //           ),
        //
        //
        //         ],
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
