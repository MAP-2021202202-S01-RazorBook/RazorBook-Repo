// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  String? id;
  String sh_id;
  double price;
  String name;
  String? description;

// default constructor
  Service({
    this.id,
    required this.sh_id,
    required this.price,
    required this.name,
    this.description,
  });

// booking from firestore
// you pass in the data from firestore snapshot
// e.g.
// final docRef = db.collection("users").doc("1111111111");
// docRef.get().then(
//   (DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     final user = User.fromFirestore(data);
//     // ...
//   },
//   onError: (e) => print("Error getting document: $e"),
// );

  // from json
  factory Service.fromJson(Map<String, dynamic>? json) {
    return Service(
        id: json!['id'] as String,
        sh_id: json['sh_id'] as String,
        price: json['price'] as double,
        name: json['name'] as String,
        description: json['description'] as String);
  }

// from firebase snapshot
  factory Service.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final id = doc.id;
    // print("thi is my: " + id);

    return Service(
      id: id,
      sh_id: data['sh_id'] as String,
      price: data['price'] as double,
      name: data['name'] as String,
      description: data['description'] as String?,
    );
  }

  // to json
  Map<String, dynamic> toJson() => {
        "sh_id": sh_id,
        "price": price,
        "name": name,
        "description": description,
      };
}
