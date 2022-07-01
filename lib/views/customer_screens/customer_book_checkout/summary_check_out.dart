import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/models/user.dart';
import 'package:razor_book/view_model/bookings_view_model.dart';
import 'package:razor_book/views/common_widgets/checkout_button.dart';

class SummayCheckOut extends StatelessWidget {
  const SummayCheckOut({Key? key, required this.barbershop}) : super(key: key);

  final User barbershop;

  @override
  Widget build(BuildContext context) {
    final bookingViewModel = context.watch<BookingsViewModel>();

    //this is for the selected serivces from pervious page
    var seletedSevices = bookingViewModel.selectedServices();
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 8),
              child: Text(
                bookingViewModel.selectedShop?.name ?? "",
                style: const TextStyle(
                  fontFamily: "MetropolisExtra",
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: Helper.kTitleTextColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10, bottom: 20),
              child: Text(
                bookingViewModel.selectedShop?.address ?? "",
                style: const TextStyle(
                  height: 1.2,
                  fontFamily: "MetropolisExtra",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 141, 141, 141),
                ),
              ),
            ),
          ],
        ),
        const Text(
          "Booking Date",
          style: TextStyle(
            fontFamily: "MetropolisExtra",
            fontSize: 21,
            fontWeight: FontWeight.w700,
            color: Helper.kFABColor,
          ),
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 2,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Date:",
              style: TextStyle(
                fontFamily: "MetropolisExtra",
                fontSize: 16.5,
                fontWeight: FontWeight.w600,
                color: Helper.checkOutSummaryTexts,
              ),
            ),
            Text(
              bookingViewModel
                  .workingDays[bookingViewModel.selectedColumn ?? 0],
              style: const TextStyle(
                  fontFamily: "MetropolisExtra",
                  fontSize: 16.5,
                  fontWeight: FontWeight.w600,
                  color: Helper.checkOutSummaryTexts),
            ),
          ],
        ),
        const SizedBox(
          height: 13,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Day:",
              style: TextStyle(
                fontFamily: "MetropolisExtra",
                fontSize: 16.5,
                fontWeight: FontWeight.w600,
                color: Helper.checkOutSummaryTexts,
              ),
            ),
            Text(
              bookingViewModel.days[bookingViewModel.selectedColumn ?? 0],
              style: const TextStyle(
                  fontFamily: "MetropolisExtra",
                  fontSize: 16.5,
                  fontWeight: FontWeight.w600,
                  color: Helper.checkOutSummaryTexts),
            ),
          ],
        ),
        const SizedBox(
          height: 13,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Time:",
              style: TextStyle(
                fontFamily: "MetropolisExtra",
                fontSize: 16.5,
                fontWeight: FontWeight.w600,
                color: Helper.checkOutSummaryTexts,
              ),
            ),
            Text(
              bookingViewModel.slots[bookingViewModel.selectedRow ?? 0],
              style: const TextStyle(
                  fontFamily: "MetropolisExtra",
                  fontSize: 16.5,
                  fontWeight: FontWeight.w600,
                  color: Helper.checkOutSummaryTexts),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Your Orders",
          style: TextStyle(
            fontFamily: "MetropolisExtra",
            fontSize: 21,
            fontWeight: FontWeight.w700,
            color: Helper.kFABColor,
          ),
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 2,
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            //replace data array with fetched one
            itemCount: seletedSevices.length,
            itemBuilder: (ctx, idx) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          seletedSevices[idx]["name"],
                          style: TextStyle(
                              fontFamily: "MetropolisExtra",
                              fontSize: 15.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Text(
                          "${seletedSevices[idx]["price"].toString()} RM",
                          style: const TextStyle(
                              fontFamily: "MetropolisExtra",
                              fontSize: 15.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      seletedSevices[idx]["description"],
                      style: const TextStyle(
                          fontFamily: "MetropolisExtra",
                          fontSize: 15.5,
                          fontWeight: FontWeight.w500,
                          color: Helper.kTitleTextColor),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Item Total:",
              style: TextStyle(
                fontFamily: "MetropolisExtra",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Helper.checkOutSummaryTexts,
              ),
            ),
            Text(
              "${bookingViewModel.totalPrice} RM",
              style: const TextStyle(
                  fontFamily: "MetropolisExtra",
                  fontSize: 16.5,
                  fontWeight: FontWeight.w600,
                  color: Helper.checkOutSummaryTexts),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        CheckOutButton(barbershop: barbershop),
      ]),
    );
  }
}
