// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/helpers/assets.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/models/user.dart';
import 'package:razor_book/view_model/bookings_view_model.dart';
import 'package:razor_book/views/common_widgets/pages_appbar.dart';
import 'package:razor_book/views/customer_screens/customer_book_checkout/book_now_screen.dart';

import '../../../view_model/barber_profile_view_model.dart';

class BarberhopDetailView extends StatelessWidget {
  BarberhopDetailView({Key? key, required this.barbershop}) : super(key: key);

  User barbershop;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<BarberProfileViewModel>();

    return FutureBuilder(
        future: model.getBarbershopDetailsForCustomer(barbershop.u_id),
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
            return DefaultTabController(
              length: 2,
              child: Scaffold(
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
                    ),
                    bottom: const TabBar(
                      labelColor: Helper.kFABColor,
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(text: 'Info', icon: Icon(Icons.info)),
                        Tab(text: 'Reviews', icon: Icon(Icons.comment)),
                      ],
                    ),
                  ),
                  body: SafeArea(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    // if the image in the model.barbershopdetails exists,
                                    // display it, else display a placeholder
                                    image:
                                        (model.barbershopForCustomer?['image']
                                                        ?.length >
                                                    0
                                                ? NetworkImage(model
                                                        .barbershopForCustomer?[
                                                    'image'])
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
                                height:
                                    MediaQuery.of(context).size.height * 0.52,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                // height: MediaQuery.of(context).size.height * 0.4,

                                child: TabBarView(children: [
                                  Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: ListView(
                                        children: [
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            //here will be the barbershop name *fetched from User model
                                            //that we got from the passed ID
                                            child: Text(
                                              model.barbershopForCustomer![
                                                  'name'],
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Metropolis',
                                                  color:
                                                      Helper.kTitleTextColor),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Wrap(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  //once we add the variables we need to delete the Const for the array
                                                  children: [
                                                    const Text(
                                                      "Address:",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily:
                                                              'Metropolis',
                                                          color: Helper
                                                              .kTitleTextColor,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    //here will be the barbershop address *fetched from User model
                                                    //that we got from the passed ID
                                                    Text(
                                                      model.barbershopForCustomer![
                                                          'address'],
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily:
                                                              'Metropolis',
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily:
                                                            'Metropolis',
                                                        color:
                                                            Helper.kFABColor),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),

                                          //
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                          fontFamily:
                                                              'Metropolis',
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
                                                    model.barbershopForCustomer![
                                                                    'rating'] !=
                                                                0 &&
                                                            model.barbershopForCustomer![
                                                                    'rating'] !=
                                                                null
                                                        ? Text(
                                                            "${model.barbershopForCustomer!['rating']}/5",
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'Metropolis',
                                                              color: Helper
                                                                  .kTitleTextColor
                                                                  .withOpacity(
                                                                      0.6),
                                                            ),
                                                          )
                                                        : Text(
                                                            "no ratings yet",
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'Metropolis',
                                                              color: Helper
                                                                  .kTitleTextColor
                                                                  .withOpacity(
                                                                      0.6),
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
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Metropolis',
                                                      color: Helper
                                                          .kTitleTextColor)),
                                            ),
                                          ),

                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              //here we should use the description varaiable
                                              //that we got from the passed ID
                                              child: Text(
                                                  model.barbershopForCustomer![
                                                      'description'],
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Metropolis',
                                                      color: Helper
                                                          .kTitleTextColor
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
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Metropolis',
                                                      color: Helper
                                                          .kTitleTextColor)),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                "${model.barbershopForCustomer!['open_time']} to ${model.barbershopForCustomer!['close_time']}",
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Metropolis',
                                                    color: Helper
                                                        .kTitleTextColor)),
                                          ),

                                          const ExpansionTile(
                                              title: Text("Opeing Days",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Metropolis',
                                                      color: Helper
                                                          .kTitleTextColor)),
                                              children: [
                                                //here there should be a listView that iterates the openDays list
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text("Saturday",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily:
                                                              'Metropolis',
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
                                                          fontFamily:
                                                              'Metropolis',
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
                                                          fontFamily:
                                                              'Metropolis',
                                                          color: Helper
                                                              .kTitleTextColor)),
                                                ),
                                              ]),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        const StadiumBorder(),
                                                    primary: Helper.kFABColor,
                                                    fixedSize: Size(
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                        56)),
                                                onPressed: () async {
                                                  var bookingVM = locator<
                                                      BookingsViewModel>();

                                                  bookingVM.getService(
                                                      barbershop.u_id);
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            BookNow(
                                                              barbershop:
                                                                  barbershop,
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: model
                                                .barbershopForCustomer![
                                                    'reviews']
                                                .length ==
                                            0
                                        ? const Center(
                                            child: Text("No Reviews",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Metropolis',
                                                    color: Helper
                                                        .kTitleTextColor)),
                                          )
                                        : ListView.builder(
                                            itemCount: model
                                                .barbershopForCustomer![
                                                    'reviews']
                                                .length,
                                            // each item displays rating out of 5, the comment, the customer name, the date and time
                                            itemBuilder: (context, index) {
                                              return Card(
                                                child: ListTile(
                                                  // title is start icon with large text of rating out of 5
                                                  title: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    child: Row(
                                                      children: <Widget>[
                                                        const Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
                                                          size: 30,
                                                        ),
                                                        Text(
                                                          " ${model.barbershopForCustomer!['reviews'][index]['rating']} / 5",
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'Metropolis',
                                                              color: Helper
                                                                  .kFABColor),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // subtitle is comment icon with comment text
                                                  subtitle: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    child: Row(
                                                      children: <Widget>[
                                                        const Icon(
                                                          Icons.comment,
                                                          color: Colors.grey,
                                                          size: 20,
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          child: Text(
                                                            model.barbershopForCustomer![
                                                                        'reviews']
                                                                    [index]
                                                                ['comment'],
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    'Metropolis',
                                                                color: Helper
                                                                    .kTitleTextColor),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // the trailing should contain date, time and customer name
                                                  trailing: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    child: Wrap(
                                                      children: <Widget>[
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          child: Text(
                                                            model.barbershopForCustomer![
                                                                    'reviews']
                                                                [index]['date'],
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    'Metropolis',
                                                                color: Helper
                                                                    .kTitleTextColor),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          model.barbershopForCustomer![
                                                                  'reviews']
                                                              [index]['time'],
                                                          style: const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  'Metropolis',
                                                              color: Helper
                                                                  .kTitleTextColor),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          model.barbershopForCustomer![
                                                                          'reviews']
                                                                      [index][
                                                                  'customer'] ??
                                                              "",
                                                          style: const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  'Metropolis',
                                                              color: Helper
                                                                  .kTitleTextColor),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                  ),
                                ]),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            );
          }
        });
  }
}
