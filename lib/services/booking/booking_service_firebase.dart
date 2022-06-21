import 'dart:developer';

import '../../helpers/helper_functions.dart';
import '../../models/booking.dart';
import '../../services/booking/booking_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../failure.dart';

class BookingServiceFirebase extends BookingService {
  final CollectionReference _bookingsCollection =
      FirebaseFirestore.instance.collection('bookings');
  final CollectionReference _servicesCollection =
      FirebaseFirestore.instance.collection('services');
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  List<Booking>? _customerBookingsList = [];
  List<Booking>? _barberBookingsList = [];

  @override
  List<Booking>? get customerBookingsList => _customerBookingsList;
  @override
  List<Booking>? get barberBookingsList => _barberBookingsList;

  List<dynamic>? _slotsList;

  @override
  List<dynamic>? get slotsList => _slotsList;

  @override
  Future<void> getCustomerBookings({required String userID}) async {
    try {
      final doc =
          await _bookingsCollection.where("c_id", isEqualTo: userID).get();

      List<Booking> bookings =
          doc.docs.map((doc) => Booking.fromFirestore(doc)).toList();
      _customerBookingsList = bookings;
    } on FirebaseException catch (e) {
      throw Failure(100,
          message: e.toString(),
          location:
              'BookingServiceFirebase.getCustomerBookings() on FirebaseException');
    } catch (e) {
      throw Failure(101,
          message: e.toString(),
          location:
              'BookingServiceFirebase.getCustomerBookings() on other exception');
    }
  }

  @override
  Future<void> getBarberBookings({required String userID}) async {
    try {
      final doc =
          await _bookingsCollection.where("b_id", isEqualTo: userID).get();
      _barberBookingsList =
          doc.docs.map((doc) => Booking.fromFirestore(doc)).toList();
    } on FirebaseException catch (e) {
      throw Failure(100,
          message: e.toString(),
          location:
              'BookingServiceFirebase.getBarberBookings() on FirebaseException');
    } catch (e) {
      throw Failure(101,
          message: e.toString(),
          location:
              'BookingServiceFirebase.getBarberBookings() on other exception');
    }
  }

  @override
  Future<void> cancelBooking({String? bookingID}) async {
    try {
      // update the document with the booking id to cancelled equal to true
      await _bookingsCollection.doc(bookingID).update({"is_cancelled": true});
    } on FirebaseException catch (e) {
      throw Failure(100,
          message: e.toString(),
          location:
              'BookingServiceFirebase.getBarberBookings() on FirebaseException');
    } catch (e) {
      throw Failure(101,
          message: e.toString(),
          location:
              'BookingServiceFirebase.getBarberBookings() on other exception');
    }
  }

  @override
  Future<void> generateSlots({String? bID}) async {
    //final CollectionReference  _open_time = FirebaseFirestore.instance.collection('user/open_time');

    try {
      final val = await _usersCollection
          .where("u_id", isEqualTo: "MNyJ0Jiq7jZDGI3W6qMvGJBKadK2")
          .get();

      //String substring(int startIndex, [int endIndex]);
      String openTime = val.docs[0].get('open_time').substring(0, 5) as String;
      String closeTime =
          val.docs[0].get('close_time').substring(0, 5) as String;
      double slotLength = val.docs[0].get('slot_length') as double;
      List<dynamic> openDays = val.docs[0].get('open_days').toList();

      List<String> slots = getSlots(openTime, closeTime, slotLength);

      for (var i = 0; i < openDays.length; i++) {
        _slotsList?.add({openDays[i], slots});
      }

      _slotsList = slots;
    } catch (Exc) {
      print(Exc);
      rethrow;
    }
  }

  @override
  Future<void> makeBooking(Booking booking) async {
    try {
      // update the document with the booking id to cancelled equal to true
      /// add booking data later

      await _bookingsCollection
          .add(booking.toJson())
          .then((value) => log(value.id));
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> rateBooking({required String barbershopID, required String bookingID, required num rating, String? comment}) async {
    try {
      await _bookingsCollection.doc(bookingID).update({"rating": rating, "comment": comment});
      var bookingsDoc = await _bookingsCollection.where("b_id", isEqualTo: barbershopID).get();
      var barbershopDoc = await _usersCollection.where("u_id", isEqualTo: barbershopID).get();
      //print(doc.docs[0].data().rating);
      var bookings = <dynamic>[];
      num allRatings = 0;
      
      for(int i=0; i<bookingsDoc.docs.length; i++) {
        bookings.add(bookingsDoc.docs[i].data());

        if(bookings[bookings.length-1]['rating'] == null || bookings[bookings.length-1]['rating'] == 0){
          bookings.removeAt(bookings.length-1);
          }else{
            allRatings += bookings[bookings.length-1]['rating'];
      }          
      }

      int ratingsCount = bookings.length;
      await _usersCollection.doc(barbershopDoc.docs[0].id).update({"rating": allRatings/ratingsCount, "ratings_counter": ratingsCount});

    } on FirebaseException catch (e) {
      throw Failure(100,
          message: e.toString(),
          location:
              'BookingServiceFirebase.rateBooking() on FirebaseException');
    } catch (e) {
      throw Failure(101,
          message: e.toString(),
          location:
              'BookingServiceFirebase.rateBooking() on other exception');
    }
  }
  @override
  Future<List<Map<String, dynamic>>> getService(String id) async {
    try {
      var data = await _servicesCollection.where('sh_id', isEqualTo: id).get();
      var lm =
          data.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      return lm;
    } catch (e) {
      log(e.toString());
      throw Failure(
        22222,
        message: e.toString(),
        location: 'BookingServiceFirebase.getService()',
      );
    }
  }
}
