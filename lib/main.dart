import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/Route/routehandler.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.deepPurpleAccent,
    systemNavigationBarIconBrightness: Brightness.light
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
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}


