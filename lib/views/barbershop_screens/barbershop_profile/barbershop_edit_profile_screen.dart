import 'package:flutter/material.dart';

import '../../../helpers/colors.dart';
import '../../common_widgets/pages_appbar.dart';
import '../../common_widgets/profile_edit_custome_textfield.dart';
import '../../common_widgets/profile_view_avatar.dart';
import '../../common_widgets/text_fields_labels_for_edit_profiles.dart';
import 'barbershop_view_profile_related_widgets/barbershop_services_display_view.dart';
import 'barbershop_view_profile_related_widgets/profile_cancel_save_buttons.dart';

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

  //keep this list no need to delete it, it's used to display list of days to select from
  // final List<String> workingDaysToSelect = [
  //   "Sunday",
  //   "Monday",
  //   "Tuesday",
  //   "Wednesday",
  //   "Thrusday",
  //   "Friday",
  //   "Saturday"
  // ];
  final List<Map> workingDaysToSelect = [
    {'day': 'Sunday', 'isSelected': false},
    {'day': 'Monday', 'isSelected': false},
    {'day': 'Tuesday', 'isSelected': false},
    {'day': 'Wednesday', 'isSelected': false},
    {'day': 'Thrusday', 'isSelected': false},
    {'day': 'Friday', 'isSelected': false},
    {'day': 'Saturday', 'isSelected': false},
  ];
  //this list must be in the user model that will be submitted to the firebase,
  // so what ever he selects from the chips , it's stored here.
  //it will be submitted onSavePressed button at the end.
  //also when connecting it to viewModel list which contains working days
  //all varabiles used in the Scrollbar listView will be replaced with if
  //for instance model.workingday.add("");
  //check comment in the listview line -178-
  final List<String> barberShopWorkingDays = [];

  @override
  Widget build(BuildContext context) {
    /* Notes */
    // in the hintText for a better UX you may pass its values by the viewModel
    //those values can be the real values of the model we have

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
                  const ProfileViewAvator(
                    editMode: true,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const ProfileEditViewTextFieldTitle(label: "Name"),
                  ProfileEditViewTextField(
                    inputType: TextInputType.text,
                    hintText: "Hamzeh Wahed Bajbouj",
                    controller: _nameTextFiledController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  const ProfileEditViewTextFieldTitle(label: "Email"),
                  ProfileEditViewTextField(
                    inputType: TextInputType.text,
                    hintText: "hamzehbouj@gamil.com",
                    controller: _emailTextFiledController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const ProfileEditViewTextFieldTitle(label: "Address"),
                  ProfileEditViewTextField(
                    inputType: TextInputType.text,
                    hintText: "Daraa, Syria",
                    controller: _addressTextFiledController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const ProfileEditViewTextFieldTitle(label: "Description"),
                  ProfileEditViewTextField(
                    inputType: TextInputType.text,
                    hintText: "this is my store of nothing",
                    controller: _descriptionTextFiledController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  const ProfileEditViewTextFieldTitle(label: "Phone"),
                  ProfileEditViewTextField(
                    inputType: TextInputType.phone,
                    hintText: "+4234323",
                    controller: _phoneTextFiledController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  const ProfileEditViewTextFieldTitle(label: "Slot's Length"),
                  ProfileEditViewTextField(
                    inputType: TextInputType.number,
                    hintText: "Either 0.5 or 1",
                    controller: _slotLengthTextFiledController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ProfileEditViewTextFieldTitle(
                      label: "Edit Working Days"),
                  const SizedBox(
                    height: 14,
                  ),

                  // Only one scroll position can be attached to the
                  // PrimaryScrollController if using Scrollbars. Providing a
                  // unique scroll controller to this scroll view prevents it
                  // from attaching to the PrimaryScrollController.
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 52.0),
                    child: Container(
                      width: double.maxFinite,
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: workingDaysToSelect.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FilterChip(
                                selected: workingDaysToSelect[index]
                                    ['isSelected'],
                                label: Text(workingDaysToSelect[index]['day']),
                                onSelected: (bool value) {
                                  setState(() {
                                    if (value) {
                                      workingDaysToSelect[index]['isSelected'] =
                                          true;
                                      //note: here where you should replace it
                                      //with the once in the viewModel
                                      barberShopWorkingDays.add(
                                          workingDaysToSelect[index]['day']);
                                    } else {
                                      workingDaysToSelect[index]['isSelected'] =
                                          false;
                                      //note: here where you should replace it
                                      //with the once in the viewModel
                                      barberShopWorkingDays.remove(
                                          workingDaysToSelect[index]['day']);
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
                  const BarbershopViewListOfServices(
                    title: "Services",
                  ),
                  const SizedBox(height: 40),
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
                      Navigator.of(context).pop();
                    },
                    onSavePressed: () {
                      //here will be the part we you add the services and updated the
                      //data in the ViewModel

                      
                      //here is the list where should be sent to the database.
                      //if you wanna use the one i defined here [barberShopWorkingDays]
                      //just pass it to the service method that receive list of strings which updates
                      //workingDay-if there is-, or call the  service method responseilbe for that
                      print(barberShopWorkingDays);
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
}
