import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/helpers/assets.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/models/customerUserSide/customer_profile_model.dart';

class InfoFormTextField extends StatelessWidget {
  final Function(String) onChange;
  final String hintText;
  final String initValue;
  final String Function(String?)? validator;
  final bool readOnly;
  final bool isPassword;
  final bool editMode;
  final TextEditingController controller;
  const InfoFormTextField({
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
              style: TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 14,
                color: const Color(0xff4a4b4d),
                fontWeight: FontWeight.w500,
              ),

              // controller: TextEditingController(),
              // initialValue: initValue.isNotEmpty ? initValue : null,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 30),
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
                  borderSide: BorderSide(
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
