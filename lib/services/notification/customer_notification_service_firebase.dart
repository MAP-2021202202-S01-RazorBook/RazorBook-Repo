import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/models/booking.dart';
import 'package:razor_book/services/failure.dart';
import 'package:razor_book/services/notification/customer_notification_service.dart';
import 'package:razor_book/services/notification/notification_service.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomerNotificationServiceFirebase
    implements CustomerNotificationService {
  final CollectionReference _bookingsCollection =
      FirebaseFirestore.instance.collection('bookings');
  final NotificationService _notiService = locator<NotificationService>();
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
          var x = event.docs.map((e) {
            var data = e.data() as Map<String, dynamic>;
            var bk = Booking.fromJson(data);
            _notiService.showNotification(
                title: "Your Order is Declied by",
                body:
                    " ${bk.barberName} @ ${timeago.format(DateTime.parse(bk.updatedAt).toLocal())}",
                payload: bk.toJson());
            return bk;
          }).toList();

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
