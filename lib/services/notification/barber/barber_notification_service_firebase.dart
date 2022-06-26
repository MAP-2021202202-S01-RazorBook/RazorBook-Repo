import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/models/booking.dart';
import 'package:razor_book/services/failure.dart';
import 'package:razor_book/services/notification/barber/barber_notification_service.dart';
import 'package:razor_book/services/notification/notification_service.dart';
import 'package:timeago/timeago.dart' as timeago;

class BarberNotificationServiceFirebase implements BarberNotificationService {
  final CollectionReference _bookingsCollection =
      FirebaseFirestore.instance.collection('bookings');
  final NotificationService _notiService = locator<NotificationService>();
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
          var x = event.docs.map((e) {
            var data = e.data() as Map<String, dynamic>;
            var bk = Booking.fromJson(data);
            _notiService.showNotification(
                title: "New Order By",
                body:
                    " ${bk.customerName} @ ${timeago.format(DateTime.parse(bk.updatedAt).toLocal())}",
                payload: bk.toJson());
            return bk;
          }).toList();

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
