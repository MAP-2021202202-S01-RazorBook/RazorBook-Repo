// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/helpers/assets.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/models/barberUserSide/babershop_profile_model.dart';
import 'package:razor_book/services/local_storage_service/local_storage_service.dart';
import 'package:razor_book/view_model/shop_view_model.dart';

class ShopView extends StatelessWidget {
  const ShopView({
    Key? key,
  }) : super(key: key);

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
          shopeImage: AssetHelper.assetBarbarShopOne,
          availableTimes: [],
          services: ['Classic cuts']),
      BarberShopProfilePageModel(
          shopName: "S & S Barbershop",
          shopLocation: "",
          customers: 1111,
          profileViews: 900,
          contactNumber: 1233432234,
          rating: 4.9,
          shopeImage: AssetHelper.assetBarbarShopTwo,
          availableTimes: [],
          services: ['Classic cuts']),
      BarberShopProfilePageModel(
          shopName: "Faiz Barbershop",
          shopLocation: "",
          customers: 1111,
          profileViews: 900,
          contactNumber: 1233432234,
          rating: 4.9,
          shopeImage: AssetHelper.assetBarbarShopThree,
          availableTimes: [],
          services: ['Classic cuts']),
    ];

    List<BarberShopProfilePageModel> bbsModelList = [
      BarberShopProfilePageModel(
          shopName: "Tip Top Barber JB",
          shopLocation: "",
          customers: 1111,
          profileViews: 900,
          contactNumber: 1233432234,
          rating: 1.9,
          shopeImage: AssetHelper.assetBarberShopSix,
          availableTimes: [],
          services: ['Western Cut']),
      BarberShopProfilePageModel(
          shopName: "Havoc Barber",
          shopLocation: "",
          customers: 1111,
          profileViews: 900,
          contactNumber: 1233432234,
          rating: 2.9,
          shopeImage: AssetHelper.assetBarberShopSeven,
          availableTimes: [],
          services: ['Western Cut']),
      BarberShopProfilePageModel(
          shopName: "Muhib Barbershop",
          shopLocation: "",
          customers: 1111,
          profileViews: 900,
          contactNumber: 1233432234,
          rating: 0.9,
          shopeImage: AssetHelper.assetBarberShopEight,
          availableTimes: [],
          services: ['Western Cut']),
    ];
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
        const ShopViewAppBar(),
        const SearchBar(),
        const BarBarMenuItemRow(),
        const TitleRow(
          text: "Popular Barber Shop",
        ),
        FutureBuilder(
          future: Provider.of<ShopViewModelProvider>(context, listen: false)
              .getBarberShopList(context),
          builder: ((context, snapshot) {
            print(snapshot.connectionState);
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            ///
            ///
            final bbsList =
                Provider.of<ShopViewModelProvider>(context, listen: false)
                    .barbershopList;

            return Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  // ignore: prefer_const_constructors
                  ...bbsList!
                      .map((e) => MostPopularItem(bbsProfile: e))
                      .toList(),
                  // MostPopularItem(bbsProfile: bbsList![0]),
                  // MostPopularItem(bbsProfile: bbsList![1]),
                  // MostPopularItem(bbsProfile: bbsList![2]),
                  const SizedBox(
                    height: 32,
                  ),
                  const TitleRow(
                    text: "Most Popular",
                  ),

                  const SizedBox(
                    height: 32,
                  ),
                  const MostPopularItemListForRow(),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 21.0, vertical: 8),
                      child: Text(
                        'Newly Joined',
                        style: TextStyle(
                          fontFamily: 'MetropolisExtra',
                          fontSize: 26,
                          color: Color(0xff4a4b4d),
                          fontWeight: FontWeight.w700,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                  // const NewlyJoinedBarBerItemList(),
                  NewlyJoinedBarberShopItem(
                    bbsModel: bbsModelList[0],
                  ),
                  NewlyJoinedBarberShopItem(
                    bbsModel: bbsModelList[1],
                  ),
                  NewlyJoinedBarberShopItem(
                    bbsModel: bbsModelList[2],
                  ),
                ],
              ),
            ));
          }),
          // const SizedBox(
          //   height: 30,
          // ),
        ),
      ]),
    );
  }
}

