import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:razor_book/helpers/colors.dart';

import 'package:razor_book/views/common_widgets/logout_custome_button.dart';
import 'package:razor_book/views/common_widgets/pages_appbar.dart';
import 'package:razor_book/views/common_widgets/profile_text_view_custome_widget.dart';
import 'package:razor_book/views/common_widgets/profile_view_avatar.dart';

import '../../barbershop_screens/barbershop_profile/barbershop_edit_profile_screen.dart';
import 'customer_profile_edit_screen.dart';

class CustomerProfileView extends StatelessWidget {
  const CustomerProfileView({Key? key}) : super(key: key);

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

                  ProfileViewAvator(
                    editMode: false,
                    onTapMethod: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CustomerEditProfile()));
                    },
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
                    label: "Email",
                    userDate: "amithasan7866@email.com",
                  ),

                  const SizedBox(height: 40),
                  // pass from the viewModel in the userDate
                  const ProfileViewInfoText(
                    label: "Phone Number",
                    userDate: "+601162325010",
                  ),
                  // pass from the viewModel in the userDart
                  const SizedBox(height: 40),
                  const ProfileViewInfoText(
                    // pass from the viewModel in the userDart

                    label: "Adress",
                    userDate: "Melana Apartment - Skudai",
                  ),

                  const SizedBox(height: 40),

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
