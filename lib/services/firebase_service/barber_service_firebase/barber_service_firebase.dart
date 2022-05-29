// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:razor_book/helpers/helper_widgets.dart';
import 'package:razor_book/models/barberUserSide/babershop_profile_model.dart';

class BarbarFirebaseSerivce {
  List<BarberShopProfilePageModel>? barbershopList;

  final CollectionReference barberRegisteree =
      FirebaseFirestore.instance.collection('barbers');
  final CollectionReference newBarberRegisteree =
      FirebaseFirestore.instance.collection('barbers_profile');

  Future<void> addNewBarber(String shopName, String contact, String location,
      String locationOnMap, String email, String password) async {
    await barberRegisteree
        .add({
          'shop name': shopName,
          'contact': contact,
          'location': location,
          'location on map': locationOnMap,
          'email': email,
          'isCustomer': false
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

  Future<List<BarberShopProfilePageModel>?> getBarberProfile(
      BuildContext ctx) async {
    log("GETTING BARBER SHOP LIST");
    try {
      final x = await newBarberRegisteree.get().then((value) {
        barbershopList = <BarberShopProfilePageModel>[];
        for (var element in value.docs) {
          final Map<String, dynamic> data =
              element.data() as Map<String, dynamic>;
          BarberShopProfilePageModel barbershop =
              BarberShopProfilePageModel.fromMap(data, element.id);
          barbershopList!.add(barbershop);
        }
        log(barbershopList!.length.toString());
        return barbershopList;
      }).catchError((error) {
        ScaffoldMessenger.of(ctx)
            .showSnackBar(mySnackBar(error.toString(), error: true));
      });
      return x;
    } catch (e) {
      ScaffoldMessenger.of(ctx)
          .showSnackBar(mySnackBar(e.toString(), error: true));
      throw Exception(e);
    }
  }
}
