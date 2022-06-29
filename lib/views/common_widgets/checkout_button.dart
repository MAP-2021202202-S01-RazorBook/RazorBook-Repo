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
    final x = context.watch<BookingsViewModel>();
    return Builder(builder: (context) {
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
              List<Map<String, dynamic>> selectedService = x.services
                  .where((element) => element['isSelected'] == true)
                  .toList();

              try {
                await x
                    .makeBooking(context, widget.barbershopId, selectedService,
                        x.totalPrice,
                        selectedDay: x.days[x.selectedColumn ?? 0],
                        selectedTime: x.slots[x.selectedRow ?? 0],
                        selectedWorkingDay:
                            x.workingDays[x.selectedColumn ?? 0])
                    .then((value) {
                  x.slots = [];
                  x.services = <Map<String, dynamic>>[];
                  x.totalPrice = 0.0;
                  x.selectedColumn = null;
                  x.selectedRow = null;
                  x.days = [];
                });
              } catch (e) {
                setState(() {
                  loading = false;
                });
              }

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
