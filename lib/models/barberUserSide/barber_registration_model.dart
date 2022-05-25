import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class BarberDatabaseManager {

final CollectionReference barberRegisteree = FirebaseFirestore.instance.collection('barbers');

Future<void> addNewBarber(String shopName, String contact, String location,
String locationOnMap, String email, String password) async{

   await barberRegisteree.add({
    'shop name': shopName,
    'contact': contact,
    'location': location,
    'location on map': locationOnMap,
    'email': email,
    'isCustomer': false
  }).then((value) => null).onError((error, stackTrace){print("error ${error.toString()}");});

  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
  .then((value) => null).onError((error, stackTrace){print("error ${error.toString()}");});
}
}
