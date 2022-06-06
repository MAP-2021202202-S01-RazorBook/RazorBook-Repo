// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:razorbook_barber/helpers/assets.dart';
import 'package:razorbook_barber/helpers/colors.dart';

class ProfileEditView extends StatelessWidget {
  final bool editMode = true;
  const ProfileEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // _customerProfileModel =
    //     Provider.of<AuthViewModelProvider>(context, listen: true).cusProfile;

    // if (_customerProfileModel == null) {
    //   CustomerDatabaseManager().getCustomerProfile(uid!);
    // }
    // if (_customerProfileModel != null) {
    //   _emailController.text = _customerProfileModel!.email;
    //   _nameController.text = _customerProfileModel!.name;
    //   _phoneController.text = _customerProfileModel!.contactNumber;
    //   _addressController.text = _customerProfileModel!.address;
    // }
    final TextEditingController emailController =
        TextEditingController(text: "abc@gmail.com");
    final TextEditingController nameController = TextEditingController(text:"amit");
    final TextEditingController phoneController = TextEditingController(text:"123213213");
    final TextEditingController addressController = TextEditingController(text:"somehwere");

    return Scaffold(
      body: SafeArea(
        child: Builder(builder: (context) {
          return SingleChildScrollView(
            // ignore: sized_box_for_whitespace
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  ProfileViewAppBar(
                    editMode: editMode,
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
                              onTap: () {},
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
                  TextFieldTitle(text: "Name"),
                  ProfileFormTextField(
                    controller: nameController,
                    editMode: !editMode,
                    hintText: "Name",
                    initValue: "amit3",
                    onChange: (v) => print,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFieldTitle(text: "Email"),
                  ProfileFormTextField(
                    controller: emailController,
                    editMode: !editMode,
                    hintText: "Email",
                    initValue: "amit3@gmail.com",
                    onChange: (v) => print,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFieldTitle(text: "Mobile No"),
                  ProfileFormTextField(
                    controller: phoneController,
                    editMode: !editMode,
                    hintText: "Mobile No",
                    initValue: "123231123213",
                    onChange: (v) => print,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFieldTitle(text: "Address"),
                  ProfileFormTextField(
                    controller: addressController,
                    editMode: !editMode,
                    hintText: "Address",
                    initValue: "Somewhere",
                    onChange: (v) => print,
                  ),
                  Spacer(),
                  UpdateProfileButton(
                    onCanclePressed: () {
                      Navigator.pop(context);
                      // setState(() {

                      // });
                    },
                    onSavePressed: () {},
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
    // return FutureBuilder(
    //     future: Future.delayed(Duration(milliseconds: 100), () {
    //       return _customerProfileModel;
    //     }),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState != ConnectionState.done) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }

    //     });
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

class ProfileFormTextField extends StatelessWidget {
  final Function(String) onChange;
  final String hintText;
  final String initValue;
  final String Function(String?)? validator;
  final bool readOnly;
  final bool isPassword;
  final bool editMode;
  final TextEditingController controller;
  const ProfileFormTextField({
    Key? key,
    required this.controller,
    required this.onChange,
    required this.hintText,
    this.initValue = "",
    this.validator,
    this.readOnly = false,
    this.isPassword = false,
    this.editMode = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool obsecureText = readOnly;
    return StatefulBuilder(builder: (context, setState) {
      return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
          child: SizedBox(
            height: 48,
            child: TextFormField(
              controller: controller,
              readOnly: editMode,
              obscureText: obsecureText,
              validator: validator,
              textAlign: TextAlign.start,
              cursorColor: Colors.black,
              style: TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 14,
                color: const Color(0xff4a4b4d),
                fontWeight: FontWeight.w500,
              ),

              // controller: TextEditingController(),
              // initialValue: initValue.isNotEmpty ? initValue : null,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 30),
                hintStyle: const TextStyle(color: Colors.black),
                hintText: hintText.isEmpty ? null : hintText,
                suffixIcon: isPassword
                    ? IconButton(
                        color: Colors.white.withOpacity(0.5),
                        icon: obsecureText
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                        onPressed: () {
                          setState(() {
                            obsecureText = !obsecureText;
                          });
                        },
                      )
                    : null,

                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                fillColor: Helper.kTextFieldColor,
                filled: true,

                errorStyle: const TextStyle(fontSize: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),

                // hintText: hintText,
              ),
              onChanged: onChange,
            ),
          ),
        ),
      );
    });
  }
}

class UpdateProfileButton extends StatelessWidget {
  final Function onCanclePressed;
  final Function onSavePressed;
  const UpdateProfileButton(
      {Key? key, required this.onCanclePressed, required this.onSavePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Helper.kFABColor,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 56)),
              onPressed: () {
                onCanclePressed();
              },
              child: Text(
                'Cancle',
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Colors.red,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 56)),
              onPressed: () {
                onSavePressed();
                // CustomerDatabaseManager().updateProfile();
              },
              child: Text(
                'Save',
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              )),
        ],
      ),
    );
  }
}
