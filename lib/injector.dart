import 'package:get_it/get_it.dart';
import 'package:login_page/core/network/base_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

setupLocator() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  locator.registerFactory(() => GtBaseClient());
  locator.registerFactory((() => )

  // locator.registerSingleton(instance)
}
