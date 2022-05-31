import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:razor_book/helpers/assets.dart';
import 'package:razor_book/helpers/colors.dart';

class ShopDetailView extends StatelessWidget {
  const ShopDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetHelper.assetBarbarShopOne),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
            Positioned(
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ))),
            Positioned(
                right: 0,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ))),
            Positioned(
              bottom: 30,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  // height: MediaQuery.of(context).size.height * 0.4,

                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Mr Mancho Studio Barbershop",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Metropolis',
                                color: Helper.kTitleTextColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Address:",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Metropolis',
                                        color: Helper.kTitleTextColor,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Persiaran Baru tasek, 80150 Johor Bahru",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Metropolis',
                                        color: Helper.kTitleTextColor),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () => log("tapped!"),
                                child: const Text(
                                  "View On Map",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Metropolis',
                                      color: Helper.kTitleTextColor),
                                ),
                              )
                            ],
                          ),
                        ),

                        //
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("4/5 Ratings",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Metropolis',
                                    color: Helper.kTitleTextColor
                                        .withOpacity(0.6))),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Description",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Metropolis',
                                    color: Helper.kTitleTextColor)),
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("We'll be happy to serve you",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Metropolis',
                                    color: Helper.kTitleTextColor
                                        .withOpacity(0.6))),
                          ),
                        ),

                        const SizedBox(
                          height: 32,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Opening Time",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Metropolis',
                                    color: Helper.kTitleTextColor)),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("6.00 AM to 7.00 PM",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Metropolis',
                                  color: Helper.kTitleTextColor)),
                        ),

                        const ExpansionTile(
                            title: Text("Opeing Days",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Metropolis',
                                    color: Helper.kTitleTextColor)),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Saturday",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Metropolis',
                                        color: Helper.kTitleTextColor)),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Monday",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Metropolis',
                                        color: Helper.kTitleTextColor)),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Tuesday",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Metropolis',
                                        color: Helper.kTitleTextColor)),
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  primary: Helper.kFABColor,
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width, 56)),
                              onPressed: () async {},
                              child: const Text(
                                'Book Now',
                                style: TextStyle(
                                  fontFamily: 'Metropolis',
                                  fontSize: 16,
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                                softWrap: false,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}