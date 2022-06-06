import 'package:flutter/material.dart';
import 'package:razorbook_barber/helpers/colors.dart';

class ProfileViewLogoutButton extends StatelessWidget {
  const ProfileViewLogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 8),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              primary: Helper.kFABColor,
              fixedSize: Size(MediaQuery.of(context).size.width, 56)),
          onPressed: () async {},
          child: const Text(
            'Logout',
            style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: 16,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
            softWrap: false,
          )),
    );
  }
}
