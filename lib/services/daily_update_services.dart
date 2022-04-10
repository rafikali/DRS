import 'dart:convert';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:login_page/Constants/api_endpoints.dart';
import 'package:login_page/utils/header.dart';

import '../models/models.dart';

class DailyUpdateServices {
  Future<DailyUpdates?> fetchDailyUpdate() async {
    final response = await http.get(
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.dailyUpdate),
        headers: await getHeader());

    var receiveData = jsonDecode(response.body);
    print(receiveData);
    var document = parse(response.body);
    print(document.head);

    if (response.statusCode == 200) {
      DailyUpdates? updates = DailyUpdates.fromJson(receiveData);
      return updates;
    } else {
      return null;
    }
  }
}
