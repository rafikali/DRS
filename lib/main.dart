import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/Route/routehandler.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs= await SharedPreferences.getInstance();
  String? accessToken = prefs.getString(AppConstants.accessToken);
// SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
  //   // statusBarColor: Color(0xFFF3F3F3),
  //   // statusBarBrightness: Brightness.light,
  //   // statusBarIconBrightness: Brightness.light,
  //
  // ));
  runApp(MyApp(accessToken: accessToken,));
}

class MyApp extends StatelessWidget {
 final String? accessToken;

  const MyApp({Key? key, this.accessToken}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,

      ),

      title: "drs",
      initialRoute: accessToken != null ? HomePage.routeName:  LoginPage.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,

    );
  }
}
