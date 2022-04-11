import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:login_page/Constants/api_endpoints.dart';
import 'package:login_page/utils/header.dart';

import '../models/models.dart';

class DailyUpdateServices {
  Future<DailyUpdatesModel?> fetchDailyUpdate() async {
    final response = await http.get(
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.dailyUpdate),
        headers: await getHeader());

    var receiveData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(receiveData);
      var document = parse(response.body);
      print(document.getElementsByTagName('div'));
      DailyUpdatesModel? updates = DailyUpdatesModel.fromJson(receiveData);
      return updates;
    } else {
      return null;
    }
  }
}
