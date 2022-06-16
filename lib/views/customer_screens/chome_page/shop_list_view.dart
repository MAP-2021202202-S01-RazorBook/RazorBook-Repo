// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/views/customer_screens/chome_page/shop_list_item.dart';

import '../../../view_model/barber_profile_view_model.dart';

class ShopList extends StatelessWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this list will be replaced
    //with the one fetched from firebase
    //this one should be replaced with the User Model we have
    // we should change its type from BarberShopProfilePageModel to User

    BarberProfileViewModel model = context.watch<BarberProfileViewModel>();
    // List<BarberShopProfilePageModel> bbrList = [
    //   BarberShopProfilePageModel(
    //       shopName: "Mr Macho Studio barbershop",
    //       shopLocation: "",
    //       customers: 1111,
    //       profileViews: 900,
    //       contactNumber: 1233432234,
    //       rating: 4.9,
    //       shopeImage: AssetHelper.assetBarberShopSix,
    //       availableTimes: [],
    //       services: ['Classic cuts']),
    //   BarberShopProfilePageModel(
    //       shopName: "S & S Barbershop",
    //       shopLocation: "",
    //       customers: 1111,
    //       profileViews: 900,
    //       contactNumber: 1233432234,
    //       rating: 4.9,
    //       shopeImage: AssetHelper.assetBarberShopSix,
    //       availableTimes: [],
    //       services: ['Classic cuts']),
    //   BarberShopProfilePageModel(
    //       shopName: "Faiz Barbershop",
    //       shopLocation: "",
    //       customers: 1111,
    //       profileViews: 900,
    //       contactNumber: 1233432234,
    //       rating: 4.9,
    //       shopeImage: AssetHelper.assetBarberShopSix,
    //       availableTimes: [],
    //       services: ['Classic cuts']),
    // ];

    return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Container(
          // color: Colors.red,
          child: FutureBuilder(
              future: model.getAllBarbershops(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error"),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    //separatorBuilder: (context, index) => const Divider(),
                    itemCount: model.barbershopList?.length,
                    itemBuilder: (context, index) {
                      return ShopListItem(
                          bbsProfile: model.barbershopList?[index]);
                    },
                  );
                }
              }),
        ));
  }
}
