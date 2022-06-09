import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/helpers/assets.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/models/customerUserSide/customer_profile_model.dart';

class SaveCancelButtons extends StatelessWidget {
  final Function onCanclePressed;
  final Function onSavePressed;
  const SaveCancelButtons(
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
                  shape: StadiumBorder(),
                  primary: Helper.kFABColor,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 56)),
              onPressed: () {
                onCanclePressed();
              },
              child: Text(
                'Cancle',
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Colors.red,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 56)),
              onPressed: () {
                onSavePressed();
              
              },
              child: Text(
                'Save',
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 16,
                  color: const Color(0xffffffff),
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
