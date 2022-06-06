import 'package:flutter/cupertino.dart';
import 'package:razor_book/models/user.dart';

//this abstract class is used by two user-type sides to return the shops details.

abstract class BarbershopService {
  //in the implementation we would override it and return a local instance in the implemention
  User? get barbershopProfileForBarber => null;
  List<dynamic>? get barbershopForCustomer => null;
  List<dynamic>? get allBarbers => null;
  //return all shops once the customer loads the main page +also include the search
  List<dynamic>? get barbershopsList => null;

  //Future<void> rateShopExperience(String? c_id, String? b_id, int? rate);

  //DONE: get barbers list



  //Future<void> getAllBarbershops(String? search);
  Future<void> getBarbershopDetailsForBarber(String uId);
  Future<void> getBarbershopDetailsForCustomer(String uId);
  Future<void> getBarbershopsList();
  //Future<Image> _loadBarbershopProfileImage(String uId);

  //including updating list of working days
  //also includes the latitude and the longitude of the store location
  Future<void> updateBarbershopDetails(String id, String name, double slot_length, String description, String open_time, String close_time, String phone, String address, var open_days);
  //Future<void> _storeBarbershopProfileImage();

  //the function return type need to be defined later after installing the package
  //for imagePicker https://pub.dev/packages/image_picker
  //this function allows barbershop to change their profile image based on photos selected
  //from their gallary, then these photos are stored in the firebase storage to fetched later
  //Future<void> addNewBarbershopFromGallary();

  //Future<void> _openBarbershopLocationOnMap(double latitude, double longitude);
}
