import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:razorbook_barber/helpers/assets.dart';
import 'package:razorbook_barber/helpers/colors.dart';
import 'package:razorbook_barber/view/profile_edit_view.dart';

class ProfileViewAvator extends StatelessWidget {
  final bool editMode;
  const ProfileViewAvator({Key? key, required this.editMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 52,
              backgroundColor: Helper.kFABColor.withOpacity(0.4),
              backgroundImage: const AssetImage(AssetHelper.assetProfilePic),
            ),
          ],
        ),
        if (!editMode)
          Positioned(
              top: 3,
              right: 10,
              child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileEditView()));

                    //go to edit page
                  },
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
