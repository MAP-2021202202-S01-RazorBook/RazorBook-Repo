import 'package:flutter/material.dart';

import '../../models/booking.dart';

abstract class BookingService {
  // List<Booking>? get bookingsList => null;
  List<Booking>? get customerBookingsList => null;
  List<Booking>? get barberBookingsList => null;
  List<dynamic>? get slotsList => null;
  bool get hasPayPalEmail => false;
  Booking? get myBooking => null;
  Future<void> makeBooking(Booking newBooking);
  Future<void> makePayPalBooking(Booking newBooking, BuildContext ctx);
  Future<void> getCustomerBookings({required String userID});
  Future<void> getBarberBookings({required String userID});
  Future<void> cancelBooking({String? bookingID});
  Future<void> generateSlots({String? bID});
  Future<void> rateBooking(
      {required String barbershopID,
      required String bookingID,
      required num rating,
      String? comment});
  Future<List<Map<String, dynamic>>> getService(String id);
  Future<void> getPaymentMethod(String? barbershopID);
  
}
