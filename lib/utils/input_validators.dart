import 'package:flutter/material.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputValidator{
   final String namedValidate;
   void moveToHome(BuildContext context) {
     if(namedValidate == 'rafik') {
       Navigator.pushNamed(context, HomePage.routeName);
     }
   }
   static final formKey = GlobalKey<FormState>();

  InputValidator(this.namedValidate);

  static String? validateUsername(String? val){
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
  static String? validateFullname(String? val){
    if (val!.isEmpty ){
      return '*Name required';
    }else if (val.isNotEmpty && val.length <6){
      return null;
    } else {
      return null;
    }
  }static String? validateMobile(String? val){
    if (val!.isEmpty ){
      return '*Number required';
    }else if (val.isNotEmpty && val.length != 10){
      return "Invalid Mobile Number";
    } else {
      return null;
    }
  }
   static String? validateEmail(String? val){
     if (val!.isEmpty ){
       return '*Email required';
     }else if (val.isNotEmpty && val.length <6){
       return "Invalid Email";
     } else {
       return null;
     }
   }
   static String? validateAddress(String? val){
     if (val!.isEmpty ){
       return '*Address required';
     } else {
       return null;
     }
   }
   static String? validateDate(String? val){
     if (val!.isEmpty ){
       return '*required';
     } else {
       return null;
     }
   }




}


// class FormKey {
//   final formKey = GlobalKey<FormState>();
//   final lock = GlobalKey<FormState>();
//   final key = GlobalKey<FormState>();
//
//
//
//
//
// }




