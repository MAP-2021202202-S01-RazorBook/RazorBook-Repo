import 'package:razor_book/models/booking.dart';

abstract class CustomerNotificationService {
  Stream<List<Booking>> getCancelledBookings(String id);
}
