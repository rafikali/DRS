import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/Route/route_handler.dart';
import 'package:login_page/onboardingpages/onboarding_page.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/utils/pref_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? accessToken = prefs.getString(AppConstants.accessToken);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // systemNavigationBarColor: Color(0xFF6C63FF),
      // statusBarBrightness: Brightness.light,
      // statusBarIconBrightness: Brightness.light,
      ));
  runApp(MyApp(accessToken: accessToken));
}

class MyApp extends StatefulWidget {
  final String? accessToken;
  bool? changeMode = true;

  MyApp({Key? key, this.changeMode, this.accessToken}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  bool changeMode = true;
  var changingValue = PrefsServices().getBool('modeValue');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        // primaryColor: Colors.black,

        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        primaryColor: const Color(0xFF343434),
        scaffoldBackgroundColor: const Color(0xFFF3F3F3),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.black,
            ),
            iconTheme: IconThemeData(color: Colors.black),
            actionsIconTheme: IconThemeData(color: Colors.white)),
      ),
      title: "drs",
      initialRoute: widget.accessToken != null
          ? OnBoardPage.routeName
          : HomePage.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
