
import 'package:shared_preferences/shared_preferences.dart';

class PrefsServices{
  setString(String key, String value) async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
     var sharedkey = _prefs.getString(key);
     return sharedkey;
  }

   setBool( key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);

  }
  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? changedKey = prefs.getBool(key);
    return changedKey ?? false;
  }


}

