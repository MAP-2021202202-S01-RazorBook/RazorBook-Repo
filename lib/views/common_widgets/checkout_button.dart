import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/view_model/bookings_view_model.dart';
import 'package:razor_book/views/common_widgets/checkout_button_sheet.dart';

class CheckOutButton extends StatefulWidget {
  final String barbershopId;
  const CheckOutButton({
    Key? key,
    required this.barbershopId,
  }) : super(key: key);

  @override
  State<CheckOutButton> createState() => _CheckOutButtonState();
}

class _CheckOutButtonState extends State<CheckOutButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<BookingsViewModel>(builder: (context, x, __) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: Helper.kFABColor,
                fixedSize: Size(MediaQuery.of(context).size.width, 56)),
            onPressed: () async {
              ///booking service
              ///
              setState(() {
                loading = true;
              });
              List<Map<dynamic, dynamic>> selectedService = x.services
                  .where((element) => element['isSelected'] == true)
                  .toList();
              await BookingsViewModel().makeBooking(
                  context, widget.barbershopId, selectedService, x.totalPrice);

              ///
              ///
              setState(() {
                loading = false;
              });
              showBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return const CheckOutButtonSheet();
                  });
            },
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    'Checkout',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 16,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  )),
      );
    });
  }
}
