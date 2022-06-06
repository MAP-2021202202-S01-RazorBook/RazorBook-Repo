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

  // User customer = User.customer(u_id: "", user_type: "Customer");
  // User get customerDetailsForCustomer => customer;
  //User? get customerDetailsForBarber => null;


  List<dynamic> _customerDetailsForCustomer = [];

  @override
  List<dynamic> get customerDetailsForCustomer => _customerDetailsForCustomer;

  String uId = 'eRiujAfrWASWbosQGToSO1wcmNz1';

  @override
  Future<void> getCustomerDetailsForCustomer(String uuId) async {
    try {
      QuerySnapshot value =
          await _registeree.where('u_id', isEqualTo: uId).get();
      
      // final Map<String, dynamic> data =
      //     value.docs[0].data() as Map<String, dynamic>;

      //User customer = value.docs.map((value) => User.fromFirestore(value)) as User;

      //for testing, approved
      print(value.docs.length);

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
      CollectionReference _registeree =
          FirebaseFirestore.instance.collection('users');
      String dId = '0DEPzMAgJji5MoIjvoGY'; //document id
      //final value = await _registeree.where("u_id", isEqualTo: uId);

      //print(value);

      await _registeree.doc(dId).update({
        //dummy data for testing, approved
        "name": "Testee",
        "phone": "055055055",
        "address": "123 Skudai"
      }).then((value) {
        //log("saving profile ${user.customerToFirestore()}");
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
  
  @override
  Future<void> getCustomerDetailsForBarber(String uId) async{
  try {
      QuerySnapshot value =
          await _registeree.where('u_id', isEqualTo: uId).get();
      
      // final Map<String, dynamic> data =
           //value.docs[0].id;
      
      _customerDetailsForCustomer.add(value.docs[0].get("name"));
      _customerDetailsForCustomer.add(value.docs[0].get("u_id"));
      _customerDetailsForCustomer.add(value.docs[0].get("address"));
      _customerDetailsForCustomer.add(value.docs[0].get("phone"));

      //User customer = value.docs.map((value) => User.fromFirestore(value)) as User;
      //for testing, approved
      //print(value.docs.length);

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
}
