import 'dart:ui';

class CustomerProfileModel {
  String name;
  String gender;
  int age;
  String email;
  String password;
  String contactNumber;
  String customerImage;

  CustomerProfileModel(this.age, this.contactNumber, this.customerImage,
      this.gender, this.name, this.email, this.password);
}
