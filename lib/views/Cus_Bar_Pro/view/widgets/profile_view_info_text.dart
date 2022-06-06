import 'package:flutter/material.dart';
import 'package:razorbook_barber/helpers/style.dart';

class ProfileViewInfoText extends StatelessWidget {
  const ProfileViewInfoText({Key? key, required this.text, required this.data})
      : super(key: key);
  final String text;
  final String data;
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
                text,
                style: kProfileInfoTextBold,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                data,
                style: kProfileInfoText14,
              ),
            ],
          ),
        ));
  }
}
