import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_page/Constants/api_endpoints.dart';

import '../models/models.dart';
import '../utils/header.dart';

class ChangePassApi {
  Future<LoginResponse?> fetchPassword(String currentPassword, String password,
      String confirmPassword, context) async {
    http.Response? response = await http.post(
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.changePasword),
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
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('Password changed successful')));
      print(updatedPassword);
      return updatedPassword;
    } else {
      return null;
    }
  }
}
