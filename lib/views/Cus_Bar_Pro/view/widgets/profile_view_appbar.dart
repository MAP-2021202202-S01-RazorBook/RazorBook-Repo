import 'package:flutter/material.dart';
import 'package:razorbook_barber/helpers/colors.dart';

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
          if (editMode)
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xff4a4b4d),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          Text(
            editMode ? "Edit Profile" : "Profile",
            style: const TextStyle(
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
