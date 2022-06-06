import 'package:flutter/material.dart';
import 'package:razorbook_barber/helpers/colors.dart';

class ProfileEditViewTextField extends StatelessWidget {
  final Function(String) onChange;
  final String hintText;
  final String initValue;
  final String Function(String?)? validator;
  final bool readOnly;
  final bool isPassword;
  final bool editMode;
  final TextEditingController controller;
  const ProfileEditViewTextField({
    Key? key,
    required this.controller,
    required this.onChange,
    required this.hintText,
    this.initValue = "",
    this.validator,
    this.readOnly = false,
    this.isPassword = false,
    this.editMode = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool obsecureText = readOnly;
    return StatefulBuilder(builder: (context, setState) {
      return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
          child: SizedBox(
            height: 48,
            child: TextFormField(
              controller: controller,
              readOnly: editMode,
              obscureText: obsecureText,
              validator: validator,
              textAlign: TextAlign.start,
              cursorColor: Colors.black,
              style: const TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 14,
                color: Color(0xff4a4b4d),
                fontWeight: FontWeight.w500,
              ),

              // controller: TextEditingController(),
              // initialValue: initValue.isNotEmpty ? initValue : null,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 30),
                hintStyle: const TextStyle(color: Colors.black),
                hintText: hintText.isEmpty ? null : hintText,
                suffixIcon: isPassword
                    ? IconButton(
                        color: Colors.white.withOpacity(0.5),
                        icon: obsecureText
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                        onPressed: () {
                          setState(() {
                            obsecureText = !obsecureText;
                          });
                        },
                      )
                    : null,

                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                fillColor: Helper.kTextFieldColor,
                filled: true,

                errorStyle: const TextStyle(fontSize: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),

                // hintText: hintText,
              ),
              onChanged: onChange,
            ),
          ),
        ),
      );
    });
  }
}
