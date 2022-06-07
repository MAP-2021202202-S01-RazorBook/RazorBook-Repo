import 'package:flutter/material.dart';

AppBar appBar(
    {Text? bartitle,
   required VoidCallback onPressedFunctionForRightAction,
    required Icon appBarRightIcon,
    Widget? leadingW}) {
  return AppBar(
    title: bartitle,
    actions: [
      IconButton(onPressed: onPressedFunctionForRightAction, icon: appBarRightIcon),
    ],
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: leadingW,
  );
}
