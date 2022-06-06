import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:razor_book/helpers/colors.dart';

import 'package:razor_book/views/common_widgets/logout_custome_button.dart';
import 'package:razor_book/views/common_widgets/pages_appbar.dart';
import 'package:razor_book/views/common_widgets/profile_text_view_custome_widget.dart';
import 'package:razor_book/views/common_widgets/profile_view_avatar.dart';

import 'barbershop_view_profile_related_widgets/barbershop_services_display_view.dart';
import 'barbershop_view_profile_related_widgets/view_address_customer_widget.dart';
import 'barbershop_view_profile_related_widgets/view_chips_of_working_days.dart';

class BarbershopProfileView extends StatelessWidget {
  const BarbershopProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //1- from here you should connect the viewModel
    return Scaffold(
      appBar: appBar(
        bartitle: const Text(
          "Profile",
          style: TextStyle(
            fontFamily: "MetropolisExtra",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Helper.kTitleTextColor,
          ),
        ),
        onPressedFunctionForRightAction: () {},
        appBarRightIcon: const Icon(
          Icons.shopping_cart,
          color: Helper.kTitleTextColor,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Column(
                children: [
                  // ProfileViewAppBar(editMode: false),

                  const ProfileViewAvator(
                    editMode: false,
                  ),
                  const SizedBox(height: 40),
                  // pass from the viewModel in the userDate
                  const ProfileViewInfoText(
                    label: "Name",
                    userDate: "Amit Hasan Sadhin",
                  ),
                  const SizedBox(height: 40),
                  // pass from the viewModel in the userDate
                  const ProfileViewInfoText(
                    label: "Shop Email",
                    userDate: "amithasan7866@email.com",
                  ),

                  const SizedBox(height: 40),
                  // pass from the viewModel in the userDate
                  const ProfileViewInfoText(
                    label: "Shop Contact No",
                    userDate: "+601162325010",
                  ),
                  const SizedBox(height: 40),
                  // pass from the viewModel in the userDart
                  //only pass the written address
                  ProfileViewBarbershopAddress(
                    barberShopWrittenAddress:
                        "just random address here to test on screen",
                    openLocationOnMap: () {},
                  ),
                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //pass time from viewModel throught userDate
                      const ProfileViewInfoText(
                        label: "Open Time",
                        userDate: "03:30 AM",
                      ),
                      //pass time from viewModel throught userDate
                      const ProfileViewInfoText(
                        label: "Close Time",
                        userDate: "15:23 PM",
                      ),
                    ],
                  ),
                  //pass array of working day here
                  ViewWorkingDaysByChips(
                    workingDays: ["Sunday", "Moday", "Tuesday", "Wednesday"],
                  ),
                  const SizedBox(height: 20),
                  //if you want to pass the array of service just add a constructor to this class
                  //or connect the viewModel With it
                  const BarbershopViewListOfServices(
                    title: "Services",
                    readOnly: true,
                  ),
                  const SizedBox(height: 30),

                  // here will pass a function to logout from the current user
                  LogoutCustomButton(logoutFromAppCallBack: () {}),
                  const SizedBox(height: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
