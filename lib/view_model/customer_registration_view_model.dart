import '../models/customerUserSide/customer_registration_model.dart';


import 'dart:async';

import 'package:flutter/foundation.dart';

import '../app/service_locator/service_locator.dart';
import 'base_view_model.dart';

class CustomerSignUpViewModel extends BaseModel {
  AuthenticationService get _authService => locator<AuthenticationService>();

  Future<void> customerSignup({required String email, required String password, required String name, required String phone, required String address}) async {
    // if (user != null) return; // sign in only if not signed in
    setBusy(true);
    try {
      await _authService.customerSignup(email: email, password: password, name: name, phone: phone, address: address);
    } catch (e) {
      rethrow;
    } finally {
      setBusy(false);
    }
  }
}
