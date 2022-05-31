// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/views/customer_screens/chome_page/shop_list_view.dart';
import '../../common_widgets/pages_appbar.dart';
import '../../common_widgets/search_bar.dart';

class ShopView extends StatelessWidget {
  const ShopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        bartitle: const Text(
          "any name ",
          style: TextStyle(
            fontFamily: "MetropolisExtra",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Helper.kTitleTextColor,
          ),
        ),
        onPressedFunction: () {},
        appBarRightIcon: const Icon(
          Icons.shopping_cart,
          color: Helper.kTitleTextColor,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SearchBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Available Shops",
                    style: TextStyle(
                      fontFamily: "MetropolisExtra",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Helper.kTitleTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    // ignore: prefer_const_constructors
                    ShopList(),

                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ShopViewAppBar extends StatelessWidget {
//   const ShopViewAppBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Consumer<LocalStorageServiceProvider>(builder: (context, x, _) {
//           //   String name = x.cusProfile?.name ?? '';
//           //   return Text(
//           //     "Good morning ${name.split(' ')[0]}",
//           //     style: const TextStyle(
//           //         fontFamily: 'Metropolis',
//           //         fontSize: 20,
//           //         fontWeight: FontWeight.bold,
//           //         color: Helper.kTitleTextColor),
//           //   );
//           // }),
//           Text(
//             "Good morning  name to fetcheds",
//             style: const TextStyle(
//                 fontFamily: 'Metropolis',
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Helper.kTitleTextColor),
//           ),
//           IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.shopping_cart,
//                 color: Helper.kTitleTextColor,
//               ))
//         ],
//       ),
//     );
//   }
// }




