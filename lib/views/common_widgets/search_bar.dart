import 'package:flutter/material.dart';
import 'package:razor_book/helpers/assets.dart';
import 'package:razor_book/helpers/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: SizedBox(
        height: 48,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
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