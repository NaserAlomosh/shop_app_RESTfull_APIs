import '../../../main.dart';

class RemoveDataSharedPreferences {
  Future<bool> removeData({required String key}) async {
    //
    return prefs!.remove(key);
    //
  }
}
