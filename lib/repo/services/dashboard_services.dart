import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:login_page/utils/header.dart';

import '../../app/constants/api_endpoints.dart';
import '../models/carddata.dart';

class DashBoardServices {
  Future<CardData?> fetchCardData() async {
    print("Inside haha");
    final response = await http.get(
        Uri.parse(ApiEndpoints.devBaseUrl + ApiEndpoints.cardData),
        headers: await getHeader());
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var bodyData = jsonDecode(response.body);
      CardData cardData = CardData.fromJson(bodyData);
      return cardData;
    } else {
      return null;
    }
  
  }
}