class ShopViewAppBar extends StatelessWidget {
  const ShopViewAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer<LocalStorageServiceProvider>(builder: (context, x, _) {
            String name = x.cusProfile?.name ?? '';
            return Text(
              "Good morning ${name.split(' ')[0]}",
              style: const TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Helper.kTitleTextColor),
            );
          }),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Helper.kTitleTextColor,
              ))
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: SizedBox(
        height: 48,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: "Search Barbar",
            hintStyle:
                TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 13),
            alignLabelWithHint: true,
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xff7C7D7E),
            ),
            fillColor: Helper.kSearchBoxColor,
            filled: true,
            // suffixIcon: const Icon(Icons.filter_list),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(
                color: Helper.kSearchBoxColor,
                width: 0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(
                color: Helper.kSearchBoxColor,
                width: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BarBarMenuItemRow extends StatelessWidget {
  const BarBarMenuItemRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.only(left: 11),
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 4,
            itemBuilder: (ctx, idx) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                child: Container(
                  height: 114,
                  width: 88,
                  decoration: const BoxDecoration(),
                  child: Column(
                    ///image//
                    ///Name
                    children: [
                      Container(
                        height: 88,
                        width: 88,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(getImageById(idx)),
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        getMenuNameById(idx),
                        style: const TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 14,
                          color: Color(0xff4a4b4d),
                          fontWeight: FontWeight.w700,
                          height: 1.4285714285714286,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                      // ignore: prefer_const_constructors
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  ///TODO: MOVE LATER
  ///
  ///
  String getImageById(idx) {
    switch (idx) {
      case 0:
        return AssetHelper.assetImageManOne;
      case 1:
        return AssetHelper.assetImageManTwo;
      case 2:
        return AssetHelper.assetImageManThree;
      case 3:
        return AssetHelper.assetImageManFour;

      default:
        return AssetHelper.assetImageManOne;
    }
  }

  String getMenuNameById(idx) {
    switch (idx) {
      case 0:
        return 'Classic';
      case 1:
        return 'Western';
      case 2:
        return 'Asia';
      case 3:
        return 'Europe';

      default:
        return 'Classic';
    }
  }
}

class TitleRow extends StatelessWidget {
  final String text;
  const TitleRow({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontFamily: "MetropolisExtra",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Helper.kTitleTextColor,
            ),
          ),
          const Text(
            'View All',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Helper.kButtonColor,
            ),
          ),
        ],
      ),
    );
  }
}

class PopularShopListItem extends StatelessWidget {
  const PopularShopListItem({Key? key}) : super(key: key);

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
            return MostPopularItem(bbsProfile: bbrList[idx]);
          },
        ),
      ),
    );
  }
}

class MostPopularItem extends StatelessWidget {
  const MostPopularItem({
    Key? key,
    required this.bbsProfile,
  }) : super(key: key);

