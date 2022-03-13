import 'package:login_page/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputValidator{
  static String? validateName(String? val){
    if (val!.isEmpty){
      return '*Username required';
    }else if (val.isNotEmpty && val.length < 10){
      return "Username must be more than 10 character";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val){
    if (val!.isEmpty ){
      return '*Password required';
    }else if (val.isNotEmpty && val.length <6){
      return "Password must be more than 6 characters";
    } else {
      return null;
    }
  }

}





