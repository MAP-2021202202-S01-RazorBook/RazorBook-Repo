import 'package:flutter/material.dart';
import 'package:razorbook_barber/helpers/style.dart';
import 'package:razorbook_barber/view/widgets/profile_view_info_text.dart';

class ProfileViewShopAddress extends StatelessWidget {
  const ProfileViewShopAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shop Address",
                style: kProfileInfoTextBold,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "No.1, Jalan Sri Putra 1, Taman Sri Putra, 81200 Johor Bahru, Johor",
                      style: kProfileInfoText14,
                    ),
                  ),
                  IconButton(
                      color: Colors.blue,
                      onPressed: () {},
                      icon: const Icon(Icons.map))
                ],
              ),
            ],
          ),
        ));
  }
}
