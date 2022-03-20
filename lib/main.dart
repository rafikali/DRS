import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
        // primaryColor: Colors.black,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme
        ),
        primaryColor: const Color(0xFF343434),

        scaffoldBackgroundColor: Color(0xFFF3F3F3),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,

          ),
          iconTheme: IconThemeData(
            color: Colors.black
          )

        )

      ),
      title: "drs",
      initialRoute: accessToken != null ? HomePage.routeName:  LoginPage.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,

    );
  }
}
