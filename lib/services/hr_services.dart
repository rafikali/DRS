//
// class HRServices {
//   Future<DailyUpdates?> fetchDailyUpdate() async {
//     final response = await http.get(
//         Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.dailyUpdate),
//         headers: await getHeader());
//
//     var receiveData = jsonDecode(response.body);
//     // var document = parse(response.body);
//
//     if (response.statusCode == 200) {
//       DailyUpdates? updates = DailyUpdates.fromJson(receiveData);
//       return updates;
//     } else {
//       return null;
//     }
//   }
// }
