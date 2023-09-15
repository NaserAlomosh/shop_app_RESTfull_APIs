import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:phone_taolet_desktop/services/networking/end_point.dart';

class PostApiHelper {
  static Future<http.Response> postData({
    required String query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    if (token == null) {
      http.Response response = await http.post(
        Uri.parse('$BASEUrl$query'),
        headers: <String, String>{
          'lang': 'ar',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );
      return response;
    } else {
      http.Response response = await http.post(
        Uri.parse('$BASEUrl$query'),
        headers: <String, String>{
          'lang': 'ar',
          'Content-Type': 'application/json',
          'Authorization': token,
        },
        body: jsonEncode(data),
      );
      return response;
    }
  }
}
