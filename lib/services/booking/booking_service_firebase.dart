import 'package:flutter/foundation.dart';

import '../../models/booking.dart';
import '../../services/booking/booking_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../failure.dart';
import 'dart:developer';

class BookingServiceFirebase extends BookingService {
  final CollectionReference _bookings =
      FirebaseFirestore.instance.collection('bookings');
  // .withConverter<Booking>(
  //   fromFirestore: (data, document) => Booking.fromJson(data.data()),
  //   toFirestore: (booking) => booking.toJson()
  // )
  //.collection("bookings").where("c_id", "==", "eRiujAfrWASWbosQGToSO1wcmNz1")
  List<Booking> _bookingsList = [];

  @override
  List<Booking> get bookingsList => _bookingsList;

  @override
  Future<void> getBookings(
      {required String userID, required String userType}) async {
    try {
      debugPrint("getBookings");
      print("getBookings");
      log("getBookings");
      print("userID: $userID");
      final doc = await _bookings
          .where(userType == "customer" ? "c_id" : "b_id", isEqualTo: userID)
          .get();

      List<Booking> bookings =
          doc.docs.map((doc) => Booking.fromFirestore(doc)).toList();
      _bookingsList = bookings;

      debugPrint("getBookings");
      print("getBookings");
      log("getBookings");
      debugPrint("bookingsList: ${_bookingsList}");
      //return Future <List<Booking>>(null);
      //return Booking.fromFirestore(doc.getDocument());
      //double temp =12.12 as double;
      //return Booking(cID: "12", bID: "12", totalPrice: temp);

    } catch (Exc) {
      print(Exc);
      rethrow;
    }
  }

  @override
  Future<void> cancelBooking({String? bookingID}) async {
    try {
      debugPrint("cancelBooking ${bookingID}");
      print("cancelBooking, bookingID: $bookingID");
      log("cancelBooking ${bookingID}");

      // update the document with the booking id to cancelled equal to true
      await _bookings.doc(bookingID).update({"is_cancelled": true});
    } catch (Exc) {
      print(Exc);
      rethrow;
    }
  }
  // Future<void> customerSignup({required String email, required String password, required String name, required String phone, required String address});
  // Future<void> barbershopSignup({required String email, required String password, required String name, required String phone, required String address, required String openTime, required String closeTime, required String description});
  // Future<void> signOut();
  // Future<void> recoverPassword({required String email});

}
