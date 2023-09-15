import 'package:http/http.dart' as http;
import 'package:phone_taolet_desktop/services/networking/end_point.dart';

class GetApiHelper {
  static Future<http.Response> getData({
    required String query,
    String? token,
  }) async {
    http.Response response =
        await http.get(Uri.parse(BASEUrl + query), headers: {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    });
    return response;
  }
}
