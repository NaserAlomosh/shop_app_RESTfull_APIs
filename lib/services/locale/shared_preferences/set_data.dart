import '../../../main.dart';

class SetDataSharedPreferences {
  Future<bool> setData({required String key, required dynamic value}) async {
    if (value is String) {
      print(value);
      return await prefs!.setString(key, value);
    } else if (value is int) {
      print(value);
      //
      return prefs!.setInt(key, value);
      //
    } else if (value is double) {
      print(value);
      //
      return prefs!.setDouble(key, value);
      //
    } else if (value is bool) {
      print(value);
      //
      return prefs!.setBool(key, value);
      //
    } else if (value is List<String>) {
      print(value);
      //
      return await prefs!.setStringList(key, value);
      //
    }
    return false;
  }
}
