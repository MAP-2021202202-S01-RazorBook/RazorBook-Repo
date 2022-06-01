import 'package:flutter/cupertino.dart';
import 'package:razor_book/models/user.dart';

//this abstract class is used by two user-type sides to return the shops details.

abstract class BarbershopProfile {
  //in the implementation we would override it and return a local instance in the implemention
  User? get barbershopProfileForBarber => null;
  User? get barbershopForCustomer => null;
  //return all shops once the customer loads the main page +also include the search
  List<User>? get barbershopsList => null;

  Future<void> rateShopExperience(String? c_id, String? b_id, int? rate);

  Future<void> getAllBarbershops(String? search);
  Future<void> getBarberShopProfileDetails(String uId);
  Future<Image> _loadBarbershopProfileImage(String uId);

  //including updating list of working days
  //also includes the latitude and the longitude of the store location
  Future<void> updateBarberShopProfileDetails(User user);
  Future<void> _storeBarbershopProfileImage();

  //the function return type need to be defined later after installing the package
  //for imagePicker https://pub.dev/packages/image_picker
  //this function allows barbershop to change their profile image based on photos selected
  //from their gallary, then these photos are stored in the firebase storage to fetched later
  Future<void> addNewBarbershopFromGallary();

  Future<void> _openBarbershopLocationOnMap(double latitude, double longitude);
}
