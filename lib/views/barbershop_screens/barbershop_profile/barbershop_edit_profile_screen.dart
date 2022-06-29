import 'package:flutter/material.dart';
import 'package:razor_book/router-constants.dart';

import '../../../helpers/colors.dart';
import '../../../helpers/helper_widgets.dart';
import '../../../view_model/barber_profile_view_model.dart';
import '../../common_widgets/pages_appbar.dart';
import '../../common_widgets/profile_edit_custome_textfield.dart';
import '../../common_widgets/profile_view_avatar.dart';
import '../../common_widgets/text_fields_labels_for_edit_profiles.dart';
import '../maps/google_map_screen.dart';
import 'barbershop_view_profile_related_widgets/barbershop_services_display_view.dart';
import 'barbershop_view_profile_related_widgets/profile_cancel_save_buttons.dart';
import 'package:provider/provider.dart';
// import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:place_picker/place_picker.dart';

class BarbershopEditProfile extends StatefulWidget {
  const BarbershopEditProfile({Key? key}) : super(key: key);

  @override
  State<BarbershopEditProfile> createState() => _BarbershopEditProfileState();
}

class _BarbershopEditProfileState extends State<BarbershopEditProfile> {
  final _nameTextFiledController = TextEditingController();
  final _addressTextFiledController = TextEditingController();
  final _descriptionTextFiledController = TextEditingController();

  final _emailTextFiledController = TextEditingController();
  final _phoneTextFiledController = TextEditingController();
  final _slotLengthTextFiledController = TextEditingController();

  final _openTimeTextFiledController = TextEditingController();
  final _closeTimeTextFiledController = TextEditingController();

  final _locationLatTextFiledController = TextEditingController();
  final _locationLngTextFiledController = TextEditingController();
  String? _imageUrl;

  final List<Map> workingDaysToSelect = [
    {'day': 'SUN', 'isSelected': false},
    {'day': 'MON', 'isSelected': false},
    {'day': 'TUE', 'isSelected': false},
    {'day': 'WED', 'isSelected': false},
    {'day': 'THU', 'isSelected': false},
    {'day': 'FRI', 'isSelected': false},
    {'day': 'SAT', 'isSelected': false},
  ];
  //this list must be in the user model that will be submitted to the firebase,
  // so what ever he selects from the chips , it's stored here.
  //it will be submitted onSavePressed button at the end.
  //also when connecting it to viewModel list which contains working days
  //all varabiles used in the Scrollbar listView will be replaced with if
  //for instance model.workingday.add("");
  //check comment in the listview line -196-
  // List<dynamic> barberShopWorkingDays = [];

