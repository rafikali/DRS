import 'package:login_page/utils/pref_services.dart';

import '../Constants/app_constants.dart';

getHeader() async {
  String? token = await PrefsServices().getString(AppConstants.accessToken);
  if (token == null) {
    return {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
  } else {
    return {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
  }
}
