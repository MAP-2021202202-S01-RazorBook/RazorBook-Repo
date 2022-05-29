class CustomerProfileModel {
  late String name;
  late String gender;
  late int age;
  late String email;
  //get after login
  late String uid;
  late String contactNumber;
  late String customerImage;
  late String address;
  late String docId;

  CustomerProfileModel({
    required this.age,
    required this.contactNumber,
    required this.customerImage,
    required this.gender,
    required this.name,
    required this.email,
    required this.uid,
    required this.address,
    required this.docId,
  });

  CustomerProfileModel.formMap(Map<String, dynamic> map, [String? d]) {
    name = map['name'];
    gender = map['gender'];
    contactNumber = map['contact'];
    email = map['email'];
    customerImage = map['customerImage'] ?? "";
    uid = map['uid'] ?? "";
    address = map['address'] ?? "Some where";
    docId = map['docId'] ?? d;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'contact': contactNumber,
      'email': email,
      'customerImage': customerImage,
      'uid': uid,
      'address': address,
      'docId': docId,
    };
  }
}
