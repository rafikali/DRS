import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_page/Constants/api_endpoints.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/utils/loading_dialog.dart';

import '../models/models.dart';
import '../utils/header.dart';

class ChangePassApi {
  Future<LoginResponse?> changePassword(String currentPassword, String password,
      String confirmPassword, context) async {
    http.Response? response = await http.post(
        Uri.parse(ApiEndpoints.devBaseUrl + ApiEndpoints.changePasword),
        headers: await getHeader(),
        body: jsonEncode({
          "current_password": currentPassword,
          "password": password,
          "password_confirmation": confirmPassword
        }));
    print(response.statusCode);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var bodyData = jsonDecode(response.body);
      LoginResponse? updatedPassword = LoginResponse.fromJson(bodyData);
      LoadingAlert().getAlertDialogBox(context, 'Changing Password');
      Future.delayed(const Duration(seconds: 2)).then((value) => {
            Navigator.pushReplacementNamed(context, HomePage.routeName),
          });

      print(updatedPassword);
      return updatedPassword;
    } else {
      return null;
    }
  }
}