  @override
  Widget build(BuildContext context) {
    BarberProfileViewModel model = context.watch<BarberProfileViewModel>();
    /* Notes */
    // in the hintText for a better UX you may pass its values by the viewModel
    //those values can be the real values of the model we have
    //e.g: insteadof hintText: "Hamzeh Wahed Bajbouj",
    /// can be : model.userModel.name

    return FutureBuilder(
        future: model.getBarbershopDetailsForBarber(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print("reruns");

            print(model.barberWorkingDays);
            return Scaffold(
              appBar: appBar(
                bartitle: const Text(
                  "Edit Profile",
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
              body: SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          // const ProfileViewAppBar(editMode: true),
                          ProfileViewAvator(
                              editMode: true,
                              fileUploadFunction: model.uploadFile,
                              imageUrl:
                                  model.barbershopProfileForBarber?['image']),
                          const SizedBox(
                            height: 32,
                          ),
                          const ProfileEditViewTextFieldTitle(label: "Name"),
                          ProfileEditViewTextField(
                            inputType: TextInputType.text,
                            hintText:
                                model.barbershopProfileForBarber?["name"] ??
                                    "Example Name",
                            controller: _nameTextFiledController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          const ProfileEditViewTextFieldTitle(label: "Email"),
                          ProfileEditViewTextField(
                            inputType: TextInputType.text,
                            hintText:
                                model.barbershopProfileForBarber?["email"] ??
                                    "Example Email",
                            controller: _emailTextFiledController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const ProfileEditViewTextFieldTitle(label: "Address"),
                          ProfileEditViewTextField(
                            inputType: TextInputType.text,
                            hintText:
                                model.barbershopProfileForBarber?["address"] ??
                                    "Example Address",
                            controller: _addressTextFiledController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          //this part is related to google maps
                          const SizedBox(
                            height: 8,
                          ),

                          const SizedBox(
                            height: 8,
                          ),
                          const ProfileEditViewTextFieldTitle(
                              label: "Description"),
                          ProfileEditViewTextField(
                            inputType: TextInputType.text,
                            hintText: model.barbershopProfileForBarber?[
                                    "description"] ??
                                "Example Description",
                            controller: _descriptionTextFiledController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          const ProfileEditViewTextFieldTitle(label: "Phone"),
                          ProfileEditViewTextField(
                            inputType: TextInputType.phone,
                            hintText:
                                model.barbershopProfileForBarber?["phone"] ??
                                    "Example Phone",
                            controller: _phoneTextFiledController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          const ProfileEditViewTextFieldTitle(
                              label: "Slot's Length"),
                          ProfileEditViewTextField(
                            inputType: TextInputType.number,
                            hintText: model
                                    .barbershopProfileForBarber?["slot_length"]
                                    .toString() ??
                                "0.5",
                            controller: _slotLengthTextFiledController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          const ProfileEditViewTextFieldTitle(
                              label: "Open Time"),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: pickTimeInBarberShopProfile(
                                context: context,
                                hintText: model.barbershopProfileForBarber?[
                                        "open_time"] ??
                                    "Edit Open Time",
                                timeInputController:
                                    _openTimeTextFiledController),
                          ),

                          const SizedBox(
                            height: 8,
                          ),

                          const ProfileEditViewTextFieldTitle(
                              label: "Close Time"),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: pickTimeInBarberShopProfile(
                                context: context,
                                hintText: model.barbershopProfileForBarber?[
                                        "close_time"] ??
                                    "Edit Close Time",
                                timeInputController:
                                    _closeTimeTextFiledController),
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          const ProfileEditViewTextFieldTitle(
                              label: "Edit Working Days"),
                          const SizedBox(
                            height: 14,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 52.0),
                            child: Container(
                              width: double.maxFinite,
                              height: 50,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: workingDaysToSelect.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FilterChip(
                                        // selected if it's among the working days
                                        selected: model.barberWorkingDays
                                            .contains(workingDaysToSelect[index]
                                                ["day"]),
                                        label: Text(
                                            workingDaysToSelect[index]['day']),
                                        onSelected: (bool value) {
                                          setState(() {
                                            if (value) {
                                              // barberShopWorkingDays[ workingDaysToSelect[index]
                                              //         ['day']]
                                              //     ['isSelected'] = true;
                                              //note: here where you should replace it
                                              //with the once in the viewModel

                                              print("Add");
                                              var day =
                                                  workingDaysToSelect[index]
                                                      ['day'];

                                              print("day is $day");
                                              var res = model.barberWorkingDays
                                                  .add(day);
                                            } else {
                                              // barberShopWorkingDays[index]
                                              //     ['isSelected'] = false;
                                              //note: here where you should replace it
                                              //with the once in the viewModel
                                              print("remove");
                                              var day =
                                                  workingDaysToSelect[index]
                                                      ['day'];
                                              print("day is $day");
                                              var res = model.barberWorkingDays
                                                  .remove(day);
                                              print(res);
                                            }
                                          });
                                        },
                                        selectedColor:
                                            Color.fromARGB(255, 100, 144, 221),
                                        backgroundColor: Helper.kFABColor,
                                      ),
                                    );
                                  }),
                            ),
                          ),

                          const SizedBox(height: 18),
                          BarbershopViewListOfServices(
                            title: "Services",
                            services: model.barbershopProfileForBarber?[
                                    "servicesNames"] ??
                                [],
                          ),
                          const SizedBox(height: 28),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  primary: Helper.kFABColor,
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width, 30)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LocationGoogle()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.location_on_sharp,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                  Text(
                                    'Update shop location',
                                    style: TextStyle(
                                      fontFamily: 'Metropolis',
                                      fontSize: 18,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ProfileEditViewCancelSaveButtons(
                            onCanclePressed: () {
                              // clear all the data that has been stored
                              //then pop
                              _nameTextFiledController.clear();
                              _addressTextFiledController.clear();
                              _descriptionTextFiledController.clear();
                              _emailTextFiledController.clear();
                              _phoneTextFiledController.clear();
                              _slotLengthTextFiledController.clear();
                              _openTimeTextFiledController.clear();
                              _closeTimeTextFiledController.clear();
                              _locationLatTextFiledController.clear();
                              _locationLngTextFiledController.clear();

                              Navigator.of(context).pop();
                            },
                            onSavePressed: () async {
                              //here will be the part we you add the services and updated the
                              //data in the ViewModel
                              //the data are fetched from here -TextFiledController -
                              //e.g.:_openTimeTextFiledController.text

                              //here is the list where should be sent to the database.
                              //if you wanna use the one i defined here [barberShopWorkingDays]
                              //just pass it to the service method that receive list of strings which updates
                              //workingDay-if there is-, or call the  service method responseilbe for that
                              await model.updateBarberProfile({
                                "name": _nameTextFiledController.text,
                                "address": _addressTextFiledController.text,
                                "description":
                                    _descriptionTextFiledController.text,
                                "email": _emailTextFiledController.text,
                                "phone": _phoneTextFiledController.text,
                                "slot_length":
                                    _slotLengthTextFiledController.text,
                                "open_time": _openTimeTextFiledController.text,
                                "close_time":
                                    _closeTimeTextFiledController.text,
                                "open_days": model.barberWorkingDays,
                                "location": {
                                  "lat": model.barbershopProfileForBarber?[
                                      "location"]["lat"],
                                  "lng": model.barbershopProfileForBarber?[
                                      "location"]["lng"],
                                },
                                "image": model.imgUrl,
                              });

                              Navigator.pushNamed(context, BarberProfileRoute);
                            },
                          ),
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
