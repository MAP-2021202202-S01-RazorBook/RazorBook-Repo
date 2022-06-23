import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:razor_book/models/booking.dart';
import 'package:razor_book/services/failure.dart';
import 'package:razor_book/services/notification/customer_notification_service.dart';

class CustomerNotificationServiceFirebase
    implements CustomerNotificationService {
  final CollectionReference _bookingsCollection =
      FirebaseFirestore.instance.collection('bookings');
  @override
  Stream<List<Booking>> getCancelledBookings(String id) {
    try {
      log("calling get cancelled bookings");
      return _bookingsCollection
          .where('c_id', isEqualTo: id)
          .where('is_cancelled', isEqualTo: true)
          .snapshots()
          .map((event) {
        if (event.docs.isNotEmpty) {
          var x = event.docs
              .map((e) => Booking.fromJson(e.data() as Map<String, dynamic>))
              .toList();

          log(x.toString());
          return x;
        } else {
          log("event is empty");
          return [];
        }
      });
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
