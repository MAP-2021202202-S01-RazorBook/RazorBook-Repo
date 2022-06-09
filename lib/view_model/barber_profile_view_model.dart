import 'package:razor_book/view_model/base_view_model.dart';

import '../app/service_locator/service_locator.dart';
import '../models/user.dart';
import '../services/barber_services/barber_services_service.dart';
import '../services/barbershop_profile/barbershop_profile_service.dart';

class BarberProfileViewModel extends BaseModel {
  final _barberProfileService = locator<BarbershopService>();
  final _barberServicesService = locator<BarberServicesService>();
  Map<String, dynamic>? _barberProfileForBarber;
  Map<String, dynamic>? _barberProfileForCustomer;
  Map<String, dynamic>? get barbershopProfileForBarber =>
      _barberProfileForBarber;
  Map<String, dynamic>? get barbershopForCustomer => _barberProfileForCustomer;
  final _currentUser = locator<AuthenticationService>().currentUser;
  User? get currentUser {
    return _currentUser;
  }

  Future<void> logout() async {
    await locator<AuthenticationService>().signOut();
  }

  List<dynamic> barberWorkingDays = [];

  Future<void>? getBarbershopDetailsForBarber() async {
    try {
      await _barberProfileService
          .getBarbershopDetailsForBarber(_currentUser?.u_id ?? '');
      _barberProfileForBarber =
          _barberProfileService.barbershopProfileForBarber;

      // get the services for this barber and embed it in the map
      await _barberServicesService.getServices(
          userID: _currentUser?.u_id ?? '');
      print("regetting");
      _barberProfileForBarber?['servicesNames'] = _barberServicesService
          .servicesList
          ?.map((service) => service.name)
          .toList();
      barberWorkingDays = _barberProfileForBarber?['open_days'] ?? [];
      print(_barberProfileForBarber?["servicesNames"]);
    } catch (e) {
      // setBusy(false);
      print(e);
    }
  }

  Future<void>? updateBarberProfile(Map<String, dynamic>? barberProfile) async {
    try {
      // await _barberProfileService.updateBarberProfile(barberProfile);
      print("updating barber profile");

      // from the barberProfile map, remove any empty values
      barberProfile?.removeWhere(
          (key, value) => value == null || value == '' || value == []);

      Map<String, dynamic>? payload = currentUser?.toJson();
      // print(payload);
      payload?.addAll(barberProfile ?? {});
      // print(payload);
      // print(User.fromJson(payload ?? {}).toJson());

      await _barberProfileService
          .updateBarbershopDetails(User.fromJson(payload ?? {}));
      // );
    } catch (e) {
      print(e);
    }
  }
}