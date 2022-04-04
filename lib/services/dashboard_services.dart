import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_page/Constants/api_endpoints.dart';
import 'package:login_page/models/carddata.dart';
import 'package:login_page/utils/header.dart';

class DashBoardServices {
  Future<CardData?> fetchCardData() async {
    final response = await http.get(
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.cardData),
        headers: await getHeader());

    var bodyData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      CardData cardData = CardData.fromJson(bodyData);
      return cardData;
    } else {
      return null;
    }
  }
}
