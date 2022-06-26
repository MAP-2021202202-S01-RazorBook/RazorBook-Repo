// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../helpers/colors.dart';

import '../all_bookings_view.dart';
import 'chome_page/customer_shops_home_page.dart';
import 'customer_profile_screen.dart';

class CustomerMainPageNav extends StatefulWidget {
  const CustomerMainPageNav({Key? key}) : super(key: key);

  @override
  State<CustomerMainPageNav> createState() => _HomeViewState();
}

class _HomeViewState extends State<CustomerMainPageNav> {
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
    return Scaffold(
      extendBody: true,
      floatingActionButton: InkWell(
        onTap: () {
          _pageController.animateToPage(1,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
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
          children: const [
            ViewBookings(),
            ShopView(),
            ProfileView(),
            // Container(
            //   color: Colors.red,
            // ),
          ],
        ),
      ),
    );
  }
}
