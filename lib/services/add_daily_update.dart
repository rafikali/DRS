import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:login_page/Constants/api_endpoints.dart';
import 'package:login_page/models/update_message.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/utils/confirmation_dialog.dart';
import 'package:login_page/utils/header.dart';

class AddDailyUpdate {
  Future<Message?> fetchAddUpdate(
      String dailyupdatefor, String title, String description, context) async {
    Response? response = await http.post(
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.addUpdate),
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
      getDialog(context,
              title: const Text('Uploading daily update'),
              content: const CircularProgressIndicator())
          .then((value) async {
        await Navigator.pushReplacementNamed(context, HomePage.routeName);
      });
      return message;
    } else {
      return null;
    }
  }
}
