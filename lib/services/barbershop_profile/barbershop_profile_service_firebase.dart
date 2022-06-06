import 'package:razor_book/services/customer/customer_service.dart';
import 'package:razor_book/views/signup_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:razor_book/services/barbershop_profile/barbershop_profile_service.dart';
import 'package:razor_book/models/user.dart';
import 'package:flutter/material.dart';
import '../../helpers/helper_widgets.dart';
import '../../models/user.dart';
import '../failure.dart';
import 'dart:developer';
import 'dart:io';

class BarbershopServiceFirebase extends BarbershopService {
  CollectionReference get _user =>
      FirebaseFirestore.instance.collection('users');

  String uId = 'eRiujAfrWASWbosQGToSO1wcmNz1';

  List<dynamic> _barbershopDetailsForCustomer = [];
  List<dynamic> _barbershopDetailsForBarber = [];
  List<dynamic> _barbershopsList = [];

  @override
  List<dynamic> get barbershopDetailsForCustomer => _barbershopDetailsForCustomer;
  @override
  List<dynamic> get barbershopDetailsForBarber => _barbershopDetailsForBarber;
  @override
  List<dynamic> get barbershopsList => _barbershopsList;

  @override
  Future<void> getBarbershopDetailsForBarber(String uuId) async {
    try {
      QuerySnapshot value =
          await _user.where('u_id', isEqualTo: uId).get();

      
      // final Map<String, dynamic> data =
           //value.docs[0].id;

      //_barbershopDetailsForBarber = value.docs[0].data() as List<dynamic>;


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

    Future<void> getBarbershopDetailsForCustomer(String uuId) async {
    try {
      QuerySnapshot value =
          await _user.where('u_id', isEqualTo: uId).get();
      
      // final Map<String, dynamic> data =
           //value.docs[0].id;
      
      _barbershopDetailsForCustomer.add(value.docs[0].get("name"));
      _barbershopDetailsForCustomer.add(value.docs[0].get("u_id"));
      _barbershopDetailsForCustomer.add(value.docs[0].get("address"));

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

  @override
  Future<void> updateBarbershopDetails(String id, String name, double slot_length, String description, String open_time, String close_time, String phone, String address, var open_days) async {
    try {
      String dId = 'UYEgMC6G36VJBntvn99r'; //document id
      //final value = await _registeree.where("u_id", isEqualTo: uId);
      //print(value);

      await _user.doc(dId).update({
        //dummy data for testing, approved
        "name": "Testee",
        "phone": "055055055",
        "slot_length": 1.0,
        "description": "lorem ipsum",
        "open_time": "12:12",
        "close_time": "21:21:",
        "address": "123",
        "open_days": ["Sunday", "Monday", "Tuesday"]
      }).then((value) {
        //log("saving profile ${user.customerToFirestore()}");
        // ScaffoldMessenger.of(ctx).showSnackBar(mySnackBar("Profile Updated"));
      }).onError((error, stackTrace) {
        // ScaffoldMessenger.of(ctx)
        //     .showSnackBar(mySnackBar(error.toString(), error: true));
      });
    } on SocketException catch (e) {
      // ScaffoldMessenger.of(ctx)
      //     .showSnackBar(mySnackBar(e.toString(), error: true));

      throw Exception(e);
    } catch (e) {
      // ScaffoldMessenger.of(ctx)
      //     .showSnackBar(mySnackBar(e.toString(), error: true));

      throw Exception(e);
    }
  }
  
  @override
  Future<void> getBarbershopsList() async {
       try {
      QuerySnapshot value =
          await _user.where('user_type', isEqualTo: 'barber').get();
      
      // final Map<String, dynamic> data =
           //value.docs[0].id;
      for(int i = 0; i < value.docs.length; i++) {
      _barbershopsList.add({value.docs[i].get("name"), value.docs[i].get("u_id"), value.docs[i].get("address")});
      }
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