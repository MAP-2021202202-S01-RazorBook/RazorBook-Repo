// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';

import 'package:razor_book/helpers/assets.dart';
import 'package:razor_book/models/barberUserSide/babershop_profile_model.dart';
import 'package:razor_book/view_model/shop_view_model.dart';
import 'package:razor_book/views/customer_screens/chome_page/shop_list_item.dart';

class ShopList extends StatelessWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this list will be replaced
    //with the one fetched from firebase
    //this one should be replaced with the User Model we have
    // we should change its type from BarberShopProfilePageModel to User
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: FutureBuilder(
          future: Future.delayed(
            const Duration(seconds: 1),
            () => shopViewModelProvider.getShopList(),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Consumer<ShopViewModelProvider>(
                builder: (context, ShopViewModelProvider x, __) {
              return Container(
                // color: Colors.red,
                child: ListView.separated(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: x.shopList.length,
                  itemBuilder: (ctx, idx) {
                    return ShopListItem(bbsProfile: x.shopList[idx]!);
                  },
                ),
              );
            });
          }),
    );
  }
}
