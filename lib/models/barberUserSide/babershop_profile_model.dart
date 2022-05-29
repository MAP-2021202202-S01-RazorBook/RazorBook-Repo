import 'dart:ui';

class BarberShopProfilePageModel {
  String shopName;
  String shopLocation;
  String locationOnMap;
  int customers;
  int ranking;
  int profileViews;
  String contactNumber;

  List<int> availableTimes;
  List<Map> services;
  String shopeImage;

  BarberShopProfilePageModel(
      this.profileViews,
      this.ranking,
      this.locationOnMap,
      this.shopName,
      this.shopLocation,
      this.contactNumber,
      this.availableTimes,
      this.services,
      this.customers,
      this.shopeImage);
}
