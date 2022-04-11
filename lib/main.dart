import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/Constants/theme.dart';
import 'package:login_page/Route/route_handler.dart';
import 'package:login_page/onboardingpages/onboarding_page.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get getThemeMode => _themeMode;
  void setTheme(themeMode) {
    _themeMode = themeMode;
    print(themeMode);
    notifyListeners();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? accessToken = prefs.getString(AppConstants.accessToken);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp(
    accessToken: accessToken,

    // userCredentials: password,
  ));
}

class MyApp extends StatefulWidget {
  final String? accessToken;
  bool? changeMode = true;
  final String? userCredentials;
  final Color? systemNavigationColor;

  MyApp(
      {Key? key,
      this.changeMode,
      this.systemNavigationColor,
      this.accessToken,
      this.userCredentials})
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences? _preferences;
  @override
  void initState() {
    super.initState();
  }

  setUpPreference() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      builder: (context, ha) {
        final themeChanger = Provider.of<ThemeChanger>(context);

        print(themeChanger.getThemeMode.name);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeChanger.getThemeMode,
          darkTheme: setDarkTheme,
          // theme: Provider.of<DarkThemeNotifier>(context).isDarkMode
          //     ? setDarkTheme
          //     : setLightTheme,
          // primaryColor: Colors.black,

          //   textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
          // primaryColor: const Color(0xFF343434),
          //   scaffoldBackgroundColor: const Color(0xFFF3F3F3),
          //   appBarTheme: const AppBarTheme(
          //       titleTextStyle: TextStyle(
          //         color: Colors.black,
          //       ),
          //       iconTheme: IconThemeData(color: Colors.black),
          //       actionsIconTheme: IconThemeData(color: Colors.white)),
          // darkTheme: setDarkTheme,

          title: "drs",
          initialRoute: widget.accessToken != null
              ? HomePage.routeName
              : OnBoardPage.routeName,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
      // child:
    );
  }
}
