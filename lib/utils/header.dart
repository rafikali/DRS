import 'package:login_page/utils/pref_services.dart';

import '../Constants/app_constants.dart';

Future<Map<String, String>> getHeader() async {
  String? token = await PrefsServices().getString(AppConstants.accessToken);

  Map<String, String> data = {};
  data["Accept"] = "application/json";
  data["Content-Type"] = "application/json";
  if (token != null) {
    data["Authorization"] = "Bearer $token";
    // return {
    //   "Accept": "application/json",
    //   "Content-Type": "application/json",
    // };
  }

  return data;
  // else {
  //   return {
  //     "Accept": "application/json",
  //     "Content-Type": "application/json",
  //     "Authorization": "Bearer $token"
  //   };
  // }
}
