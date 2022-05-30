// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/helpers/helper_widgets.dart';
import 'package:razor_book/models/customerUserSide/customer_profile_model.dart';

class CustomerServiceFirebase {
  final CollectionReference customerRegisteree =
      FirebaseFirestore.instance.collection('customers');

  Future<void> addNewCustomer(String name, String age, String gender,
      String contact, String email, String password) async {
    /// later
    /// use toMap() -->
    /// use uid for docId
    await customerRegisteree
        .add({
          'name': name,
          'age': age,
          'gender': gender,
          'contact': contact,
          'email': email,
          'isCustomer': true //
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

  Future<CustomerProfileModel?> getCustomerProfile(String uid) async {
    log("[+] GETTING PROFILE [+]");
    final value = await customerRegisteree.where('uid', isEqualTo: uid).get();
    final Map<String, dynamic> data =
        value.docs[0].data() as Map<String, dynamic>;
    log(data.toString());
    log(value.docs[0].id);
    CustomerProfileModel cusProfile =
        CustomerProfileModel.formMap(data, value.docs[0].id);
    log(cusProfile.toMap().toString());

    localStorageServiceProvider.saveCusProfile(cusProfile);
    localStorageServiceProvider.readCusProfile();
    Future.delayed(const Duration(milliseconds: 300));
    return cusProfile;
  }

  /// TODO: CALL FROM PROFILE VIEW MODEL
  updateCustomerProfile(CustomerProfileModel cusProfile, ctx) async {
    try {
      await customerRegisteree
          .doc(cusProfile.docId)
          .update(cusProfile.toMap())
          .then((value) {
        log("saving profile ${cusProfile.toMap()}");
        ScaffoldMessenger.of(ctx).showSnackBar(mySnackBar("Profile Updated"));

        localStorageServiceProvider.saveCusProfile(cusProfile);
        localStorageServiceProvider.readCusProfile();
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(ctx)
            .showSnackBar(mySnackBar(error.toString(), error: true));
      });
    } on SocketException catch (e) {
      ScaffoldMessenger.of(ctx)
          .showSnackBar(mySnackBar(e.toString(), error: true));

      throw Exception(e);
    } catch (e) {
      ScaffoldMessenger.of(ctx)
          .showSnackBar(mySnackBar(e.toString(), error: true));

      throw Exception(e);
    }
  }
}
