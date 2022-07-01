// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/view_model/barber_noti_view_model.dart';

import '../../helpers/colors.dart';
import '../all_bookings_view.dart';
import '../all_services_view.dart';
import 'barbershop_profile/barbershop_view_profile_screen.dart';

class BarberMainPageNav extends StatefulWidget {
  const BarberMainPageNav({Key? key}) : super(key: key);

  @override
  State<BarberMainPageNav> createState() => _HomeViewState();
}

class _HomeViewState extends State<BarberMainPageNav> {
  late PageController _pageController;
  int currentIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 1, keepPage: true);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var model = context.read<BarberNotificationProvider>();
    model.getNotification();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // print(showFab);
    return Scaffold(
      // appBar: CustomAppBar(bartitle: bartitle, onPressedFunctionForRightAction: onPressedFunctionForRightAction, appBarRightIcon: appBarRightIcon),
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
                      Icons.sell,
                      size: 32,
                      color: Helper.kButtonColor,
                    ),
                    Text(
                      "Services",
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
          children: const [
            //bookingsView

            ViewServices(),

            ViewBookings(),
            BarbershopProfileView(),
          ],
        ),
      ),
    );
  }
}
