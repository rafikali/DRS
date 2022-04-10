// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
//
// class DemoPage extends StatefulWidget {
//   static const String routeName = '/demo';
//
//   const DemoPage({Key? key}) : super(key: key);
//
//   @override
//   State<DemoPage> createState() => _DemoPageState();
// }
//
// class _DemoPageState extends State<DemoPage> {
//   int selectedIndex = 0;
//
//   List<Widget> bodyWidget = List.generate(
//     5,
//     (index) => ListView.builder(
//       itemBuilder: (context, index2) => Text("$index, $index2"),
//       itemCount: 80,
//     ),
//   );
//
//   List<Widget> newWidget = ["a", "b", "c", "d", "e"]
//       .map((e) => ListView.builder(
//             itemBuilder: (context, index2) => Text("$e, $index2"),
//             itemCount: 80,
//           ))
//       .toList();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Demos"),
//       ),
//       body: newWidget[selectedIndex],
//       bottomNavigationBar: CurvedNavigationBar(
//         // height: 60,
//         animationDuration: const Duration(milliseconds: 300),
//         backgroundColor: Colors.transparent,
//         color: const Color(0xFF6C63FF),
//         index: selectedIndex!,
//         onTap: (int index) {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//         items: const [
//           Icon(
//             Icons.arrow_right,
//             size: 30,
//           ),
//           Icon(
//             Icons.arrow_right,
//             size: 30,
//           ),
//           Icon(
//             Icons.arrow_right,
//             size: 30,
//           ),
//           Icon(
//             Icons.arrow_right,
//             size: 30,
//           ),
//           Icon(
//             Icons.arrow_right,
//             size: 30,
//           ),
//         ],
//         // items: const [
//         //   ImageIcon(AssetImage(ImageConstants.leaveTransactionLogo)),
//         //   ImageIcon(AssetImage(ImageConstants.dailyUpdateLogo)),
//         //   ImageIcon(AssetImage(ImageConstants.dashboardLogo)),
//         //   ImageIcon(AssetImage(ImageConstants.attendance)),
//         //   ImageIcon(AssetImage(ImageConstants.leaveTransactionLogo)),
//         // ],
//       ),
//     );
//   }
// }
