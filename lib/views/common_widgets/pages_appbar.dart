import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget bartitle;
  final VoidCallback onPressedFunctionForRightAction;
  final Widget appBarRightIcon;
  final Widget? leadingW;
  const CustomAppBar(
      {Key? key,
      required this.bartitle,
      required this.onPressedFunctionForRightAction,
      required this.appBarRightIcon,
      this.leadingW})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: bartitle,
      actions: [
        IconButton(
            onPressed: onPressedFunctionForRightAction, icon: appBarRightIcon),
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: leadingW,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
