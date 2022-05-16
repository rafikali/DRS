import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/app/theme/light_theme.dart';
import 'package:login_page/injector.dart';
import 'package:login_page/onboardingpages/onboarding_page.dart';
import 'package:login_page/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/Constants/app_constants.dart';
import 'app/helpers/route_handler.dart';
import 'app/theme/dark_theme.dart';
import 'app/theme/theme_changer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
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
  @override
  void initState() {
    super.initState();
    // Provider.of<ThemeChanger>(context, listen: false).getTheme();
  }

  bool val = true;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ChangeNotifierProvider<DarkThemeNotifier>(
          //   create: (_) => DarkThemeNotifier(),
          // ),
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
