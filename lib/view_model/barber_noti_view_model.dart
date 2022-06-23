import 'dart:async';

import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/models/booking.dart';
import 'package:razor_book/services/notification/barber/barber_notification_service.dart';

class BarberNotificationProvider {
  final _cusNoti = locator<BarberNotificationService>();
  final StreamController<List<Booking>> _notiStreamController =
      StreamController<List<Booking>>.broadcast();
  final _auth = locator<AuthenticationService>();
  Stream<List<Booking>> get notiStream => _notiStreamController.stream;

  //get notification for cancelled bookings
  Stream<List<Booking>> getNotification() {
    final v = _cusNoti.getBookingNoti(_auth.currentUser!.u_id);

    return v;
  }

  void dispose() {
    _notiStreamController.close();
  }
}
