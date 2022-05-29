import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/models/customerUserSide/customer_profile_model.dart';

class LocalStorageServiceProvider extends ChangeNotifier {
  String? uid;
  CustomerProfileModel? cusProfile;

  //readUID on appStart
  Future<String?> readUID() async {
    final String? v = localStorage.read(StorageKeys.uID.name);
    if (v != null) {
      uid = v;

      print("uid : $uid");
      notifyListeners();
      return Future.value(v);
    }
    return null;
  }

  saveUID(String uid) {
    print("save uid callled");
    try {
      localStorage
          .write(StorageKeys.uID.name, uid)
          .then((value) => print("saved! to storage $uid"));
      this.uid = uid;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  readCusProfile() {
    log("[+] GETTING PROFILE FROM READCUST [+]");
    final String? v = localStorage.read(StorageKeys.cUSTOMERPROFILE.name);
    if (v != null) {
      cusProfile = CustomerProfileModel.formMap(json.decode(v));
      log("cusProfile : ${cusProfile!.toMap()}");
      notifyListeners();
    }
  }

  saveCusProfile(CustomerProfileModel cusProfile) {
    log("SAVING....CUST PROFILE");
    try {
      localStorage.write(
          StorageKeys.cUSTOMERPROFILE.name, json.encode(cusProfile.toMap()));
      readCusProfile();
      log("save done!");
    } catch (e) {
      log("save errro!");
      throw Exception(e);
    }
  }

  logout() {
    localStorage.erase();
    uid = null;
    cusProfile = null;
  }
}

enum StorageKeys {
  uID,
  cUSTOMERPROFILE,
}
