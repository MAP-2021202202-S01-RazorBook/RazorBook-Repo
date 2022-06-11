// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  /// how about that
  ///[Barber]? barber;
  ///[Customer]? customer;
  /// So i can call [User.customer] or [User.barber]
  ///
  String u_id;
  String email;
  String? user_type;
  String? name;
  String? address;
  dynamic location;
  String? phone;
  String? image;
  String? description;
  List<dynamic>? bookings;
  List<dynamic>? services;
  List<dynamic>? rating;
  List<dynamic>? open_days;
  double? slot_length;
  String? open_time;
  String? close_time;
  String? docId;
// defauly constructor, only used upon login or something
  User({
    required this.u_id,
    required this.email,
    this.user_type,
    this.name,
    this.address,
    this.location,
    this.phone,
    this.image,
    this.description,
    this.bookings,
    this.services,
    this.rating,
    this.open_days,
    this.slot_length,
    this.open_time,
    this.close_time,
    this.docId,
  });

  // Barber constructor
  User.barber({
    required this.u_id,
    required this.email,
    required this.user_type,
    this.name,
    this.address,
    this.location,
    this.phone,
    this.image,
    this.description,
    this.bookings,
    this.services,
    this.rating,
    this.open_days,
    this.slot_length,
    this.open_time,
    this.close_time,
  });

  // Customer constructor
  User.customer({
    required this.u_id,
    required this.email,
    required this.user_type,
    this.name,
    this.address,
    this.location,
    this.phone,
    this.image,
    this.bookings,
  });

// user from firestore
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

  factory User.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final id = doc.id;

    if (data['user_type'] == 'barber') {
      return User.barber(
        u_id: data['u_id'],
        email: data['email'],
        user_type: data['user_type'],
        name: data['name'],
        address: data['address'],
        location: data['location'],
        phone: data['phone'],
        image: data['image'],
        description: data['description'],
        bookings: data['bookings'] is Iterable
            ? List.from(data['bookings'])
            : data['bookings'],
        services: data['services'] is Iterable
            ? List.from(data['services'])
            : data['services'],
        rating: data['rating'],
        open_days:
            data['open_days'] is Iterable ? List.from(data['open_days']) : null,
        slot_length: data['slot_length'],
        open_time: data['open_time'],
        close_time: data['close_time'],
      );
    } else {
      return User.customer(
        u_id: data['u_id'] as String,
        email: data['email'] as String,
        user_type: data['user_type'] as String,
        name: data['name'] as String,
        address: data['address'] as String,
        location: data['location'],
        phone: data['phone'] as String,
        image: data['image'],
        bookings: data['bookings'] is Iterable
            ? List.from(data['bookings'])
            : data['bookings'],
      );
    }
  }

  factory User.fromJson(Map<String, dynamic> data) {
    if (data['user_type'] == 'barber') {
      return User.barber(
        u_id: data['u_id'],
        email: data['email'],
        user_type: data['user_type'],
        name: data['name'],
        address: data['address'],
        location: data['location'],
        phone: data['phone'],
        image: data['image'],
        description: data['description'],
        bookings: data['bookings'] is Iterable
            ? List.from(data['bookings'])
            : data['bookings'],
        services: data['services'] is Iterable
            ? List.from(data['services'])
            : data['services'],
        rating: data['rating'],
        open_days:
            data['open_days'] is Iterable ? List.from(data['open_days']) : null,
        slot_length: data['slot_length'],
        open_time: data['open_time'],
        close_time: data['close_time'],
      );
    } else {
      return User.customer(
        u_id: data['u_id'] as String,
        email: data['email'] as String,
        user_type: data['user_type'] ?? 'customer',
        name: data['name'] ?? '',
        address: data['address'] ?? '',
        location: data['location'],
        phone: data['phone'] ?? "",
        image: data['image'] ?? "",
        bookings: data['bookings'] is Iterable
            ? List.from(data['bookings'])
            : data['bookings'],
      );
    }
  }
  // user to firestore
  Map<String, dynamic> barberToFirestore() {
    return {
      'u_id': u_id,
      'email': email,
      'user_type': user_type,
      'name': name,
      'address': address,
      'location': location,
      'phone': phone,
      'image': image,
      'description': description,
      'bookings': bookings,
      'services': services,
      'rating': rating,
      'open_days': open_days,
      'slot_length': slot_length,
      'close_time': close_time,
    };
  }

  Map<String, dynamic> customerToFirestore() {
    return {
      'u_id': u_id,
      'email': email,
      'user_type': user_type,
      'name': name,
      'address': address,
      'phone': phone,
      'image': image,
      'bookings': bookings,
    };
  }

  // USER to json
  Map<String, dynamic> toJson() {
    if (user_type != "customer") {
      return customerToFirestore();
    } else {
      return barberToFirestore();
    }
  }
  //   return {
  //     'u_id': u_id,
  //     'email': email,
  //     'user_type': user_type,
  //     'name': name,
  //     'address': address,
  //     'location': location,
  //     'phone': phone,
  //     'image': image,
  //     'description': description,
  //     'bookings': bookings,
  //     'services': services,
  //     'rating': rating,
  //     'open_days': open_days,
  //     'slot_length': slot_length,
  //     'open_time': open_time,
  //     'close_time': close_time,
  //   };
  // }
}
