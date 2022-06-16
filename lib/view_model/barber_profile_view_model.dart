import 'dart:developer';

import 'package:razor_book/view_model/base_view_model.dart';

import '../app/service_locator/service_locator.dart';
import '../models/user.dart';
import '../services/barber_services/barber_services_service.dart';
import '../services/barbershop_profile/barbershop_profile_service.dart';
import '../services/file_upload_service/file_upload_service.dart';

class BarberProfileViewModel extends BaseModel {
  final _barberProfileService = locator<BarbershopService>();
  final _barberServicesService = locator<BarberServicesService>();
  Map<String, dynamic>? _barberProfileForBarber;
  Map<String, dynamic>? _barberProfileForCustomer;
  Map<String, dynamic>? get barbershopProfileForBarber =>
      _barberProfileForBarber;
  Map<String, dynamic>? get barbershopForCustomer => _barberProfileForCustomer;
  List<Map<String, dynamic>?>? _barbershopList;
  List<Map<String, dynamic>?>? get barbershopList => _barbershopList;

  final _fileUploadService = locator<FileUploadService>();
  String? _imgUrl;
  String? get imgUrl {
    log("using view model imgrul");
    return _imgUrl;
  }

  void setImgUrl(String? value) {
    _imgUrl = value;
    notifyListeners();
  }

  set barbershopList(List<Map<String, dynamic>?>? value) {
    _barbershopList = value;
    notifyListeners();
  }

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
      _barberProfileForBarber?['servicesNames'] = _barberServicesService
          .servicesList
          ?.map((service) => service.name)
          .toList();
      barberWorkingDays = _barberProfileForBarber?['open_days'] ?? [];

      _barberProfileForBarber?['image'] =
          _imgUrl ?? _barberProfileForBarber?['image'];
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
      log('updating payload $payload');
      // print(User.fromJson(payload ?? {}).toJson());

      await _barberProfileService
          .updateBarbershopDetails(User.fromJson(payload ?? {}));
      // );
    } catch (e) {
      print(e);
    }
  }

  Future<void>? getAllBarbershops() async {
    try {
      /// avoid duplicates
      // barbershopList?.clear();
      _barbershopList?.clear();
      await _barberProfileService.getBarbershopsList();
      _barbershopList = _barberProfileService.barbershopsList;
      log("barbershop list: $barbershopList");
    } catch (e) {
      // setBusy(false);
      print(e);
    }
  }

  Future<void>? getBarbershopDetailsForCustomer(String? barbershopID) async {
    try {
      await _barberProfileService
          .getBarbershopDetailsForCustomer(barbershopID!);
      _barberProfileForCustomer = _barberProfileService.barbershopForCustomer;
    } catch (e) {
      // setBusy(false);
      print(e);
    }
  }

  List<User>? searchShopList(String name) {
    List<User>? filteredList = [];
    log("_barbershopList: ${_barbershopList!.length}");
    if (_barbershopList != null) {
      if (_barbershopList!.isNotEmpty) {
        for (var shop in _barbershopList!) {
          if (shop!['name'].toLowerCase().contains(name.toLowerCase())) {
            filteredList.add(User.fromJson(shop));
          }
        }
      }
      log("filtered list: ${filteredList.length}");
      return filteredList;
    }
    return [];
  }

  Future<void>? uploadFile(String filePath, String fileName) async {
    try {
      setBusy(true);
      await _fileUploadService.uploadFile(filePath, fileName);
      _imgUrl = await _fileUploadService.getDownloadUrl(fileName);
      setBusy(false);
    } catch (e) {
      log(e.toString());
    }
  }
}
