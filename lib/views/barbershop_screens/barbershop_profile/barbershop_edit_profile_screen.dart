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

  @override
  Widget build(BuildContext context) {
    /* Notes */
    // in the hintText for a better UX you may pass it's values by the viewModl
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
                    height: 8,
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  // const ProfileViewOpenTime(),

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
