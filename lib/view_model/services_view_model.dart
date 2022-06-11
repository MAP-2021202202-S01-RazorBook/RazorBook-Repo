import '../app/service_locator/service_locator.dart';
import '../models/service.dart';
import '../models/user.dart';
import '../services/barber_services/barber_services_service.dart';
import 'base_view_model.dart';

class ServicesViewModel extends BaseModel {
  final _barberServicesService = locator<BarberServicesService>();

  List<Service>? services = [];
  List<Service>? get servicesList {
    return services;
  }

  final _currentUser = locator<AuthenticationService>().currentUser;
  User? get currentUser {
    return _currentUser;
  }

  Future getServices() async {
    print('I am at sssss the view model');
    try {
      // setBusy(true);
      await _barberServicesService.getServices(
          userID: _currentUser?.u_id ?? '');
      services = _barberServicesService.servicesList;
      // setBusy(false);
    } catch (e) {
      // print("Wtf is happening");
      print(e);
    }
  }

  Future addService({required Service service}) async {
    setBusy(true);

    await _barberServicesService.addService(service: service);
    // print('I am adding at the view model');
  }

  //     await _bookingsService.cancelBooking(bookingID: bookingID);
  //     await _bookingsService.getBookings(userID: '1');
  //     setBusy(false);
  // }
  Future editService(
      {required String? serviceID, required Service updatedService}) async {
    setBusy(true);
    await _barberServicesService.editService(
        serviceID: serviceID!, updatedService: updatedService);
    print('I am editing at the view model');
  }

  Future deleteService({required String? serviceID}) async {
    setBusy(true);
    await _barberServicesService.deleteService(serviceID: serviceID!);
    print('I am deleting at the view model');
  }
}
