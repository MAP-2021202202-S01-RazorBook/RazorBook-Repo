// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';
import 'package:flutter/foundation.dart';

import '../../helpers/helper_functions.dart';
import '../../models/booking.dart';
import '../../services/booking/booking_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../failure.dart';
import 'dart:developer';

class BookingServiceFirebase extends BookingService
{
  final CollectionReference  _bookings = FirebaseFirestore.instance.collection('bookings');
  final CollectionReference  _services = FirebaseFirestore.instance.collection('services');
  final CollectionReference  _user = FirebaseFirestore.instance.collection('users');
  
  // .withConverter<Booking>(
  //   fromFirestore: (data, document) => Booking.fromJson(data.data()),
  //   toFirestore: (booking) => booking.toJson()
  // )
  //.collection("bookings").where("c_id", "==", "eRiujAfrWASWbosQGToSO1wcmNz1")
  List<Booking> _bookingsList = [];
  List<dynamic> _slotsList = [];

  @override
  List<Booking> get bookingsList => _bookingsList;

  @override
  List<dynamic> get slotsList => _slotsList;

   @override
  Future<void> getCustomerBookings({required String userID})async{
    try {
      debugPrint("getBookings");
      print("getBookings");
      log("getBookings");
      final doc = await _bookings.where("c_id", isEqualTo: "eRiujAfrWASWbosQGToSO1wcmNz1")
      .get();

      List<Booking> bookings = doc.docs.map((doc) => Booking.fromFirestore(doc)).toList();
      _bookingsList = bookings;


      // this should be then converted from JSON to User object,
      // and stored in bookingShopsList

      _bookingsList.forEach((element){ print(_user.where("u_id", isEqualTo: element.b_id)
      .get());});


      debugPrint("getBookings");
      print("getBookings");
      log("getBookings");
      debugPrint ("bookingsList: ${_bookingsList}");
      //return Future <List<Booking>>(null);
      //return Booking.fromFirestore(doc.getDocument());
      //Double temp =12.12 as Double;
      //return Booking(cID: "12", bID: "12", totalPrice: temp);

    } catch (Exc) {
      print(Exc);
      rethrow;
    }    
  }

  @override
  Future<void> getBarberBookings({required String userID})async{
    try {
      debugPrint("getBookings");
      print("getBookings");
      log("getBookings");
      final doc = await _bookings.where("b_id", isEqualTo: "yKUgyp8lpYXOmaDxon1r1CKeVCL2")
      .get();

      List<Booking> bookings = doc.docs.map((doc) => Booking.fromFirestore(doc)).toList();
      _bookingsList = bookings;


      // this should be then converted from JSON to User object,
      // and stored in bookingCustomersList
      _bookingsList.forEach((element){ print(_user.where("u_id", isEqualTo: element.c_id)
      .get());});


      debugPrint("getBookings");
      print("getBookings");
      log("getBookings");
      debugPrint ("bookingsList: ${_bookingsList}");
      //return Future <List<Booking>>(null);
      //return Booking.fromFirestore(doc.getDocument());
      //Double temp =12.12 as Double;
      //return Booking(cID: "12", bID: "12", totalPrice: temp);

    } catch (Exc) {
      print(Exc);
      rethrow;
    }    
  }
  
  @override
  Future<void> cancelBooking({String? bookingID})async{
    try {
      debugPrint("cancelBooking ${bookingID}");
      print("cancelBooking, bookingID: $bookingID");
      log("cancelBooking ${bookingID}");

      // update the document with the booking id to cancelled equal to true
      await _bookings.doc(bookingID).update({
        "is_cancelled": true
      });
    } catch (Exc) {
      print(Exc);
      rethrow;
    }    
  }

  @override
  Future<void> generateSlots({String? bID}) async {
    //final CollectionReference  _open_time = FirebaseFirestore.instance.collection('user/open_time');
    
    try {
      final val = await _user.where("u_id", isEqualTo: "MNyJ0Jiq7jZDGI3W6qMvGJBKadK2").get();
      print("ohio");
     //String substring(int startIndex, [int endIndex]);
      String openTime = val.docs[0].get('open_time').substring(0,5) as String;
      String closeTime = val.docs[0].get('close_time').substring(0,5) as String;
      double slotLength = val.docs[0].get('slot_length') as double;
      List<dynamic> openDays = val.docs[0].get('open_days').toList();

      print(openTime);
      print(closeTime);
      print(slotLength);
      print(openDays);


      List<String> slots = getSlots(openTime, closeTime, slotLength);

      for (var i = 0; i < openDays.length; i++)
      {
        _slotsList.add({openDays[i], slots});
      }
  
      print("hI");
      print(slotsList);

    } catch (Exc) {
      print(Exc);
      rethrow;
    }    
  }

  @override
  Future<void> makeBooking({String? c_id, String? b_id, String? time, String? date}) async{
    try {
      // update the document with the booking id to cancelled equal to true

      await _bookings.add({
        'c_id': 'eRiujAfrWASWbosQGToSO1wcmNz1',    
        'b_id': 'MNyJ0Jiq7jZDGI3W6qMvGJBKadK2',
        'services': [{'SWWt4m8kEbkteJou65zj '}, {'qpwlREB0QcFG67a2czCt'}],
        'time': '18:30',
        'date': '18:18:2022',
        'is_cancelled': false,
        'is_completed': false,
        'is_paid': false,
        'price': 12.12
      });
    } catch (Exc) {
      print(Exc);
      rethrow;
    }    
  }


}