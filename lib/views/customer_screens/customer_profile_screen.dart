// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';

import 'package:razor_book/helpers/assets.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/models/user.dart';
import 'package:razor_book/views/home_view.dart';

import '../../view_model/customer_profile_view_model.dart';

import '../common_widgets/info_form_textfield.dart';

import '../common_widgets/save_cancel_buttons_.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomerProfileViewModel viewModel =
        context.watch<CustomerProfileViewModel>();
    AuthenticationService authService = locator<AuthenticationService>();
    // final User? user =
    //     Provider.of<LocalStorageServiceProvider>(context).userProfile;
    // _customerProfileModel =
    //     Provider.of<AuthViewModelProvider>(context, listen: true).cusProfile;

    // final CustomerProfileModel? customerProfileModel =
    //     Provider.of<LocalStorageServiceProvider>(context, listen: false)
    //         .cusProfile;
    // return ChangeNotifierProvider<CustomerProfileViewModel>(
    //     create: (_) => locator<CustomerProfileViewModel>(),
    //     child: Consumer<CustomerProfileViewModel>(
    //         builder: (context, viewModel, child) {
    //     //  () async => await viewModel
    //           .getCustomerDetails("eRiujAfrWASWbosQGToSO1wcmNz1");
    //       if (viewModel.emailController.text.isEmpty) {
    //         viewModel.emailController.text = viewModel.user.email;
    //         viewModel.nameController.text = "";
    //         viewModel.phoneController.text = viewModel.user.phone!;
    //         viewModel.addressController.text = viewModel.user.address!;
    //       }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: appBar(
        //     bartitle: Text("Profile"),
        //     onPressedFunction: () {},
        //     appBarRightIcon: Icon(
        //       Icons.shopping_cart,
        //       color: Helper.kTitleTextColor,
        //     )),
        body: Builder(
            // future: viewModel.getCustomerDetails(auth ),
            builder: (context) {
          // viewModel.getCustomerDetails("eRiujAfrWASWbosQGToSO1wcmNz1");

          // log("${viewModel.user.address} + here is the real value ${viewModel.user.name}");

          if (viewModel.emailController.text.isEmpty) {
            viewModel.emailController.text =
                authService.currentUser!.email; //read from localstorage
            viewModel.nameController.text = authService.currentUser!.name!;
            viewModel.phoneController.text = authService.currentUser!.phone!;
            viewModel.addressController.text =
                authService.currentUser!.address!;
          }
          return SingleChildScrollView(
            // ignore: sized_box_for_whitespace
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  ProfileViewAppBar(
                    editMode: viewModel.editMode,
                  ),
                  Stack(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 52,
                            backgroundColor: Helper.kFABColor.withOpacity(0.4),
                            backgroundImage:
                                AssetImage(AssetHelper.assetProfilePic),
                          ),
                        ],
                      ),
                      Positioned(
                          top: 3,
                          right: 10,
                          child: InkWell(
                              customBorder: CircleBorder(),
                              onTap: () {
                                viewModel.editMode = !viewModel.editMode;
                              },
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Helper.kFABColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  size: 17,
                                  color: Colors.white,
                                ),
                              ))),
                      Positioned(
                          bottom: 3,
                          left: 0,
                          right: 0,
                          child: InkWell(
                              customBorder: CircleBorder(),
                              onTap: () {},
                              child: Icon(
                                Icons.camera_alt,
                                size: 17,
                                color: Helper.kButtonColor,
                              ))),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  textfieldLable(Text("Name")),
                  InfoFormTextField(
                    controller: viewModel.nameController,
                    editMode: !viewModel.editMode,
                    hintText: "Name",
                    initValue: "viewModel.user.name!",
                    onChange: (v) => print,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  textfieldLable(Text("Email")),
                  InfoFormTextField(
                    controller: viewModel.emailController,
                    editMode: !viewModel.editMode,
                    hintText: "Email",
                    initValue: viewModel.user?.email ?? "",
                    onChange: (v) => print,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  textfieldLable(Text("Mobile No")),
                  InfoFormTextField(
                    controller: viewModel.phoneController,
                    editMode: !viewModel.editMode,
                    hintText: "Mobile No",
                    initValue: "viewModel.user.phone!",
                    onChange: (v) => print,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  textfieldLable(Text("Address")),
                  InfoFormTextField(
                    controller: viewModel.addressController,
                    editMode: !viewModel.editMode,
                    hintText: "Address",
                    initValue: "",
                    onChange: (v) => print,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  viewModel.editMode
                      ? SaveCancelButtons(
                          onCanclePressed: () {
                            viewModel.editMode = viewModel.editMode;
                            // setState(() {

                            // });
                          },
                          onSavePressed: () async {
                            viewModel.editMode = false;
                            User newuser = User(
                                u_id: authService.currentUser!.u_id,
                                name: viewModel.nameController.text,
                                email: viewModel.emailController.text,
                                phone: viewModel.phoneController.text,
                                address: viewModel.addressController.text,
                                user_type: authService.currentUser!.user_type);

                            await viewModel.updateUserProfile(newuser, context);
                          },
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 21, vertical: 8),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  primary: Helper.kFABColor,
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width, 56)),
                              onPressed: () async {
                                await locator<AuthenticationService>()
                                    .signOut()
                                    .then((value) => Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (ctx) => Home())));
                              },
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                  fontFamily: 'Metropolis',
                                  fontSize: 16,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                                softWrap: false,
                              )),
                        )
                ],
              ),
            ),
          );
        }));
  }

//this
  Align textfieldLable(Text text) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52.0),
          child: text,
        ));
  }
}

class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52.0),
          child: Text(text),
        ));
  }
}

class ProfileViewAppBar extends StatelessWidget {
  final bool editMode;
  const ProfileViewAppBar({
    Key? key,
    required this.editMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            editMode ? "Edit Profile" : "Profile",
            style: TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Helper.kTitleTextColor),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Helper.kTitleTextColor,
              )),
        ],
      ),
    );
  }
}
