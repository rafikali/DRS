import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/Route/routehandler.dart';
import 'package:login_page/pages/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      title: "drs",
      initialRoute: HomePage.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
