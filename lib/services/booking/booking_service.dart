import '../../models/booking.dart';

abstract class BookingService
{

  List<Booking>? get bookingsList => null;
   Future<void> getBookings({required String userID});
   Future<void> cancelBooking({String? bookingID});

}