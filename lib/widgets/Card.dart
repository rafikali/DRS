import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CardView extends StatelessWidget {
  Color? color;
  final String title;
  final String? count;
  Color? backgroundColor;
  final dashboardIcon;
  Border? border;

   CardView({Key? key, required this.title, this.count,this.border, this.color, this.backgroundColor, this.dashboardIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Container(
            decoration: BoxDecoration(
              border: border,
            ),
            child: Column(
              children:  [
                Icon(dashboardIcon, color: color,),
                SizedBox(height: 4,),
                Text(title,
                  style:  TextStyle(
                    color: color,
                    fontSize: 15
                ), ),
                const SizedBox(height: 2,),
                Text(count!,
                  style:  TextStyle(
                    color: color,
                    fontSize: 19
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
