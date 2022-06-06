// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:razorbook_barber/helpers/assets.dart';
import 'package:razorbook_barber/helpers/colors.dart';
import 'package:razorbook_barber/view/customer_edit_profile_view.dart'
    show ProfileEditView;
import 'package:razorbook_barber/view/widgets/profile_widgets.dart';

class CustomerProfileView extends StatelessWidget {
  final bool editMode = false;
  const CustomerProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController =
        TextEditingController(text: "abc@gmail.com");
    final TextEditingController nameController =
        TextEditingController(text: "amit");
    final TextEditingController phoneController =
        TextEditingController(text: "123213213");
    final TextEditingController addressController =
        TextEditingController(text: "somehwere");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (
        context,
      ) {
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileEditView(),
                                ),
                              );
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Helper.kFABColor,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 56)),
                      onPressed: () async {},
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
      }),
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
