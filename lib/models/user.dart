import 'dart:ffi';

class User {
  String u_id;
  String email;
  String user_type;
  String? name;
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

  factory User.fromFirestore(Map<String, dynamic> data) {
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
        bookings: data['bookings'],
        services: data['services'],
        rating: data['rating'],
        open_days: data['open_days'],
        slot_length: data['slot_length'],
        start_time: data['start_time'],
        close_time: data['close_time'],
      );
    } else {
      return User.customer(
        u_id: data['u_id'],
        email: data['email'],
        user_type: data['user_type'],
        name: data['name'],
        address: data['address'],
        location: data['location'],
        phone: data['phone'],
        image: data['image'],
        bookings: data['bookings'],
      );
    }
  }

  // user to firestore
  Map<String, dynamic> toFirestore() {
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
      'start_time': start_time,
      'close_time': close_time,
    };
  }
}
