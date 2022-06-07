import 'package:flutter/material.dart';
import 'package:razor_book/helpers/styles.dart';

class ProfileViewInfoText extends StatelessWidget {
  const ProfileViewInfoText(
      {Key? key, required this.label, required this.userDate})
      : super(key: key);
  final String label;
  final String userDate;
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
                label,
                style: kProfileInfoTextBold,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                userDate,
                style: kProfileInfoText14,
              ),
            ],
          ),
        ));
  }
}
