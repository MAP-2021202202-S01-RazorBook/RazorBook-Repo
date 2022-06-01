
import 'package:flutter/material.dart';

import 'package:razor_book/helpers/assets.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/models/barberUserSide/babershop_profile_model.dart';
import 'package:razor_book/views/customer_screens/chome_page/shop_list_item.dart';


class ShopList extends StatelessWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BarberShopProfilePageModel> bbrList = [
      BarberShopProfilePageModel(
          shopName: "Mr Macho Studio barbershop",
          shopLocation: "",
          customers: 1111,
          profileViews: 900,
          contactNumber: 1233432234,
          rating: 4.9,
          shopeImage: AssetHelper.assetBarberShopSix,
          availableTimes: [],
          services: ['Classic cuts']),
      BarberShopProfilePageModel(
          shopName: "S & S Barbershop",
          shopLocation: "",
          customers: 1111,
          profileViews: 900,
          contactNumber: 1233432234,
          rating: 4.9,
          shopeImage: AssetHelper.assetBarberShopSix,
          availableTimes: [],
          services: ['Classic cuts']),
      BarberShopProfilePageModel(
          shopName: "Faiz Barbershop",
          shopLocation: "",
          customers: 1111,
          profileViews: 900,
          contactNumber: 1233432234,
          rating: 4.9,
          shopeImage: AssetHelper.assetBarberShopSix,
          availableTimes: [],
          services: ['Classic cuts']),
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Container(
        // color: Colors.red,
        child: ListView.separated(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 3,
          itemBuilder: (ctx, idx) {
            return ShopListItem(bbsProfile: bbrList[idx]);
          },
        ),
      ),
    );
  }
}