
import 'package:flutter/material.dart';

import 'package:razor_book/helpers/assets.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/models/barberUserSide/babershop_profile_model.dart';



class ShopListItem extends StatelessWidget {
  const ShopListItem({
    Key? key,
    required this.bbsProfile,
  }) : super(key: key);

  final BarberShopProfilePageModel bbsProfile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(bbsProfile.shopeImage),
                    fit: BoxFit.cover),
              )),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 21.0, top: 8, bottom: 8),
              child: Text(
                bbsProfile.shopName,
                style: const TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 16,
                  color: Color(0xff4a4b4d),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 21.0, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.star_rate_rounded,
                        size: 24, color: Helper.kButtonColor),
                    Text(
                      bbsProfile.rating.toString(),
                      style: const TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 11,
                        color: Color(0xff29ac7b),
                        height: 1.8181818181818181,
                      ),
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    Text(
                      '(124 ratings) |  ${bbsProfile.services[0]}',
                      style: const TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 12,
                        color: Color(0xffb6b7b7),
                        height: 1.6666666666666667,
                      ),
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                      softWrap: false,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}