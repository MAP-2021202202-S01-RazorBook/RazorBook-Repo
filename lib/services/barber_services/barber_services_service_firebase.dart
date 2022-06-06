import 'package:flutter/foundation.dart';

import '../../models/service.dart';
import '../../services/barber_services/barber_services_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../failure.dart';
//import 'dart:developer';

class BarberServicesServiceFirebase extends BarberServicesService {
  final CollectionReference _services =
      FirebaseFirestore.instance.collection('services');
  // .withConverter<Booking>(
  //   fromFirestore: (data, document) => Booking.fromJson(data.data()),
  //   toFirestore: (booking) => booking.toJson()
  // )
  //.collection("bookings").where("c_id", "==", "eRiujAfrWASWbosQGToSO1wcmNz1")
  List<Service> _servicesList = [];

  @override
  List<Service> get servicesList => _servicesList;

  @override
  Future<void> getServices({required String userID}) async {
    try {
      debugPrint("gets");
      print("gets");
      //log("gets");
      final doc = await _services
          .where("sh_id", isEqualTo: "eRiujAfrWASWbosQGToSO1wcmNz1")
          .get();

      List<Service> services =
          doc.docs.map((doc) => Service.fromFirestore(doc)).toList();
      _servicesList = services;

      debugPrint("getssssss");
      print("getssssssss");
      //log("getsssssssssss");
      debugPrint("servicessList: ${_servicesList}");
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
  Future<void> addlService({String? bookingID}) {
    // TODO: implement addlService
    throw UnimplementedError();
  }

  //  @override
  // Future<void> cancelBooking({String? bookingID})async{
  //   try {
  //     debugPrint("cancelBooking ${bookingID}");
  //     print("cancelBooking, bookingID: $bookingID");
  //     log("cancelBooking ${bookingID}");

  //     // update the document with the booking id to cancelled equal to true
  //     await _bookings.doc(bookingID).update({
  //       "is_cancelled": true
  //     });
  //   } catch (Exc) {
  //     print(Exc);
  //     rethrow;
  //   }
  // }
  // Future<void> customerSignup({required String email, required String password, required String name, required String phone, required String address});
  // Future<void> barbershopSignup({required String email, required String password, required String name, required String phone, required String address, required String openTime, required String closeTime, required String description});
  // Future<void> signOut();
  // Future<void> recoverPassword({required String email});

}
