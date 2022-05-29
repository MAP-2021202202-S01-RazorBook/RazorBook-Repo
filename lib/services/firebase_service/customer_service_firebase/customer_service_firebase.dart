// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomerDatabaseManager {
  final CollectionReference customerRegisteree =
      FirebaseFirestore.instance.collection('customers');

  Future<void> addNewCustomer(String name, String age, String gender,
      String contact, String email, String password) async {
    await customerRegisteree
        .add({
          'name': name,
          'age': age,
          'gender': gender,
          'contact': contact,
          'email': email,
          'isCustomer': true
        })
        .then((value) => null)
        .onError((error, stackTrace) {
          print("error ${error.toString()}");
        });

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => null)
        .onError((error, stackTrace) {
      print("error ${error.toString()}");
    });
  }
}
