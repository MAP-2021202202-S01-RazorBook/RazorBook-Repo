import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/models/user.dart';

import '../services/barbershop_profile/barbershop_profile_service.dart';

class ShopViewModelProvider extends ChangeNotifier {
  List<User?> _shopList = [];

  List<User?> get shopList => _shopList;
  set(List<User?> value) {
    _shopList = value;
    notifyListeners();
  }

  Future getShopList() async {
    log("getting shop list");
    _shopList = await locator<BarbershopService>().getBarbershopsList();
    notifyListeners();
  }
}
