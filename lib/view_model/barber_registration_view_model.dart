import '../models/barberUserSide/barber_registration_model.dart';

// Future barberInfo(String shopName, String contact, String location,
//     String locationOnMap, String email, String password) async {
//   BarberDatabaseManager newBarber = BarberDatabaseManager();

//   return await newBarber.addNewBarber(
//       shopName, contact, location, locationOnMap, email, password);
// }

import 'dart:async';

import 'package:flutter/foundation.dart';

import '../app/service_locator/service_locator.dart';
import 'base_view_model.dart';

class BarbershopSignUpViewModel extends BaseModel {
  AuthenticationService get _authService => locator<AuthenticationService>();

  Future<void> barbershopSignup({required String email, required String password, required String name, required String phone, required String address, required String openTime, required String closeTime, required String description}) async {
    // if (user != null) return; // sign in only if not signed in
    setBusy(true);
    try {
      await _authService.barbershopSignup(email: email, password: password, name: name, phone: phone, address: address, openTime: openTime, closeTime: closeTime, description: description);
    } catch (e) {
      rethrow;
    } finally {
      setBusy(false);
    }
  }
}
