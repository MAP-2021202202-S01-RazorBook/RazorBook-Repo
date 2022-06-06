import 'package:flutter/material.dart';
import '../../../../helpers/colors.dart';

class ProfileEditViewCancelSaveButtons extends StatelessWidget {
  final Function onCanclePressed;
  final Function onSavePressed;
  const ProfileEditViewCancelSaveButtons(
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
                'Cancel',
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
