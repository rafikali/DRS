import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_page/Constants/api_endpoints.dart';
import 'package:login_page/models/models.dart';
import 'package:login_page/utils/header.dart';

class ScheduleServices {
  Future<Schedule?> fetchSchedule() async {
    var header = await getHeader();
    try {
      http.Response? response = await http.get(
          Uri.parse(ApiEndpoints.devBaseUrl + ApiEndpoints.schedule),
          headers: header);
      if (response.statusCode == 200) {
        var bodyData = jsonDecode(response.body);
        Schedule sch = Schedule.fromJson(bodyData);
        return sch;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
