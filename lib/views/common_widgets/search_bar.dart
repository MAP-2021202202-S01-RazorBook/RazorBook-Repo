import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/models/user.dart';
import 'package:razor_book/view_model/barber_profile_view_model.dart';
import 'package:razor_book/views/customer_screens/chome_page/shop_search_result_page.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BarberProfileViewModel model = context.watch<BarberProfileViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: SizedBox(
        height: 48,
        child: TextFormField(
          onFieldSubmitted: (v) {
            print(v);

            if (v.isNotEmpty) {
              List<User>? shopList = model.searchShopList(v);
              log("shopList ==> $shopList");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopSearchResult(
                    shopList: shopList!,
                  ),
                ),
              );
            }
          },
          textAlignVertical: TextAlignVertical.center,
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search Barbar",
            hintStyle:
                TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 13),
            alignLabelWithHint: true,
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xff7C7D7E),
            ),
            fillColor: Helper.kSearchBoxColor,
            filled: true,
            // suffixIcon: const Icon(Icons.filter_list),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(
                color: Helper.kSearchBoxColor,
                width: 0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(
                color: Helper.kSearchBoxColor,
                width: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
