import 'dart:developer';

import 'package:razor_book/services/local_storage_service/local_storage_service.dart';
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
    await pref.remove(StorageKeys.uID.name);
    await pref.remove(StorageKeys.cUSTOMERPROFILE.name);
    bool cleared = await pref.clear();

    log("cleard : $cleared");
  }
}
