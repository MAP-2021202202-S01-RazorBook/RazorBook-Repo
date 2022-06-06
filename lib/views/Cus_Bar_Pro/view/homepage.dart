// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:razorbook_barber/view/customer_profile_view.dart';
import 'package:razorbook_barber/view/profile_view.dart';

import '../helpers/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  int currentIndex = 0;
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
    // print(showFab);
    return Scaffold(
      extendBody: true,
      floatingActionButton: Visibility(
        visible: currentIndex != 2,
        child: InkWell(
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
          onPageChanged: ((value) => setState(() => currentIndex = value)),
          controller: _pageController,
          children: [
            //bookingsView
            Container(
              color: Colors.red,
            ),

            ///home//shopview
            CustomerProfileView(),
            // ShopView(
            //   customerProfileModel: customerProfileModel,
            // ),
            //profileView
            ProfileView(),
          ],
        ),
      ),
    );
  }
}
