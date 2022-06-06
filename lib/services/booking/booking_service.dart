import 'package:razor_book/models/user.dart';
import '../../models/booking.dart';
import '../../models/service.dart';

abstract class BookingService {
  List<Booking>? get bookingsList => null;
  List<User>? get bookingsShopsList => null;
  List<User>? get bookingsCustomersList => null;
  List<dynamic>? get slotsList => null;
  Booking? get myBooking => null;
  Future<void> makeBooking(
      {String? c_id, String? b_id, String? time, String? date});
  Future<void> getCustomerBookings({required String userID});
  Future<void> getBarberBookings({required String userID});
  Future<void> cancelBooking({String? bookingID});
  Future<void> generateSlots({String? bID});
}
