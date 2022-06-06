
import '../app/service_locator/service_locator.dart';
import '../models/booking.dart';
import '../services/booking/booking_service.dart';
import 'base_view_model.dart';

class BookingsViewModel extends BaseModel {

    final _bookingsService = locator<BookingService>();

    List<Booking>? bookings= [];
    List<Booking>? get bookingsList {
        return bookings;
    }

    Future getBookings() async {
        print('I am at the view model');
        setBusy(true);
        await _bookingsService.generateSlots(bID: '1');
        bookings = _bookingsService.bookingsList;
        setBusy(false);
    }

    Future cancelBooking(String? bookingID) async {
        setBusy(true);
        print('I am cancelling at the view model');
        
        await _bookingsService.cancelBooking(bookingID: bookingID);
        await _bookingsService.getCustomerBookings(userID: '1');
        setBusy(false);
    }
}
