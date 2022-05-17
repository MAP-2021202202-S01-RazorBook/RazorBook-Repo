import 'dart:ui';

class BarberShopProfilePageModel {
  String shopName;
  String shopLocation;
  String aboutShop;
  String email;
  int visitedCustomers;
  String contactNumber;

  List<int> availableTimes;
  List<Map> services;
  String shopeImage;

  BarberShopProfilePageModel(
      this.shopName,
      this.shopLocation,
      this.aboutShop,
      this.email,
      this.contactNumber,
      this.availableTimes,
      this.services,
      this.visitedCustomers,
      this.shopeImage);
}
