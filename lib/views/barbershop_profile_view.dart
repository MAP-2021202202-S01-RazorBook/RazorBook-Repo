import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'widgets/profile_photo_widget.dart';

class BarberShopProfileView extends StatefulWidget {
  const BarberShopProfileView({Key? key}) : super(key: key);

  @override
  State<BarberShopProfileView> createState() => _BarberShopProfileViewState();
}

class _BarberShopProfileViewState extends State<BarberShopProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(),
        elevation: 0,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfilePhotoWidget(
            imagePath: "",
            onClicked: () {},
          ),
          const SizedBox(height: 8,),
          Padding(padding: const EdgeInsets.only(right: 10, left: 10),
          child: const Text("fdsfds"),
          )
        ],
      ),
    );
  }
}
