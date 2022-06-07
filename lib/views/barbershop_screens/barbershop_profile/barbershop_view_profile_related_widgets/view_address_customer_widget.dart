import 'package:flutter/material.dart';
import 'package:razor_book/helpers/styles.dart';

class ProfileViewBarbershopAddress extends StatelessWidget {
  const ProfileViewBarbershopAddress(
      {Key? key,
      required this.barberShopWrittenAddress,
      required this.openLocationOnMap})
      : super(key: key);

  final String barberShopWrittenAddress;
  final VoidCallback openLocationOnMap;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shop Address",
                style: kProfileInfoTextBold,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      barberShopWrittenAddress,
                      // "No.1, Jalan Sri Putra 1, Taman Sri Putra, 81200 Johor Bahru, Johor",
                      style: kProfileInfoText14,
                    ),
                  ),
                  IconButton(
                      color: Colors.blue,
                      //later we will work on open location on map
                      onPressed: openLocationOnMap,
                      icon: const Icon(Icons.map))
                ],
              ),
            ],
          ),
        ));
  }
}
