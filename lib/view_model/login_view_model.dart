// import 'package:firebase_auth/firebase_auth.dart';

// import '../models/customerUserSide/customer_registration_model.dart';
// import '../models/barberUserSide/barber_registration_model.dart';

import 'dart:async';

import '../app/service_locator/service_locator.dart';
import 'base_view_model.dart';

class LoginViewModel extends BaseModel {
  AuthenticationServiceFirebase get _authService =>
      locator<AuthenticationServiceFirebase>();
  // User? get user => _authService.user;

  Future<void> signIn({required String email, required String password}) async {
    // if (user != null) return; // sign in only if not signed in
    setBusy(true);
    try {
      await _authService.signIn(email: email, password: password);
    } catch (e) {
      rethrow;
    } finally {
      setBusy(false);
    }
  }
}
