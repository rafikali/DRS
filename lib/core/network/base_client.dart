import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../injector.dart';

class GtBaseClient {
  Future getRequest(
      {String url = '', String apiKey = '', bool shouldCache = false}) async {
    http.Response? response;
    try {
      response = await http.get(Uri.parse(url + apiKey));
      if (response.statusCode == 200 && shouldCache) {}
    } catch (e) {
      //on error return cache value if it is available
      final cacheValue = locator<SharedPreferences>().getString(url + apiKey);
      if (cacheValue != null) {
        response = http.Response(cacheValue, 200);
      }
    }
    return response;
  }
}
