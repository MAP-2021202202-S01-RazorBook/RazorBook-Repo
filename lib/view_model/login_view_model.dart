import 'package:firebase_auth/firebase_auth.dart';

import '../models/customerUserSide/customer_registration_model.dart';
import '../models/barberUserSide/barber_registration_model.dart';

loginAttempt(String email, String password) async {
  return await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
}
