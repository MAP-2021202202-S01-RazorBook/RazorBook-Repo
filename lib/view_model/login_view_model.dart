import 'package:firebase_auth/firebase_auth.dart';

import '../models/customerUserSide/customer_registration_model.dart';
import '../models/barberUserSide/barber_registration_model.dart';



loginAttempt(String email, String password){

  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
  .then((value) => null).onError((error, stackTrace){
    print("error ${error.toString()}");
    return Future.error(error.toString());
    }
    );

}