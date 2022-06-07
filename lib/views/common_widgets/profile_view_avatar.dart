import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:razor_book/helpers/assets.dart';
import 'package:razor_book/helpers/colors.dart';

import '../barbershop_screens/barbershop_profile/barbershop_edit_profile_screen.dart';

class ProfileViewAvator extends StatelessWidget {
  final bool editMode;
  final VoidCallback onTapMethod;
  const ProfileViewAvator(
      {Key? key, required this.editMode, required this.onTapMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 52,
              backgroundColor: Helper.kFABColor.withOpacity(0.4),
              backgroundImage: AssetImage(AssetHelper.assetProfilePic),
            ),
          ],
        ),
        if (!editMode)
          Positioned(
              top: 3,
              right: 10,
              child: InkWell(
                  customBorder: const CircleBorder(),
                  //to add edit page later
                  onTap: onTapMethod,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Helper.kFABColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 17,
                      color: Colors.white,
                    ),
                  ))),
        if (editMode)
          Positioned(
              bottom: 3,
              left: 0,
              right: 0,
              child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () async {
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                  },
                  child: const Icon(
                    Icons.camera_alt,
                    size: 17,
                    color: Helper.kButtonColor,
                  ))),
      ],
    );
  }
}
