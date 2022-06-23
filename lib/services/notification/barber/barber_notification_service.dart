import 'package:razor_book/models/booking.dart';

abstract class BarberNotificationService {
  Stream<List<Booking>> getBookingNoti(String id);
}
