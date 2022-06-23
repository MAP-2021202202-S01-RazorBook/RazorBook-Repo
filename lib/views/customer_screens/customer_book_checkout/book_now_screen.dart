// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/models/user.dart';
import 'package:razor_book/view_model/bookings_view_model.dart';
import 'package:razor_book/views/common_widgets/checkout_button.dart';
import 'package:razor_book/views/customer_screens/customer_book_checkout/step_progress_view.dart';

import '../../../helpers/colors.dart';
import '../../common_widgets/pages_appbar.dart';
import 'book_services_view.dart';
import 'bookings_slots_list.dart';

class BookNow extends StatefulWidget {
  const BookNow({Key? key, required this.barbershop}) : super(key: key);

  final User barbershop;

  @override
  State<BookNow> createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  final List<String> titles = ["Bookings", "Services", "Checkout"];
  int _curStep = 2;

  // AppBar appbarWidget() {
  //   return
  // }
  @override
  void didChangeDependencies() {
    var bookingViewModel = context.watch<BookingsViewModel>();
    bookingViewModel.workingDays = bookingViewModel.getDateOfWorkingDays();
    log("${bookingViewModel.workingDays}  working days");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          bartitle: const Text(
            "Book Now ",
            style: TextStyle(
              fontFamily: "MetropolisExtra",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Helper.kTitleTextColor,
            ),
          ),
          onPressedFunctionForRightAction: () {},
          appBarRightIcon: const Icon(
            Icons.shopping_cart,
            color: Helper.kTitleTextColor,
          ),
          leadingW: const BackButton(
            color: Helper.kTitleTextColor,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: StepProgressView(
                    width: MediaQuery.of(context).size.width,
                    curStep: _curStep,
                    color: const Color(0xff50AC02),
                    titles: titles),
              ),
              Expanded(
                child: PageView(
                  controller: PageController(keepPage: true),
                  onPageChanged: (i) {
                    setState(() {
                      _curStep = i + 1;
                    });
                  },
                  children: <Widget>[
                    BookingsSlotsList(barbershop: widget.barbershop),
                    BookServices(barbershop: widget.barbershop),
                    //this one will be deleted later in the last sprints
                    Container(
                      child: Center(
                        child: SizedBox(
                            // height: 80,
                            width: 180,
                            child:
                                CheckOutButton(barbershop: widget.barbershop)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
