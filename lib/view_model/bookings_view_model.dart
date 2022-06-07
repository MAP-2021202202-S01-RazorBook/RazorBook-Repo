import '../app/service_locator/service_locator.dart';
import '../models/booking.dart';
import '../models/user.dart';
import '../services/booking/booking_service.dart';
import 'base_view_model.dart';

class BookingsViewModel extends BaseModel {
  final _bookingsService = locator<BookingService>();

  List<Booking>? bookings = [];
  List<Booking>? get bookingsList {
    return bookings;
  }

  final _currentUser = locator<AuthenticationService>().currentUser;
  User? get currentUser {
    return _currentUser;
  }

  Future getBookings() async {
    print('I am at the view model');
    // setBusy(true);
    // await _bookingsService.generateSlots(bID: '1');
    try {
      if (currentUser?.user_type == 'customer') {
        await _bookingsService.getCustomerBookings(
            userID: currentUser?.u_id ?? "");
        bookings = _bookingsService.customerBookingsList;
      } else {
        await _bookingsService.getBarberBookings(
            userID: _currentUser?.u_id ?? '');
        bookings = _bookingsService.barberBookingsList;
      }

      bookings?.sort((a, b) => b.is_cancelled ? 0 : 1);
      // setBusy(false);
    } catch (e) {
      // print("Wtf is happening");
      print(e);
    }
  }

  Future cancelBooking(String? bookingID) async {
    setBusy(true);
    print('I am cancelling at the view model');

    await _bookingsService.cancelBooking(bookingID: bookingID);
    // await _bookingsService.getCustomerBookings(userID: '1');
    setBusy(false);
  }
}
