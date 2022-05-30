import 'package:flutter/cupertino.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/models/barberUserSide/babershop_profile_model.dart';

class ShopViewModelProvider extends ChangeNotifier {
  List<BarberShopProfilePageModel>? barbershopList;

  getBarberShopList(ctx) async {
    barbershopList = await barbarFirebaseSerivce.getBarberProfile(ctx);
    notifyListeners();
  }
}
