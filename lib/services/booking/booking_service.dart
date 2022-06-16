import 'package:razor_book/models/user.dart';
import '../../models/booking.dart';
import '../../models/service.dart';

abstract class BookingService {
  // List<Booking>? get bookingsList => null;
  List<Booking>? get customerBookingsList => null;
  List<Booking>? get barberBookingsList => null;
  List<dynamic>? get slotsList => null;
  Booking? get myBooking => null;
  Future<void> makeBooking(Booking newBooking);
  Future<void> getCustomerBookings({required String userID});
  Future<void> getBarberBookings({required String userID});
  Future<void> cancelBooking({String? bookingID});
  Future<void> generateSlots({String? bID});
  Future<void> rateBooking({required String barbershopID, required String bookingID, required num rating, String? comment});
}
