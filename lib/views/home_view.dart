// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';

import 'package:razor_book/models/customerUserSide/customer_profile_model.dart';

import '../helpers/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 1, keepPage: true);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final String? uid = localStorageServiceProvider.uid;
    // print(showFab);
    return FutureBuilder(
        future: customerDatabaseManager.getCustomerProfile(uid!),
        builder: (context, AsyncSnapshot<CustomerProfileModel?> snapshot) {
          if (snapshot.connectionState != ConnectionState.done ||
              snapshot.hasError ||
              snapshot.data == null) {
            return Center(child: CupertinoActivityIndicator());
          }
          CustomerProfileModel? customerProfileModel = snapshot.data;
          log("profile from dash -->${customerProfileModel!.name}");
          return Scaffold(
            extendBody: true,
            floatingActionButton: InkWell(
              onTap: () {
                _pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Helper.kFABColor,
                  radius: 32,
                  child: Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              // color: Colors.white,
              // elevation: 5,
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      _pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(
                            Icons.shopping_bag,
                            size: 32,
                            color: Helper.kButtonColor,
                          ),
                          Text(
                            "bookings",
                            style: TextStyle(
                                fontSize: 12,
                                color: Helper.kButtonColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // IconButton(
                  //   icon: const Icon(Icons.add_shopping_cart),
                  //   onPressed: () {},
                  // ),
                  InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      _pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(
                            Icons.person,
                            size: 32,
                            color: Helper.kButtonColor,
                          ),
                          Text(
                            "profile",
                            style: TextStyle(
                                fontSize: 12,
                                color: Helper.kButtonColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              bottom: false,
              child: PageView(
                controller: _pageController,
                children: [
                  //bookingsView
                  Container(
                    color: Colors.red,
                  ),

                  ///home//shopview
                  Container(
                    color: Colors.blue,
                  ),
                  // ShopView(
                  //   customerProfileModel: customerProfileModel,
                  // ),
                  //profileView
                  Container(
                    color: Colors.yellow,
                  ),
                  // ProfileView(),
                ],
              ),
            ),
          );
        });
  }
}
