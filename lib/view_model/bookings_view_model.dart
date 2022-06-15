import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:razor_book/helpers/helper_widgets.dart';

import '../app/service_locator/service_locator.dart';
import '../models/booking.dart';
import '../models/user.dart';
import '../services/booking/booking_service.dart';
import 'base_view_model.dart';

class BookingsViewModel extends BaseModel {
  final _bookingsService = locator<BookingService>();

  List<Booking>? bookings = [];
  List<Booking>? get bookingsList {
    return bookings;
  }

  int? _selectedColumn;
  int? get selectedColumn => _selectedColumn;

  set selectedColumn(int? index) {
    _selectedColumn = index;
    notifyListeners();
  }

  int? _selectedRow;
  int? get selectedRow => _selectedRow;
  set selectedRow(int? index) {
    _selectedRow = index;
    notifyListeners();
  }

  final _currentUser = locator<AuthenticationService>().currentUser;

  User? get currentUser {
    return _currentUser;
  }

  var temtime = "";

  User? _selectedShop;
  User? get selectedShop {
    return _selectedShop;
  }

  set selectedShop(User? v) {
    _selectedShop = v;

    days = _selectedShop?.open_days!.map((e) => e.toString()).toList() ?? [];

    print(days);
    notifyListeners();
  }

  ///
  ///
  ///migrated from bookings_slots_list.dart
  ///

  //should be replaced with the once fetched from the database.
  List<String> days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thrusday",
    "Friday",
    "Saturday"
  ];

