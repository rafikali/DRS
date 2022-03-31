import 'package:flutter/material.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/Route/route_handler.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/pages/login_page.dart';
import 'package:login_page/utils/pref_services.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs= await SharedPreferences.getInstance();
  NepaliUtils(Language.nepali);
  String? accessToken = prefs.getString(AppConstants.accessToken);
// SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
  //   // statusBarColor: Color(0xFFF3F3F3),
  //   // statusBarBrightness: Brightness.light,
  //   // statusBarIconBrightness: Brightness.light,
  //
  // ));
  runApp(MyApp(accessToken: accessToken));
}
class MyApp extends StatefulWidget {
 final String? accessToken;
 bool? changeMode = true;
 ThemeData? theme;


   MyApp({Key? key, this.theme, this.changeMode,  this.accessToken}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  {
  bool? changeMode = false;
  var changingValue =  PrefsServices().getBool('modeValue');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.light(),
      // darkTheme: changingValue == true ? ThemeData.light(): ThemeData.dark(


      debugShowCheckedModeBanner: false,

      // theme: ThemeData.light().copyWith(
      //     // primaryColor: Colors.black,
      //
      //     textTheme: GoogleFonts.latoTextTheme(
      //       Theme.of(context).textTheme
      //     ),
      //     primaryColor: const Color(0xFF343434),
      //     scaffoldBackgroundColor: const Color(0xFFF3F3F3),
      //     appBarTheme: const AppBarTheme(
      //       titleTextStyle: TextStyle(
      //         color: Colors.black,
      //
      //       ),
      //       iconTheme: IconThemeData(
      //         color: Colors.black
      //       ),
      //       actionsIconTheme: IconThemeData(
      //         color: Colors.white
      //       )
      //
      //     ),
      //
      // ),
      // theme: ThemeData(

      // ),
      title: "drs",
      initialRoute: widget.accessToken != null ? HomePage.routeName:  LoginPage.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,

    );
  }
}
