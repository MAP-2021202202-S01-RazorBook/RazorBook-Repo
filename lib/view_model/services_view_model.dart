import '../app/service_locator/service_locator.dart';
import '../models/service.dart';
import '../services/barber_services/barber_services_service.dart';
import 'base_view_model.dart';

class ServicesViewModel extends BaseModel {
  final _barberServicesService = locator<BarberServicesService>();

  List<Service>? services = [];
  List<Service>? get servicesList {
    return services;
  }

  final _currentUser = locator<AuthenticationService>().currentUser;

  Future getServices() async {
    print('I am at sssss the view model');
    setBusy(true);
    await _barberServicesService.deleteService(serviceID: '1');
    //services = _barberServicesService.servicesList;
    setBusy(false);
    dispose();
  }

  //     await _bookingsService.cancelBooking(bookingID: bookingID);
  //     await _bookingsService.getBookings(userID: '1');
  //     setBusy(false);
  // }
}
