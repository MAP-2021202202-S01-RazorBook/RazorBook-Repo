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
  CollectionReference get _usersCollection =>
      FirebaseFirestore.instance.collection('users');

  String uId = 'eRiujAfrWASWbosQGToSO1wcmNz1';

  Map<String, dynamic>? _barbershopDetailsForCustomer;
  Map<String, dynamic>? _barbershopDetailsForBarber;
  final List<Map<String, dynamic>?> _barbershopsList = [];

  @override
  Map<String, dynamic>? get barbershopForCustomer =>
      _barbershopDetailsForCustomer;
  @override
  Map<String, dynamic>? get barbershopProfileForBarber =>
      _barbershopDetailsForBarber;
  @override
  List<Map<String, dynamic>?>? get barbershopsList => _barbershopsList;

  @override
  Future<void> getBarbershopDetailsForBarber(String uId) async {
    try {
      QuerySnapshot value =
          await _usersCollection.where('u_id', isEqualTo: uId).get();

      if (value.docs.isNotEmpty) {
        _barbershopDetailsForBarber =
            (value.docs.first.data() as Map<String, dynamic>);
      }
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
  Future<void> getBarbershopDetailsForCustomer(String uId) async {
    try {
      QuerySnapshot value =
          await _usersCollection.where('u_id', isEqualTo: uId).get();

      if (value.docs.isNotEmpty) {
        _barbershopDetailsForCustomer =
            value.docs[0].data() as Map<String, dynamic>;
      }
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
  Future<void> updateBarbershopDetails(
    User updatedBarberShop,
  ) async {
    try {
      String dId = updatedBarberShop.docId ?? 'UYEgMC6G36VJBntvn99r';

      await _usersCollection.doc(dId).update(updatedBarberShop.toJson());
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
          await _usersCollection.where('user_type', isEqualTo: 'barber').get();

      // final Map<String, dynamic> data =
      //value.docs[0].id;
      for (int i = 0; i < value.docs.length; i++) {
        _barbershopsList.add(value.docs[i].data() as Map<String, dynamic>);
      }
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
