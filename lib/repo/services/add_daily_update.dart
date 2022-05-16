import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:login_page/utils/header.dart';
import 'package:login_page/utils/loading_dialog.dart';

import '../../app/Constants/api_endpoints.dart';
import '../../screens/home_page.dart';
import '../models/update_message.dart';

class AddDrs {
  Future<Message?> postUpdate(
      String dailyupdatefor, String title, String description, context) async {
    Response? response = await http.post(
        Uri.parse(ApiEndpoints.devBaseUrl + ApiEndpoints.addUpdate),
        headers: await getHeader(),
        body: jsonEncode({
          "dailyupdate_for": dailyupdatefor,
          "title": title,
          "description": description
        }));

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      print(response);
      var receiveData = jsonDecode(response.body);
      Message? message = Message.fromJson(receiveData);
      LoadingAlert().getAlertDialogBox(context, 'Updating Drs');
    
      Future.delayed(const Duration(milliseconds: 2000)).then(
        (value) => Navigator.pushReplacementNamed(context, HomePage.routeName),
      );
     

      return message;
    } else {
      return null;
    }
  }
}
