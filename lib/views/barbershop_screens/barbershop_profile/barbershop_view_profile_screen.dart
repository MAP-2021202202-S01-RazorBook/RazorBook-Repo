import 'package:flutter/material.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/router-constants.dart';
import 'package:razor_book/view_model/barber_profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/views/common_widgets/logout_custome_button.dart';
import 'package:razor_book/views/common_widgets/pages_appbar.dart';
import 'package:razor_book/views/common_widgets/profile_text_view_custome_widget.dart';
import 'package:razor_book/views/common_widgets/profile_view_avatar.dart';

import 'barbershop_view_profile_related_widgets/barbershop_services_display_view.dart';
import 'barbershop_view_profile_related_widgets/view_address_customer_widget.dart';
import 'barbershop_view_profile_related_widgets/view_chips_of_working_days.dart';

class BarbershopProfileView extends StatefulWidget {
  const BarbershopProfileView({Key? key}) : super(key: key);

  @override
  State<BarbershopProfileView> createState() => _BarbershopProfileViewState();
}

class _BarbershopProfileViewState extends State<BarbershopProfileView> {
  @override
  Widget build(BuildContext context) {
    BarberProfileViewModel model = context.watch<BarberProfileViewModel>();
    // model.getBarbershopDetailsForBarber();
    //1- from here you should connect the viewModel
    return FutureBuilder(
        future: model.getBarbershopDetailsForBarber(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
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
                          ProfileViewInfoText(
                            label: "Name",
                            userDate:
                                model.barbershopProfileForBarber?["name"] ??
                                    "Example Name",
                          ),
                          const SizedBox(height: 40),
                          // pass from the viewModel in the userDate
                          ProfileViewInfoText(
                            label: "Shop Email",
                            userDate:
                                model.barbershopProfileForBarber?["email"] ??
                                    "Example Email",
                          ),

                          const SizedBox(height: 40),
                          // pass from the viewModel in the userDate
                          model.barbershopProfileForBarber?["rating"]!=null && model.barbershopProfileForBarber?["rating"]!=0?
                          ProfileViewInfoText(
                            label: "Shop Rating",
                            userDate:
                                model.barbershopProfileForBarber?["rating"].toString() ??
                                    "No ratings yet",
                          ):
                          ProfileViewInfoText(
                            label: "Shop Rating",
                            userDate:
                                    "No ratings yet",
                          )
                          ,

                          const SizedBox(height: 40),
                          // pass from the viewModel in the userDate
                          ProfileViewInfoText(
                            label: "Shop Contact No",
                            userDate:
                                model.barbershopProfileForBarber?["phone"] ??
                                    "Example Phone",
                          ),
                          const SizedBox(height: 40),
                          // pass from the viewModel in the userDart
                          //only pass the written address
                          ProfileViewBarbershopAddress(
                            barberShopWrittenAddress:
                                model.barbershopProfileForBarber?["address"] ??
                                    "Example Address",
                            openLocationOnMap: () {},
                          ),
                          const SizedBox(height: 40),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //pass time from viewModel throught userDate
                              ProfileViewInfoText(
                                label: "Open Time",
                                userDate: model.barbershopProfileForBarber?[
                                        "open_time"] ??
                                    "Example Open Time",
                              ),
                              //pass time from viewModel throught userDate
                              ProfileViewInfoText(
                                label: "Close Time",
                                userDate: model.barbershopProfileForBarber?[
                                        "close_time"] ??
                                    "Example Close Time",
                              ),
                            ],
                          ),
                          //pass array of working day here
                          ViewWorkingDaysByChips(
                            workingDays: model
                                    .barbershopProfileForBarber?["open_days"] ??
                                ["Eg", "Eg", "Eg", "Eg"],
                          ),
                          const SizedBox(height: 20),
                          //if you want to pass the array of service just add a constructor to this class
                          //or connect the viewModel With it
                          BarbershopViewListOfServices(
                            title: "Services",
                            services: model.barbershopProfileForBarber?[
                                    "servicesNames"] ??
                                [],
                            readOnly: true,
                          ),
                          const SizedBox(height: 30),

                          // here will pass a function to logout from the current user
                          LogoutCustomButton(logoutFromAppCallBack: () async {
                            await model.logout();
                            Navigator.popAndPushNamed(context, LoginViewRoute);
                          }),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