  final BarberShopProfilePageModel bbsProfile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(bbsProfile.shopeImage),
                    fit: BoxFit.cover),
              )),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 21.0, top: 8, bottom: 8),
              child: Text(
                bbsProfile.shopName,
                style: const TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 16,
                  color: Color(0xff4a4b4d),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 21.0, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.star_rate_rounded,
                        size: 24, color: Helper.kButtonColor),
                    Text(
                      bbsProfile.rating.toString(),
                      style: const TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 11,
                        color: Color(0xff29ac7b),
                        height: 1.8181818181818181,
                      ),
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    Text(
                      '(124 ratings) |  ${bbsProfile.services[0]}',
                      style: const TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 12,
                        color: Color(0xffb6b7b7),
                        height: 1.6666666666666667,
                      ),
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                      softWrap: false,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class MostPopularItemListForRow extends StatelessWidget {
  const MostPopularItemListForRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BarberShopProfilePageModel> bbsModelList = [
      // BarberShopProfilePageModel(100, 11, "", "Huston Barber", "", "", [11, 22],
      //     ["Wesern cut"], 111, AssetHelper.assetBarbarShopFour),
      // BarberShopProfilePageModel(100, 11, "", "International Barber", "", "",
      //     [11, 22], ["Wesern cut"], 111, AssetHelper.assetBarbarShopFive)
      BarberShopProfilePageModel(
          shopName: "Huston Barber",
          shopLocation: "",
          customers: 12,
          profileViews: 20,
          contactNumber: 1233432234,
          rating: 4.9,
          shopeImage: AssetHelper.assetBarbarShopFour,
          availableTimes: [],
          services: ['Western cut']),
      BarberShopProfilePageModel(
          shopName: "International Barber",
          shopLocation: "",
          customers: 12,
          profileViews: 20,
          contactNumber: 1233432234,
          rating: 4.9,
          shopeImage: AssetHelper.assetBarbarShopFive,
          availableTimes: [],
          services: ['Western cut']),
    ];
    return Container(
      height: 185,
      child: Padding(
        padding: const EdgeInsets.only(left: 13.0),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (ctx, idx) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 125,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(bbsModelList[idx].shopeImage),
                                fit: BoxFit.cover),
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        bbsModelList[idx].shopName,
                        style: const TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 18,
                          color: Color(0xff4a4b4d),
                          fontWeight: FontWeight.w700,
                        ),
                        softWrap: false,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            bbsModelList[idx].services[0].toString(),
                            style: const TextStyle(
                              fontFamily: 'Metropolis',
                              fontSize: 12,
                              color: Color(0xffb6b7b7),
                              height: 1.6666666666666667,
                            ),
                            textHeightBehavior: const TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          const Icon(
                            Icons.star_rate_rounded,
                            color: Helper.kButtonColor,
                          ),
                          Text(
                            bbsModelList[idx].rating.toString(),
                            style: const TextStyle(
                              fontFamily: 'Metropolis',
                              fontSize: 11,
                              color: Color(0xff29ac7b),
                              height: 1.8181818181818181,
                            ),
                            textHeightBehavior: const TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                          const Spacer(),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

// class NewlyJoinedBarBerItemList extends StatelessWidget {
//   const NewlyJoinedBarBerItemList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<BarberShopProfilePageModel> bbsModelList = [
//       BarberShopProfilePageModel(
//           100,
//           11,
//           "",
//           "Tip Top Barber JB",
//           "",
//           "",
//           [11, 22],
//           [
//             {"service": "Wesern cut"}
//           ],
//           111,
//           AssetHelper.assetBarberShopSix),
//       BarberShopProfilePageModel(
//           100,
//           11,
//           "",
//           "Havoc Barber",
//           "",
//           "",
//           [11, 22],
//           [
//             {"service": "Wesern cut"}
//           ],
//           111,
//           AssetHelper.assetBarberShopSeven),
//       BarberShopProfilePageModel(
//           100,
//           11,
//           "",
//           "Muhib Barbershop",
//           "",
//           "",
//           [11, 22],
//           [
//             {"service": "Wesern cut"}
//           ],
//           111,
//           AssetHelper.assetBarberShopSeven)
//     ];
//     return IntrinsicHeight(
//         child: ListView.builder(
//             itemCount: 3,
//             itemBuilder: (ctx, idx) {
//               return NewlyJoinedBarberShopItem(bbsModelList: bbsModelList);
//             }));
//   }
// }

class NewlyJoinedBarberShopItem extends StatelessWidget {
  const NewlyJoinedBarberShopItem({
    Key? key,
    required this.bbsModel,
  }) : super(key: key);

  final BarberShopProfilePageModel bbsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          width: 75,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: AssetImage(bbsModel.shopeImage), fit: BoxFit.fitWidth),
          ),
        ),
        title: Text(
          bbsModel.shopName,
          style: const TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 18,
            color: Color(0xff4a4b4d),
            fontWeight: FontWeight.w700,
          ),
          softWrap: false,
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 4,
            ),
            Text(
              bbsModel.services[0].toString(),
              style: const TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 11,
                color: Color(0xffb6b7b7),
                height: 1.8181818181818181,
              ),
              textHeightBehavior:
                  const TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_rate_rounded,
                  color: Helper.kButtonColor,
                  size: 20,
                ),
                Text(
                  '${bbsModel.rating} (124 Ratings)',
                  style: const TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 11,
                    color: Color(0xff35b082),
                    height: 1.8181818181818181,
                  ),
                  textHeightBehavior:
                      const TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
