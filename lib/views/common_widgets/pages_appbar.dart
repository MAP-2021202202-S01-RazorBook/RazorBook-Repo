import 'package:flutter/material.dart';

AppBar appBar(
    {required Text bartitle,
    required VoidCallback onPressedFunction,
    required Icon appBarRightIcon,
    Widget? leadingW}) {
  return AppBar(
    title: bartitle,
    actions: [
      IconButton(onPressed: onPressedFunction, icon: appBarRightIcon),
    ],
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: leadingW,
  );
}
