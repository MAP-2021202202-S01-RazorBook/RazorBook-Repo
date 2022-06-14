import 'package:flutter/material.dart';
import 'package:razor_book/helpers/assets.dart';

import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/models/user.dart';

import 'shop_detail_page.dart';

class ShopListItem extends StatelessWidget {
  const ShopListItem({
    Key? key,
    required this.bbsProfile,
  }) : super(key: key);
  //this one should be replaced with the User Model we have
  // we should change its type from BarberShopProfilePageModel to User
  final Map<String, dynamic>? bbsProfile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //once the card is clicked open a new page that contains the shop's details
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => BarberhopDetailView(
                    barbershop_id: bbsProfile!['u_id'],
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 160,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetHelper.assetBarbarShopOne),
                      fit: BoxFit.cover),
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 21.0, top: 8, bottom: 8),
                child: Text(
                  bbsProfile!['name'],
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
                      bbsProfile!['rating']!=null && bbsProfile!['rating']!=0?    
                      Text(
                        "${bbsProfile!['rating']}",
                        style: const TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 11,
                          color: Color(0xff29ac7b),
                          height: 1.8181818181818181,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        softWrap: false,
                      ) :
                      Text(
                        "",
                        style: const TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 11,
                          color: Color(0xff29ac7b),
                          height: 1.8181818181818181,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        softWrap: false,
                      )
                      ,
                       bbsProfile!['rating']!=null && bbsProfile!['rating']!=0?
                       Text(
                         " (${bbsProfile!['ratings_counter']} ratings)",
                        style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 12,
                          color: Color(0xffb6b7b7),
                          height: 1.6666666666666667,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ) : Text(
                         " (no ratings yet)",
                        style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 12,
                          color: Color(0xffb6b7b7),
                          height: 1.6666666666666667,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
