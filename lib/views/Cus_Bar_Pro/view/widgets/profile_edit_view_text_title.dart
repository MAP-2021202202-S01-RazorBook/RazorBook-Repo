import 'package:flutter/material.dart';

class ProfileEditViewTextFieldTitle extends StatelessWidget {
  const ProfileEditViewTextFieldTitle({Key? key, required this.text})
      : super(key: key);
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
