import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/models/user.dart';
import 'package:razor_book/services/failure.dart';
import 'package:razor_book/services/local_storage_service/sharedpref_service.dart';

class LocalStorageServiceProvider extends ChangeNotifier {
  String? uid;
  User? userProfile;

  SharedPreferencesService get sharePrefs =>
      locator<SharedPreferencesService>();

  //readUID on appStart
  Future<String?> readUID() async {
    log("[+] READING UID [+]");
    final v = await sharePrefs.read(StorageKeys.uID.name);
    if (v != null) {
      uid = v;

      log("uid : $uid");
      notifyListeners();
      return Future.value(v);
    } else {
      log("uid : null");
      return Future.value(null);
    }
  }

  saveUID(String uid) {
    log("save uid callled");
    try {
      sharePrefs.save(StorageKeys.uID.name, uid);

      this.uid = uid;
      notifyListeners();
    } catch (e) {
      throw Failure(500,
          message: e.toString(),
          location: 'LocalStorageServiceProvider.saveUID()');
    }
  }

  readProfile() async {
    log("[+] GETTING PROFILE FROM READCUST [+]");
    final String? v = await sharePrefs.read(StorageKeys.pROFILE.name);
    if (v != null) {
      userProfile = User.fromJson(jsonDecode(v));
      notifyListeners();
    }
  }

  saveProfile(User appUser) async {
    log("SAVING....CUST PROFILE");
    try {
      await sharePrefs.save(
          StorageKeys.pROFILE.name, jsonEncode(appUser.toJson()));
      log("save done!");
    } catch (e) {
      log("save errro!");
      throw Failure(500,
          message: e.toString(),
          location: 'LocalStorageServiceProvider.saveProfile()');
    }
  }

  logout() async {
    uid = null;
    userProfile = null;
    await sharePrefs.clear();
  }
}

enum StorageKeys {
  uID,
  pROFILE,
}
