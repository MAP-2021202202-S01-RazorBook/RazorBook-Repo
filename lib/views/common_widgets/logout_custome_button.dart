import 'package:flutter/material.dart';
import '../../helpers/colors.dart';

class LogoutCustomButton extends StatelessWidget {
  const LogoutCustomButton({Key? key, required this.logoutFromAppCallBack})
      : super(key: key);

  final VoidCallback logoutFromAppCallBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 8),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              primary: Helper.kFABColor,
              fixedSize: Size(MediaQuery.of(context).size.width, 56)),
          onPressed: logoutFromAppCallBack,
          child: const Text(
            'Logout',
            style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: 16,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
            softWrap: false,
          )),
    );
  }
}
