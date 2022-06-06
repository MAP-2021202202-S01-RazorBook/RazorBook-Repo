import 'package:flutter/material.dart';
import 'package:razorbook_barber/view/widgets/profile_edit_view_text_title.dart';
import 'package:razorbook_barber/view/widgets/profile_edit_view_textfield.dart';
import 'package:razorbook_barber/view/widgets/profile_edit_view_update_button.dart';
import 'package:razorbook_barber/view/widgets/profile_view_appbar.dart';
import 'package:razorbook_barber/view/widgets/profile_view_avator.dart';
import 'package:razorbook_barber/view/widgets/profile_view_open_time.dart';
import 'package:razorbook_barber/view/widgets/profile_view_services.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Column(
                children: [
                  const ProfileViewAppBar(editMode: true),
                  const ProfileViewAvator(
                    editMode: true,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const ProfileEditViewTextFieldTitle(text: "Name"),
                  ProfileEditViewTextField(
                      controller: TextEditingController(),
                      onChange: (v) => print,
                      hintText: "Amit Hasan Sadhin"),
                  const SizedBox(
                    height: 8,
                  ),
                  const ProfileEditViewTextFieldTitle(text: "Email"),
                  ProfileEditViewTextField(
                      controller: TextEditingController(),
                      onChange: (v) => print,
                      hintText: "amithasan7866@email.com"),
                  const SizedBox(
                    height: 8,
                  ),
                  const ProfileEditViewTextFieldTitle(text: "Shop Contact No"),
                  ProfileEditViewTextField(
                      controller: TextEditingController(),
                      onChange: (v) => print,
                      hintText: "+601126232510"),
                  const ProfileEditViewTextFieldTitle(text: "Shop Addresss"),
                  ProfileEditViewTextField(
                      controller: TextEditingController(),
                      onChange: (v) => print,
                      hintText:
                          "No.1, Jalan Sri Putra 1, Taman Sri Putra, 81200 Johor Bahru, Johor"),
                  const SizedBox(
                    height: 40,
                  ),
                  const ProfileViewOpenTime(),
                  const SizedBox(height: 18),
                  const ProfielViewService(
                    text: "Services",
                  ),
                  const SizedBox(height: 40),
                  ProfileEditViewUpdateButton(
                    onCanclePressed: () {},
                    onSavePressed: () {},
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
