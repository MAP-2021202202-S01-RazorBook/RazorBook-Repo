import '../../services/booking/booking_service.dart';


abstract class BookingService
{

   Future<Booking> getBookings({required String user_id});
   Future<void> cancelBooking({required String booking_id});
  // Future<void> customerSignup({required String email, required String password, required String name, required String phone, required String address});
  // Future<void> barbershopSignup({required String email, required String password, required String name, required String phone, required String address, required String openTime, required String closeTime, required String description});
  // Future<void> signOut();
  // Future<void> recoverPassword({required String email});


}