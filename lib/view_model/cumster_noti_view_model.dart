import 'dart:async';

import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/models/booking.dart';
import 'package:razor_book/services/notification/customer_notification_service.dart';

class CustomerNotificationProvider {
  final _cusNoti = locator<CustomerNotificationService>();
  final StreamController<List<Booking>> _notiStreamController =
      StreamController<List<Booking>>.broadcast();
  final _auth = locator<AuthenticationService>();
  Stream<List<Booking>> get notiStream => _notiStreamController.stream;
  List<Booking> notiList = <Booking>[];

  //get notification for cancelled bookings
  getNotification() {
    final v = _cusNoti.getCancelledBookings(_auth.currentUser!.u_id);
    // _notiStreamController.addStream(v);
    v.listen((event) {
      notiList = event;
      _notiStreamController.add(event);
    });
  }

  void dispose() {
    _notiStreamController.close();
  }
}
