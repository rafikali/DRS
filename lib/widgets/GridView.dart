import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  final double? childAspectRatio;
  final double? crossAxisSpacing;
  final int? crossAxisCount;
  final double? mainAxisSpacing;
  bool? primary;
  bool? shrinkWrap;
  List<Widget> children;
  Card? card;
  final ScrollPhysics? physics;

  Grid(
      {Key? key,
      required this.children,
      this.childAspectRatio,
      this.card,
      this.shrinkWrap,
      this.crossAxisSpacing,
      this.mainAxisSpacing,
      this.physics,
      this.crossAxisCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: physics ?? const NeverScrollableScrollPhysics(),
      primary: false,
      childAspectRatio: childAspectRatio ?? 1.8,
      crossAxisSpacing: crossAxisSpacing ?? 10,
      mainAxisSpacing: mainAxisSpacing ?? 10,
      crossAxisCount: crossAxisCount ?? 2,
      shrinkWrap: shrinkWrap ?? true,
      children: children,

      // card ??
      //     CardView(
      //       dashboardIcon: CupertinoIcons.clock,
      //       title: 'My Missing Checkout',
      //       color: const Color(0xFFff3333),
      //       count: '1',
      //     ),
      // card ??
      //     CardView(
      //       dashboardIcon: CupertinoIcons.creditcard,
      //       title: 'My Ghost Count',
      //       color: Colors.black,
      //       count: '0',
      //     ),
      // card ??
      //     CardView(
      //       dashboardIcon: CupertinoIcons.creditcard,
      //       title: 'My Leave Balance',
      //       color: Colors.black,
      //       count: '0',
      //     ),
      // card ??
      //     CardView(
      //       dashboardIcon: CupertinoIcons.tv,
      //       title: 'My NODailyUpdates',
      //       color: Colors.black,
      //       count: '0',
      //     ),
    );
  }
}
