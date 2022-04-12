import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_page/Constants/api_endpoints.dart';
import 'package:login_page/utils/header.dart';

import '../models/models.dart';

class DailyUpdateServices {
  Future<DailyUpdatesModel?> fetchDailyUpdate() async {
    final response = await http.get(
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.dailyUpdate),
        headers: await getHeader());

    if (response.statusCode == 200) {
      var receiveData = jsonDecode(response.body);
      DailyUpdatesModel? updates = DailyUpdatesModel.fromJson(receiveData);
      return updates;
    } else {
      return null;
    }
  }
}
