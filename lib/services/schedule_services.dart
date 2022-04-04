import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_page/Constants/api_endpoints.dart';
import 'package:login_page/models/models.dart';
import 'package:login_page/utils/header.dart';

class ScheduleServices {
  Future<Schedule?> fetchSchedule() async {
    final response = await http.get(
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.checkTime),
        headers: await getHeader());
    var bodyData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Schedule sch = Schedule.fromJson(bodyData);
      return sch;
    } else {
      return null;
    }
  }
}
