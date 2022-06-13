import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/models/user.dart';

import '../services/barbershop_profile/barbershop_profile_service.dart';

class ShopViewModelProvider extends ChangeNotifier {
  List<Map<String, dynamic>?>? _shopList = [];

  List<Map<String, dynamic>?>? get shopList => _shopList;
  set(List<Map<String, dynamic>?>? value) {
    _shopList = value;
    notifyListeners();
  }

  Future getShopList() async {
    log("getting shop list");
    await locator<BarbershopService>().getBarbershopsList();
    _shopList = locator<BarbershopService>().barbershopsList;
    notifyListeners();
  }
}
