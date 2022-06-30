import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/view_model/bookings_view_model.dart';
import 'package:razor_book/views/common_widgets/checkout_button_sheet.dart';
import 'package:webview_flutter/webview_flutter.dart';


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
  void initState() {
     super.initState();
     // Enable virtual display.
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }
  //WidgetsBinding.instance.addPostFrameCallback((_){
  @override
  Widget build(BuildContext context) {
    

    // final x = context.watch<BookingsViewModel>();
    // return Builder(builder: (context) {
         
        
        BookingsViewModel x = context.watch<BookingsViewModel>();  
       
        return FutureBuilder(
        future: x.getPaymentMethod(widget.barbershopId),
        builder: (context, snapshot) {
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
       return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
         children: <Widget>[
          const SizedBox(height: 60),
           ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: Helper.kFABColor,
                fixedSize: Size(MediaQuery.of(context).size.width, 56)),
            onPressed: () async{
              ///booking service
              ///
                if(mounted){
                setState((){
                  loading = true;
                });
              }
              List<Map<String, dynamic>> selectedService = x.services
                  .where((element) => element['isSelected'] == true)
                  .toList();
                  //print('3333333333333333333333: ${x.hasPayPalEmail}');

              
              try {
                     await x
                        .makeBooking(context, widget.barbershopId,
                            selectedService, x.totalPrice,
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
                    }).then((value) {showBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return const CheckOutButtonSheet();
                  });});
                  } catch (e) {
                if(mounted){
                setState((){
                  loading = false;
                });
              }
            }},
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    'Pay With Cash',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 16,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
          )),


                  const SizedBox(height: 30),
                    x.hasPayPalEmail == true? ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: Helper.kFABColor,
                fixedSize: Size(MediaQuery.of(context).size.width, 56)),
            onPressed: () async{
              ///booking service
              ///
              // setState(() {
              //   loading = true;
              // });
              List<Map<String, dynamic>> selectedService = x.services
                  .where((element) => element['isSelected'] == true)
                  .toList();

              
              try {

                        await x.makePayPalBooking(context, widget.barbershopId,
                            selectedService, x.totalPrice,
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
                    }).then((value) {showBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return const CheckOutButtonSheet();
                  });});
              } catch (e) {
                if(mounted){
                setState((){
                  loading = false;
                });
               }
              }

              ///
              ///
             if(mounted){
                setState((){
                  loading = false;
                });
              }
              // showBottomSheet(
              //     context: context,
              //     builder: (ctx) {
              //       return const CheckOutButtonSheet();
              //     });
            },
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    'Pay with PayPal',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 16,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  )) : const Text(""),])
      );}
    }
);}}
