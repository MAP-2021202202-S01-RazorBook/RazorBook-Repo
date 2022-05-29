import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  save(String k, String v) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(k, v);
  }

  Future<String?> read(String k) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(k);
  }

  clear() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
