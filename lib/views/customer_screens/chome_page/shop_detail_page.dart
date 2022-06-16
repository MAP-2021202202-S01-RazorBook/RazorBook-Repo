// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/helpers/assets.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/views/common_widgets/pages_appbar.dart';
import 'package:razor_book/views/customer_screens/customer_book_checkout/book_now_screen.dart';

import '../../../view_model/barber_profile_view_model.dart';

class BarberhopDetailView extends StatelessWidget {
  BarberhopDetailView({Key? key, required this.barbershop_id})
      : super(key: key);

  String? barbershop_id;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<BarberProfileViewModel>();

    return FutureBuilder(
        future: model.getBarbershopDetailsForCustomer(barbershop_id),
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
            return Scaffold(
                appBar: appBar(
                    bartitle: const Text("Barbershops Details",
                        style: TextStyle(
                          fontFamily: "MetropolisExtra",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Helper.kTitleTextColor,
                        )),
                    onPressedFunctionForRightAction: () {},
                    appBarRightIcon: const Icon(
                      Icons.shopping_cart,
                      color: Helper.kTitleTextColor,
                    ),
                    leadingW: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Helper.kTitleTextColor,
                      ),
                    )),
                body: SafeArea(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  // if the image in the model.barbershopdetails exists,
                                  // display it, else display a placeholder
                                  image: (model.barbershopForCustomer?['image']
                                                  ?.length >
                                              0
                                          ? NetworkImage(model
                                              .barbershopForCustomer?['image'])
                                          : const AssetImage(AssetHelper
                                              .barberShopPlaceholder))
                                      as ImageProvider,
                                  fit: BoxFit.contain,
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
                          bottom: 30,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.52,
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
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        //here will be the barbershop name *fetched from User model
                                        //that we got from the passed ID
                                        child: Text(
                                          model.barbershopForCustomer!['name'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Metropolis',
                                              color: Helper.kTitleTextColor),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              //once we add the variables we need to delete the Const for the array
                                              children: [
                                                Text(
                                                  "Address:",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Metropolis',
                                                      color: Helper
                                                          .kTitleTextColor,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                //here will be the barbershop address *fetched from User model
                                                //that we got from the passed ID
                                                Text(
                                                  model.barbershopForCustomer![
                                                      'address'],
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Metropolis',
                                                      color: Helper
                                                          .kTitleTextColor),
                                                )
                                              ],
                                            ),
                                            //here we should connect it we google maps since we will get the Latitude and Longitude
                                            //that we got from the passed ID
                                            InkWell(
                                              onTap: () => log("tapped!"),
                                              child: const Text(
                                                "View On Map",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Metropolis',
                                                    color: Helper.kFABColor),
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
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Rating:",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Metropolis',
                                                      color: Helper
                                                          .kTitleTextColor,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                //here we should use the ratings varaiable
                                                //that we got from the passed ID
                                                Text(
                                                  "4/5",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Metropolis',
                                                    color: Helper
                                                        .kTitleTextColor
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                              ],
                                            )),
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
                                                  color:
                                                      Helper.kTitleTextColor)),
                                        ),
                                      ),

                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          //here we should use the description varaiable
                                          //that we got from the passed ID
                                          child: Text(
                                              model.barbershopForCustomer![
                                                  'description'],
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
                                                  color:
                                                      Helper.kTitleTextColor)),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                            "${model.barbershopForCustomer!['open_time']} to ${model.barbershopForCustomer!['close_time']}",
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
                                                  color:
                                                      Helper.kTitleTextColor)),
                                          children: [
                                            //here there should be a listView that iterates the openDays list
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text("Saturday",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Metropolis',
                                                      color: Helper
                                                          .kTitleTextColor)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text("Monday",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Metropolis',
                                                      color: Helper
                                                          .kTitleTextColor)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text("Tuesday",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Metropolis',
                                                      color: Helper
                                                          .kTitleTextColor)),
                                            ),
                                          ]),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: const StadiumBorder(),
                                                primary: Helper.kFABColor,
                                                fixedSize: Size(
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                    56)),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BookNow(
                                                          barbershop_id:
                                                              barbershop_id ??
                                                                  "",
                                                        )),
                                              );
                                            },
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
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ));
          }
        });
  }
}
