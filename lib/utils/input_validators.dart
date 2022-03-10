import 'package:shared_preferences/shared_preferences.dart';

class InputValidator{
  static String? validateName(String? val){
    if (val!.isEmpty){
      return '*Username required';
    }else if (val.isNotEmpty && val.length < 6){
      return "Username must contain more than 6 character";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val){
    if (val!.isEmpty ){
      return '*Password required';
    }else if (val.isNotEmpty && val.length <6){
      return "Password must contain more than 6 characters";
    } else {
      return null;
    }
  }

}





