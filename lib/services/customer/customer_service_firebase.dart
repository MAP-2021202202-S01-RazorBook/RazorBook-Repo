import 'package:razor_book/services/customer/customer_service.dart';
import 'package:razor_book/views/signup_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:razor_book/models/user.dart';
import 'package:flutter/material.dart';
import '../../helpers/helper_widgets.dart';
import '../../models/user.dart';
import '../failure.dart';
import 'dart:developer';
import 'dart:io';

class CustomerServiceFirebase extends CustomerService {
  CollectionReference get _registeree =>
      FirebaseFirestore.instance.collection('users');

  @override
  Future<User> getCustomerDetails(String uId) async {
    try {
      QuerySnapshot value =
          await _registeree.where('u_id', isEqualTo: uId).get();
      final Map<String, dynamic> data =
          value.docs[0].data() as Map<String, dynamic>;
      log(data.toString());
      //need to fix the issue here since it return a document not an object
      return User.fromFirestore(data);
    } on FirebaseException catch (e) {
      throw Failure(100,
          message: e.toString(),
          location:
              'CounterServiceFireStore.getCustomerDetails() on FirebaseException');
    } catch (e) {
      throw Failure(101,
          message: e.toString(),
          location:
              'CounterServiceFireStore.getCustomerDetails() on other exception');
    }
  }

  @override
  Future<void> updateCustomerDetails(User user, ctx) async {
    try {
      await _registeree.doc(user.u_id).update(user.toFirestore()).then((value) {
        log("saving profile ${user.toFirestore()}");
        ScaffoldMessenger.of(ctx).showSnackBar(mySnackBar("Profile Updated"));
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
