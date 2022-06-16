import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:razor_book/helpers/assets.dart';
import 'package:razor_book/helpers/colors.dart';

import '../barbershop_screens/barbershop_profile/barbershop_edit_profile_screen.dart';

class ProfileViewAvator extends StatelessWidget {
  final bool editMode;
  final fileUploadFunction;
  final imageUrl;
  final setImageUrl;
  final bool isCircle;
  const ProfileViewAvator(
      {Key? key,
      required this.editMode,
      required this.fileUploadFunction,
      this.imageUrl,
      this.isCircle = true,
      this.setImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            () {
              if (!isCircle) {
                return CircleAvatar(
                    radius: 52,
                    backgroundColor: Helper.kFABColor.withOpacity(0.4),
                    backgroundImage: NetworkImage(imageUrl));
              } else {
                return Container(
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imageUrl), fit: BoxFit.cover)));
              }
            }(),
          ],
        ),
        if (!editMode)
          Positioned(
              top: 3,
              right: 10,
              child: InkWell(
                  customBorder: const CircleBorder(),
                  //to add edit page later
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BarbershopEditProfile()));

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
                    final XFile? _image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (_image != null) {
                      await fileUploadFunction(_image.path, _image.name);
                      print("uploaded");
                    }
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
