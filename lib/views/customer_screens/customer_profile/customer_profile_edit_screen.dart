import 'package:flutter/material.dart';

import '../../../helpers/colors.dart';
import '../../../helpers/helper_widgets.dart';
import '../../barbershop_screens/barbershop_profile/barbershop_view_profile_related_widgets/profile_cancel_save_buttons.dart';
import '../../common_widgets/pages_appbar.dart';
import '../../common_widgets/profile_edit_custome_textfield.dart';
import '../../common_widgets/profile_view_avatar.dart';
import '../../common_widgets/text_fields_labels_for_edit_profiles.dart';

class CustomerEditProfile extends StatefulWidget {
  const CustomerEditProfile({Key? key}) : super(key: key);

  @override
  State<CustomerEditProfile> createState() => _CustomerEditProfileState();
}

class _CustomerEditProfileState extends State<CustomerEditProfile> {
  final _nameTextFiledController = TextEditingController();
  final _addressTextFiledController = TextEditingController();
  final _emailTextFiledController = TextEditingController();
  final _phoneTextFiledController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /* Notes */
    // in the hintText for a better UX you may pass its values by the viewModel
    //those values can be the real values of the model we have
    //e.g: insteadof hintText: "Hamzeh Wahed Bajbouj",
    /// can be : model.userModel.name

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
                    onTapMethod: () {},
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const ProfileEditViewTextFieldTitle(label: "Name"),
                  ProfileEditViewTextField(
                    inputType: TextInputType.text,
                    hintText: "Amit Hasan Sadhin",
                    controller: _nameTextFiledController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  const ProfileEditViewTextFieldTitle(label: "Email"),
                  ProfileEditViewTextField(
                    inputType: TextInputType.text,
                    hintText: "amithasan7866@email.com",
                    controller: _emailTextFiledController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  const ProfileEditViewTextFieldTitle(label: "Phone Number"),
                  ProfileEditViewTextField(
                    inputType: TextInputType.phone,
                    hintText: "+601162325010",
                    controller: _phoneTextFiledController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  const ProfileEditViewTextFieldTitle(label: "Address"),
                  ProfileEditViewTextField(
                    inputType: TextInputType.text,
                    hintText: "Melana Apartment - Skudai",
                    controller: _addressTextFiledController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const SizedBox(height: 18),

                  ProfileEditViewCancelSaveButtons(
                    onCanclePressed: () {
                      // clear all the data that has been stored
                      //then pop
                      _nameTextFiledController.clear();
                      _addressTextFiledController.clear();
                      _emailTextFiledController.clear();
                      _phoneTextFiledController.clear();

                      Navigator.of(context).pop();
                    },
                    onSavePressed: () {
                      //here will be the part we you add the services and updated the
                      //data in the ViewModel
                      //the data are fetched from here -TextFiledController -
                      //e.g.:_openTimeTextFiledController.text
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
