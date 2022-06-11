import 'package:flutter/foundation.dart';

import '../../models/service.dart';
import '../../services/barber_services/barber_services_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      final doc = await _services.where("sh_id", isEqualTo: userID).get();

      List<Service> services =
          doc.docs.map((doc) => Service.fromFirestore(doc)).toList();
      _servicesList = services;
      print(_servicesList.length);
    } catch (Exc) {
      print(Exc);
      rethrow;
    }
  }

  @override
  Future<void> addService({required Service service}) async {
    try {
      // print("gets");
      await _services.add(service.toJson());
    } on FirebaseException catch (e) {
      throw Failure(100,
          message: e.toString(),
          location:
              'BarberServicesServiceFirebase.addService() on FirebaseException');
    } catch (e) {
      throw Failure(101,
          message: e.toString(),
          location:
              'BarberServicesServiceFirebase.addService() on other exception');
    }
  }

  @override
  Future<void> deleteService({String? serviceID}) async {
    // TODO: implement delete Service
    try {
      //String mockServiceId = 'SWWt4m8kEbkteJou65zj';
      // final doc = await _services.where("sh_id", isEqualTo: "eRiujAfrWASWbosQGToSO1wcmNz1")
      // .get();
      await _services.doc(serviceID ?? "").delete();
    } on FirebaseException catch (e) {
      throw Failure(100,
          message: e.toString(),
          location:
              'BarberServicesServiceFirebase.deleteService() on FirebaseException');
    } catch (e) {
      throw Failure(101,
          message: e.toString(),
          location:
              'BarberServicesServiceFirebase.deleteService() on other exception');
    }
  }

  @override
  Future<void> editService(
      {required String serviceID, required Service updatedService}) async {
    try {
      String mockServiceId = 'SWWt4m8kEbkteJou65zj';
      await _services.doc(serviceID).update(updatedService.toJson());
    } on FirebaseException catch (e) {
      throw Failure(100,
          message: e.toString(),
          location:
              'BarberServicesServiceFirebase.editService() on FirebaseException');
    } catch (e) {
      throw Failure(101,
          message: e.toString(),
          location:
              'BarberServicesServiceFirebase.editService() on other exception');
    }
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
