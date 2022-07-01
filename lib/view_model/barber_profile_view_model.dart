import 'dart:developer';
import 'dart:ffi';

import 'package:razor_book/services/map_services/maps_services.dart';
import 'package:razor_book/view_model/base_view_model.dart';

import '../app/service_locator/service_locator.dart';
import '../models/user.dart';
import '../services/barber_services/barber_services_service.dart';
import '../services/barbershop_profile/barbershop_profile_service.dart';
import '../services/file_upload_service/file_upload_service.dart';

class BarberProfileViewModel extends BaseModel {
  final _barberProfileService = locator<BarbershopService>();
  final _barberServicesService = locator<BarberServicesService>();

  // openMap service
  final _openMap = locator<MapServices>();

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

  void updateLocationDetails(String lat, String lng) {
    _barberProfileForBarber?["location"]["lat"] = lat;
    _barberProfileForBarber?["location"]["lng"] = lng;
  }

  // i had to change the status from Final To var
  //the reason is mentioned in the updateBarberProfile methond
  var _currentUser = locator<AuthenticationService>().currentUser;
  User? get currentUser {
    return _currentUser;
  }

  set currentUser(User? user) {
    _currentUser = user;
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

      print('updating payload ${payload?["paypal_email"]}');
      // print(User.fromJson(payload ?? {}).toJson());

      /* i had to assign the new value collected after edting the profile details. 
        it works fine with it , it will update the data in firebase but there will be an issue later on
        once you redo the same process again but this time you don't edit the same fields as first time
        those fields will contains the first values !! which you have already modified them.
        the reasone because we are not overwritting the current user data that we assign them to payload in line 75.
        so basically it will send the same previous data to firebase which has not be overwritten in line 77 (addAll)
       */
      //important to read the above comment to not mess up with this line
      currentUser = User.fromJson(payload ?? {});

      await _barberProfileService
          .updateBarbershopDetails(User.fromJson(payload ?? {}));
      // );
    } catch (e) {
      print(e);
    }
  }

  Future<void>? getAllBarbershops() async {
    try {
      await _barberProfileService.getBarbershopsList();
      _barbershopList = _barberProfileService.barbershopsList;
      // log("barbershop list: $_barbershopList");
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

  Future<void> openMap(String latitude, String longitude) async {
    //if any of coord is not provide it will display lat and lng of 0, 0
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=0,0';

    if (latitude.isNotEmpty && longitude.isNotEmpty) {
      googleUrl =
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    }

    await _openMap.openLocationOnMap(googleUrl);
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
