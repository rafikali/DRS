import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:login_page/utils/header.dart';

import '../../app/Constants/api_endpoints.dart';
import '../models/daily_update.dart';

class DailyUpdateServices {
  Future<DailyUpdatesModel?> fetchDailyUpdate() async {
    var headers = await getHeader();
    final response = await http.get(
        Uri.parse(ApiEndpoints.devBaseUrl + ApiEndpoints.dailyUpdate),
        headers: headers);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var receiveData = jsonDecode(response.body);
      DailyUpdatesModel? updates = DailyUpdatesModel.fromJson(receiveData);
      return updates;
    } else {
      return null;
    }

  }
}
