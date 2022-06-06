import 'package:flutter/material.dart';

import '../../helpers/colors.dart';

class ProfileEditViewTextField extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  const ProfileEditViewTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
          child: SizedBox(
            height: 48,
            child: TextFormField(
              keyboardType: inputType,
              onChanged: (value) {
                controller.text = value;
              },
              controller: controller,
              textAlign: TextAlign.start,
              cursorColor: Colors.black,
              style: const TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 14,
                color: Color(0xff4a4b4d),
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 30),
                hintStyle: const TextStyle(color: Colors.black),
                hintText: hintText,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                fillColor: Helper.kTextFieldColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
