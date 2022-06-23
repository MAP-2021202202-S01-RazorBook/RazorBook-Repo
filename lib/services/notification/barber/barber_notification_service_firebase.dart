import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:razor_book/models/booking.dart';
import 'package:razor_book/services/failure.dart';
import 'package:razor_book/services/notification/barber/barber_notification_service.dart';

class BarberNotificationServiceFirebase implements BarberNotificationService {
  final CollectionReference _bookingsCollection =
      FirebaseFirestore.instance.collection('bookings');
  @override
  Stream<List<Booking>> getBookingNoti(String bid) {
    try {
      log("calling get bookings noti");

      /// lateer -> booking_status -> [cancelled, confirmed, completed, pending]
      ///
      ///
      return _bookingsCollection
          .where('b_id', isEqualTo: bid)
          .where('is_completed', isEqualTo: false)
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
