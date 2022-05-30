import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/models/customerUserSide/customer_profile_model.dart';
import 'package:razor_book/services/local_storage_service/sharedpref_service.dart';

class LocalStorageServiceProvider extends ChangeNotifier {
  String? uid;
  CustomerProfileModel? cusProfile;
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
      throw Exception(e);
    }
  }

  readCusProfile() async {
    log("[+] GETTING PROFILE FROM READCUST [+]");
    final String? v = await sharePrefs.read(StorageKeys.cUSTOMERPROFILE.name);
    if (v != null) {
      cusProfile = CustomerProfileModel.formMap(json.decode(v));
      log("cusProfile : ${cusProfile!.toMap()}");
      notifyListeners();
    }
  }

  saveCusProfile(CustomerProfileModel cusProfile) async {
    log("SAVING....CUST PROFILE");
    try {
      sharePrefs.save(
          StorageKeys.cUSTOMERPROFILE.name, json.encode(cusProfile.toMap()));
      this.cusProfile = cusProfile;
      await readCusProfile();
      log("save done!");
    } catch (e) {
      log("save errro!");
      throw Exception(e);
    }
  }

  logout() async {
    uid = null;
    cusProfile = null;

    await sharePrefs.clear();
  }
}

enum StorageKeys {
  uID,
  cUSTOMERPROFILE,
}
