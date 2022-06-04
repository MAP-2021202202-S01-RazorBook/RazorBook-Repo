import 'package:flutter/material.dart';
import 'package:razor_book/views/customer_screens/customer_book_checkout/step_progress_view.dart';

import '../../../helpers/colors.dart';
import '../../common_widgets/pages_appbar.dart';
import 'book_services_view.dart';
import 'bookings_slots_list.dart';

class BookNow extends StatefulWidget {
  const BookNow({Key? key}) : super(key: key);

  @override
  State<BookNow> createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  final List<String> titles = ["Bookings", "Services", "Checkout"];
  int _curStep = 2;

  AppBar appbarWidget() {
    return appBar(
      bartitle: const Text(
        "Book Now ",
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
      leadingW: const BackButton(
        color: Helper.kTitleTextColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: StepProgressView(
                    width: MediaQuery.of(context).size.width,
                    curStep: _curStep,
                    color: Color(0xff50AC02),
                    titles: titles),
              ),
              Expanded(
                child: PageView(
                  onPageChanged: (i) {
                    setState(() {
                      _curStep = i + 1;
                    });
                  },
                  children: <Widget>[
                    BookingsSlotsList(),
                    BookServices(),
                    Container(
                      color: Colors.amber,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
