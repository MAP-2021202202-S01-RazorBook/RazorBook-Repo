import 'package:flutter/material.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/models/user.dart';
import 'package:razor_book/views/customer_screens/chome_page/shop_list_item.dart';

class ShopSearchResult extends StatelessWidget {
  final List<User> shopList;
  const ShopSearchResult({Key? key, required this.shopList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Total Result (${shopList.length}) ",
          style: const TextStyle(
            fontFamily: "MetropolisExtra",
            fontWeight: FontWeight.bold,
            color: Helper.kTitleTextColor,
          ),
        ),
      ),
      body: (shopList.isEmpty)
          ? const Center(
              child: Text("No Result Found"),
            )
          : ListView.builder(
              itemCount: shopList.length,
              itemBuilder: (ctx, idx) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ShopListItem(
                    bbsProfile: shopList[idx],
                  ),
                );
              }),
    );
  }
}
