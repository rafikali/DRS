class InputValidator{
  static String? validateName(String? val){
    if (val != null && val.length >3){
      return null;
    }else{
      return "Username must be entered";
    }
  }

  static String? validatePassword(String? val){
    if (val != null && val.length > 3 ){
      return null;
    }else {
      return "Password must be entered";
    }
  }

}
