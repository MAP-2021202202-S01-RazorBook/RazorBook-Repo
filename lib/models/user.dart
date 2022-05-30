import 'dart:ffi';

class User {
  String u_id;
  String email;
  String? name;
  String user_type;
  String? address;
  Map<String, dynamic>? location;
  String? phone;
  String? image;
  String? description;
  List<String>? bookings;
  List<String>? services;
  Map<String, dynamic>? rating;
  List<String>? open_days;
  Double? slot_length;
  String? start_time;
  String? close_time;

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
    this.start_time,
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

  // // Object to firebase document
  // Map<String, dynamic> barberToJSON() {
  //   return {
  //     'u_id': u_id,
  //     'email': email,
  //     'name': name,
  //     'user_type': user_type,
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
  //     'start_time': start_time,
  //     'close_time': close_time,
  //   };
  // }

  // // Document to object
  // User.fromJson(Map<String, dynamic> firebaseDoc)
  //     : this.barber(
  //         u_id: firebaseDoc['u_id'],
  //         email: firebaseDoc['email'],
  //         name: firebaseDoc['name'],
  //         user_type: firebaseDoc['user_type'],
  //         address: firebaseDoc['address'],
  //         location: firebaseDoc['location'],
  //         phone: firebaseDoc['phone'],
  //         image: firebaseDoc['image'],
  //         description: firebaseDoc['description'],
  //         bookings: firebaseDoc['bookings'],
  //         services: firebaseDoc['services'],
  //         rating: firebaseDoc['rating'],
  //         open_days: firebaseDoc['open_days'],
  //         slot_length: firebaseDoc['slot_length'],
  //         start_time: firebaseDoc['start_time'],
  //         close_time: firebaseDoc['close_time'],
  //       );

  // // Object to firebase document
  // Map<String, dynamic> customerToJSON() {
  //   return {
  //     'u_id': u_id,
  //     'email': email,
  //     'name': name,
  //     'user_type': user_type,
  //     'address': address,
  //     'location': location,
  //     'phone': phone,
  //     'image': image,
  //     'bookings': bookings
  //   };
  // }

  // // Document to object
  // User.customerFromJSON(Map<String, dynamic> firebaseDoc)
  //     : this.customer(
  //         u_id: firebaseDoc['u_id'],
  //         email: firebaseDoc['email'],
  //         name: firebaseDoc['name'],
  //         user_type: firebaseDoc['user_type'],
  //         address: firebaseDoc['address'],
  //         location: firebaseDoc['location'],
  //         phone: firebaseDoc['phone'],
  //         image: firebaseDoc['image'],
  //         // decode the bookings
  //         bookings: List<String>.from(firebaseDoc['bookings']),
  //       );
}