//this function will check from coming 7 days starting from current date and check whether it's
// a working day or not, if yes it returns the date of those days
//this function might be moved to the ViewModel where from there we can store a the list
//result is YYYY-MM-DD of the working day

  // List<String> getDateOfWorkingDays() {
  //   List<String> datesOfWorkingDays = [];
  //   for (int i = 0; i < days.length + 1; i++) {
  //     var date = DateTime.now().add(Duration(days: i));
  //     // if (days.contains(DateFormat('EEEE').format(date))) {

  //     // }
  //     datesOfWorkingDays.add(DateFormat('dd/MM/yyyy').format(date));
  //   }

  //   return datesOfWorkingDays;
  // }

  List<String> getDateOfWorkingDays() {
    List<String> datesOfWorkingDays = [];
    for (int i = 0; i < days.length; i++) {
      String availableDate = days[i];
      print(availableDate);

      ///generate next 7 days from current date
      for (int i = 0; i < 7; i++) {
        /// remove day that are not available day from next 7 days
        DateTime date = DateTime.now().add(Duration(days: i));
        String day = DateFormat('EEEE').format(date);
        if (day == availableDate) {
          datesOfWorkingDays.add(DateFormat('yyyy-MM-dd').format(date));
        }
      }
    }
    print(datesOfWorkingDays);
    return datesOfWorkingDays;
  }

  //this function will return list of slots,
  //later on the view model there should be comparsion between this generated slots
  //and the slots that have been booked to the applcation delete them and not include them.
  // as well as not including the slots from the open time to current time -but this one is difficult to implement-
  //the logic is already  built -it's the commented part- but hard to use it only for one object
  //since it's a function called in a loop

  List<String> generateBookingSlots(
      {required String openTime,
      required String closeTime,
      required double slotLength}) {
    List<String> bookingSlots = [];

    //convert time "10:43:13" to TimeDay Object
    var format = DateFormat("HH:mm");

    var shopOpenTime = format.parse(openTime);
    var shopCloseTime = format.parse(closeTime);

    //to find the difference between the two time
    Duration durationBetweenOpenAndClose =
        shopCloseTime.difference(shopOpenTime).abs();
    var hours = durationBetweenOpenAndClose.inHours;
    var minutes = durationBetweenOpenAndClose.inMinutes % 60;

    //this object temporary which used to add time to it
    var tempTime = shopOpenTime;

    //if current date is provided check whether today date is working day
    //and then calculate current time of the current date and open time
    // delete the slots that passed.
    //todayDate is used to check if the current day is a working day
    // var todaydate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    // //there must be these two varaible otherwise the will be logical error
    // var timeNowString = DateFormat('HH:mm').format(DateTime.now());
    // var currentTime = format.parse(timeNowString);

    // if (getDateOfWorkingDays().contains(todaydate) &&
    //     currentTime.isAfter(shopOpenTime)) {
    //   Duration durationBetweenCurrentTimeAndClose =
    //       shopCloseTime.difference(currentTime).abs();
    //   hours = durationBetweenCurrentTimeAndClose.inHours;
    //   minutes = durationBetweenCurrentTimeAndClose.inMinutes % 60;
    //   tempTime = currentTime;
    // }

    //to add the slot to the bookings slots array
    //note for the logic : if the slot length is 1.0, then if we have any situation like
    // 19:43, it will not calculate the minutes
    if (slotLength == 0.5) {
      for (int i = 0; i < hours * 2; i++) {
        tempTime = tempTime.add(const Duration(minutes: 30));

        bookingSlots.add(DateFormat("HH:mm a").format(tempTime).toString());
      }
      if (minutes >= 30) {
        tempTime = tempTime.add(const Duration(minutes: 30));
        bookingSlots.add(DateFormat("HH:mm a").format(tempTime).toString());
      }
    } else {
      for (int i = 0; i < hours; i++) {
        tempTime = tempTime.add(const Duration(hours: 1));

        bookingSlots.add(DateFormat("HH:mm a").format(tempTime).toString());
      }
    }
    return bookingSlots;
  }

  List<String> slots = <String>[];
  List<String> workingDays = <String>[];

  ///
  ///end slot list
  ///

  /// migrated from book_services_view.dart
  ///
  ///

  List<Map<String, dynamic>> _services = [];

  List<Map<String, dynamic>> get services => _services;
  set services(v) {
    _services = v;
    notifyListeners();
  }

  Future<void> getService(String shopId) async {
    var service = await _bookingsService.getService(shopId);
    _services = service;
  }

  double _totalPrice = 0.0;
  set totalPrice(v) {
    _totalPrice = v;
    notifyListeners();
  }

  double get totalPrice => _totalPrice;

  /// end migrated from book_services_view.dart

  Future getBookings() async {
    // setBusy(true);
    // await _bookingService.generateSlots(bID: '1');
    try {
      if (currentUser?.user_type == 'customer') {
        await _bookingsService.getCustomerBookings(
            userID: currentUser?.u_id ?? "");
        bookings = _bookingsService.customerBookingsList;
      } else {
        log("current user here is : ${currentUser?.u_id}");
        await _bookingsService.getBarberBookings(
            userID: _currentUser?.u_id ?? '');
        bookings = _bookingsService.barberBookingsList;
      }
      bookings?.sort((a, b) => b.is_cancelled ? 0 : 1);
      log(bookings!.toList().toString());
      // setBusy(false);
    } catch (e) {
     
      print(e);
    }
  }

  Future cancelBooking(String? bookingID) async {
    setBusy(true);

    await _bookingsService.cancelBooking(bookingID: bookingID);
    // await bookingService.getCustomerBookings(userID: '1');
    setBusy(false);
  }

  Future makeBooking(
    BuildContext ctx,
    String bid,
    List<Map<dynamic, dynamic>> srv,
    double totalP, {
    required String selectedDay,
    required String selectedTime,
    required String selectedWorkingDay,
  }) async {
    log("""
cid: ${currentUser!.u_id}
service : $services
// booking slot :$slots
total price: $totalP


    """);
    Booking booking = Booking(
      c_id: currentUser!.u_id, // auth user id  not (users.docs.id)
      b_id: bid,
      is_cancelled: false,

      ///save only sh_id to firestore
      services: srv.map((e) => e['sh_id']).toList(), // need json encode
      total_price: totalP,
      is_paid: false,
      is_completed: false,
      time: "$selectedDay $selectedTime ",
      date: selectedWorkingDay,
    );
    log("[s] Booking object: $booking");
    log(booking.toJson().toString());
    log("[e] Booking object: $booking");
    ScaffoldMessenger.of(ctx).showSnackBar(mySnackBar(
      'Booking ......',
    ));
    try {
      await _bookingsService.makeBooking(booking).then((value) {
        ScaffoldMessenger.of(ctx).showSnackBar(mySnackBar(
          'Booking Successful',
        ));
      });
    } catch (e) {
      ScaffoldMessenger.of(ctx)
          .showSnackBar(mySnackBar(e.toString(), error: true));
    }
  }

    Future rateBooking(String barbershopID, String bookingID, num rating, String? comment) async {

    if(comment == ""){comment = "none";}

    setBusy(true);
    await _bookingsService.rateBooking(barbershopID: barbershopID, bookingID: bookingID,  rating: rating, comment: comment);
    setBusy(false);
  }

}
