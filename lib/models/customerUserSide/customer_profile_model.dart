import 'dart:ui';

class CustomerProfileModel {
  String name;
  String gender;
  int age;
  String contactNumber;
  Image customerImage;

  CustomerProfileModel(
      this.age, this.contactNumber, this.customerImage, this.gender, this.name);
}
