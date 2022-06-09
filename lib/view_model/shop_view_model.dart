import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/models/user.dart';

class ShopViewModelProvider extends ChangeNotifier {
  List<User?> _shopList = [];

  List<User?> get shopList => _shopList;
  set(List<User?> value) {
    _shopList = value;
    notifyListeners();
  }

  Future getShopList() async {
    log("getting shop list");
    _shopList = await barbershopServiceFirebase.getBarbershopsList();
    notifyListeners();
  }
}
