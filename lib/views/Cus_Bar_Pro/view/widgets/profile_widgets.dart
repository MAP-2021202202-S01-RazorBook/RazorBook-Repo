import 'package:flutter/material.dart';
import 'package:razorbook_barber/helpers/colors.dart';

class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle({Key? key, required this.text}) : super(key: key);
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

class ProfileFormTextField extends StatelessWidget {
  final Function(String) onChange;
  final String hintText;
  final String initValue;
  final String Function(String?)? validator;
  final bool readOnly;
  final bool isPassword;
  final bool editMode;
  final TextEditingController controller;
  const ProfileFormTextField({
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

class UpdateProfileButton extends StatelessWidget {
  final Function onCanclePressed;
  final Function onSavePressed;
  const UpdateProfileButton(
      {Key? key, required this.onCanclePressed, required this.onSavePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  primary: Helper.kFABColor,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 56)),
              onPressed: () {
                onCanclePressed();
              },
              child: const Text(
                'Cancle',
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 16,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  primary: Colors.red,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 56)),
              onPressed: () {
                onSavePressed();
                // CustomerDatabaseManager().updateProfile();
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 16,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              )),
        ],
      ),
    );
  }
}
