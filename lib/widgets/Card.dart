import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  Color? color;
  final String? title;
  final String? count;
  Color? backgroundColor;
  final dashboardIcon;
  Border? border;

  CardView(
      {Key? key,
      this.title,
      this.count,
      this.border,
      this.color,
      this.backgroundColor,
      this.dashboardIcon})
      : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: Theme.of(context).cardColor,
        // shadowColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            decoration: BoxDecoration(
              border: widget.border,
              color: Theme.of(context).cardColor,
            ),
            child: FittedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.dashboardIcon,
                    color: widget.color,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.title.toString(),
                    style: TextStyle(color: widget.color, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    widget.count!,
                    style: TextStyle(color: widget.color, fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
