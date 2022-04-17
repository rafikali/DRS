import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/Route/route_handler.dart';
import 'package:login_page/onboardingpages/onboarding_page.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/theme/dark_theme.dart';
import 'package:login_page/theme/light_theme.dart';
import 'package:login_page/widgets/darkThemeNotifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get getThemeMode => _themeMode;
  void setTheme(ThemeMode theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (theme == ThemeMode.dark) {
      prefs.setBool(AppConstants.storedtheme, true);
    } else {
      prefs.setBool(AppConstants.storedtheme, false);
    }
    _themeMode = theme;
    notifyListeners();
  }

  ThemeChanger() {
    getTheme();
  }

  getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(AppConstants.storedtheme) ?? false) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
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

class AppSettings {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
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
    // Provider.of<ThemeChanger>(context, listen: false).getTheme();
  }

  setUpPreference() async {
    _preferences = await SharedPreferences.getInstance();
  }

  bool val = true;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<DarkThemeNotifier>(
            create: (_) => DarkThemeNotifier(),
          ),
          ChangeNotifierProvider<ThemeChanger>(
            create: (_) => ThemeChanger(),
          ),
        ],
        child: Consumer<ThemeChanger>(
          builder: (context, value, child) {
            return MaterialApp(
              navigatorKey: AppSettings.navigatorKey,
              debugShowCheckedModeBanner: false,
              // themeMode: themeChanger.getThemeMode,
              // darkTheme: setDarkTheme,
              theme: value.getThemeMode != ThemeMode.light
                  ? darkTheme
                  : setLightTheme,

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
        )
        // child:
        );
  }
}
