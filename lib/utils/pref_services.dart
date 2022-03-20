import 'package:shared_preferences/shared_preferences.dart';

class PrefsServices{
  setString(String key, String value) async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(key, value);
  }

  Future<String> getString(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
     var sharedkey = _prefs.getString(key);
     return sharedkey ?? "";
  }


}

