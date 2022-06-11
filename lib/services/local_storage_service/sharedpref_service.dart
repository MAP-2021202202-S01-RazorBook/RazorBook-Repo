import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  save(String k, dynamic v) async {
    final pref = await SharedPreferences.getInstance();

    if (v.runtimeType == bool) {
      pref.setBool(k, v);
    } else {
      pref.setString(k, v);
    }
  }

  Future<String?> read(String k) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(k);
  }

  Future<bool?> readBool(String k) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(k);
  }

  clear() async {
    final pref = await SharedPreferences.getInstance();

    bool cleared = await pref.clear();

    log("cleard : $cleared");
  }
}
