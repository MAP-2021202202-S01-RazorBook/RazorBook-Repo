import 'package:flutter/material.dart';

class ProfileEditViewTextFieldTitle extends StatelessWidget {
  const ProfileEditViewTextFieldTitle({Key? key, required this.label})
      : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52.0),
          child: Text(label,
              style: const TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 14,
                color: Color(0xff4a4b4d),
                fontWeight: FontWeight.bold,
              )),
        ));
  }
}
