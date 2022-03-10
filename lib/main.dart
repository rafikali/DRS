import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/Route/routehandler.dart';
import 'package:login_page/pages/login_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      title: "drs",
      initialRoute: LoginPage.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
