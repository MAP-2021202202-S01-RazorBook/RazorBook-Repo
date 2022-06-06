import 'package:flutter/material.dart';
import 'package:razorbook_barber/view/widgets/profile_view_address.dart';
import 'package:razorbook_barber/view/widgets/profile_view_appbar.dart';
import 'package:razorbook_barber/view/widgets/profile_view_avator.dart';
import 'package:razorbook_barber/view/widgets/profile_view_info_text.dart';
import 'package:razorbook_barber/view/widgets/profile_view_logout_button.dart';
import 'package:razorbook_barber/view/widgets/profile_view_open_time.dart';
import 'package:razorbook_barber/view/widgets/profile_view_services.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Column(
                children: const [
                  ProfileViewAppBar(editMode: false),
                  ProfileViewAvator(
                    editMode: false,
                  ),
                  SizedBox(height: 40),
                  ProfileViewInfoText(
                    text: "Name",
                    data: "Amit Hasan Sadhin",
                  ),
                  SizedBox(height: 40),
                  ProfileViewInfoText(
                    text: "Shop Email",
                    data: "amithasan7866@email.com",
                  ),
                  SizedBox(height: 40),
                  ProfileViewInfoText(
                    text: "Shop Contact No",
                    data: "+601162325010",
                  ),
                  SizedBox(height: 40),
                  ProfileViewShopAddress(),
                  SizedBox(height: 40),
                  ProfileViewOpenTime(
                    readOnly: true,
                  ),
                  SizedBox(height: 40),
                  ProfielViewService(
                    text: "Services",
                    readOnly: true,
                  ),
                  SizedBox(height: 40),
                  ProfileViewLogoutButton(),
                  SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
