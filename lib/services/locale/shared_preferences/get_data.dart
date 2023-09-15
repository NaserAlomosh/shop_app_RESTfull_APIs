import '../../../main.dart';

class GetDataSharedPreferences {
  dynamic getData({required String key}) async {
    //
    return prefs!.get(key);
    //
  }
}
