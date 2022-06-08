// ignore_for_file: library_prefixes, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:razor_book/views/signup_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../failure.dart';
import 'authentication_service.dart';
import '../../models/user.dart' as AppUser;
// import '../../models/user.dart'
//     as AppUser; // To resolve conflict with firebase 'User' class

// ignore: todo
// TODO: Add a user object which stores the logged in user

class AuthenticationServiceFirebase extends AuthenticationService {
  FirebaseAuth get _auth => FirebaseAuth.instance;

  CollectionReference get _usersCollection =>
      FirebaseFirestore.instance.collection('users');

  AppUser.User? _currentUser;

  @override
  Stream<AppUser.User?>? get authState {
    return _auth.authStateChanges().map(transformData);
  }

  @override
  AppUser.User? get currentUser {
    return _currentUser;
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await getUser(credential.user?.uid ?? '');
      print("in sign in method$_currentUser");
    } on FirebaseAuthException catch (e) {
      throw Failure(400,
          message: e.toString(),
          location: 'AuthenticationServiceFirebase.signIn()');
    } catch (e) {
      throw Failure(400,
          message: e.toString(),
          location: 'AuthenticationServiceFirebase.signIn()');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _currentUser = null;
    } on FirebaseAuthException catch (e) {
      throw Failure(500,
          message: e.toString(),
          location: 'AuthenticationServiceFirebase.signOut()');
    } catch (e) {
      throw Failure(501,
          message: e.toString(),
          location:
              'AuthenticationServiceFirebase.signOut() > other excecptions');
    }
  }

  @override
  Future<void> barbershopSignup(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String address,
      required String openTime,
      required String closeTime,
      required String description}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value.user != null) {
          //  userCollection.doc(value.user.uid).set({
          _usersCollection.add({
            'u_id': value.user?.uid,
            'email': email,
            'name': name,
            'phone': phone,
            'user_type': 'barber',
            'address': address,
            'open_time': openTime,
            'close_time': closeTime,
            'description': description,
            'bookings': [],
            'services': [],
            'rating': [],
            'location': [
              {'lat': 0.0, 'lng': 0.0}
            ],
            'image': "",
            'open_days': [],
            'slot_length': 0.5,
          });
        } else {
          throw Error();
        }
      });
    } catch (err) {
      print(err.toString);
    }
  }

  @override
  Future<void> customerSignup(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String address}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value.user != null) {
          //  userCollection.doc(value.user.uid).set({
          _usersCollection.add({
            'u_id': value.user?.uid,
            'email': email,
            'name': name,
            'phone': phone,
            'user_type': 'customer',
            'address': address,
            'bookings': [],
            'image': "",
          });
        } else {
          throw Error();
        }
      });
    } catch (err) {
      print(err.toString);
    }
  }

  // The purpose of this function is to transform the document from firestore to a user object

  @override
  AppUser.User? transformData(firebaseUserData) {
    print("transformData running");
    if (firebaseUserData == null) return null;

    // //  with the uId, we can query the user doc where u_id = uid from users collection
    // //  and then transform it to a user object
    // _usersCollection
    //     .where('u_id', isEqualTo: firebaseUserData.uid)
    //     .get()
    //     .then((value) {
    //   var userDoc;
    //   if (value.docs[0].exists) {
    //     userDoc = value.docs[0].data() as Map<String, dynamic>;
    //     print("userDoc is " + userDoc.toString());
    //   } else {
    //     return null;
    //   }
    //   if (userDoc?["user_type"] == 'barber') {
    //     return AppUser.User.barber(
    //       u_id: userDoc?['u_id'],
    //       email: userDoc?['email'],
    //       user_type: userDoc?['user_type'],
    //       name: userDoc?['name'],
    //       phone: userDoc?['phone'],
    //       address: userDoc?['address'],
    //       open_days: userDoc?['open_time'],
    //       slot_length: userDoc?['slot_length'],
    //       description: userDoc?['description'],
    //       open_time: userDoc?['open_time'],
    //       close_time: userDoc?['close_time'],
    //       bookings: userDoc?['bookings'],
    //       services: userDoc?['services'],
    //       rating: userDoc?['rating'],
    //       location: userDoc?['location'],
    //       image: userDoc?['image'],
    //     );
    //   } else if (userDoc?["user_type"] == 'customer') {
    //     return AppUser.User.customer(
    //       u_id: userDoc?['u_id'],
    //       email: userDoc?['email'],
    //       user_type: userDoc?['user_type'],
    //       name: userDoc?['name'],
    //       phone: userDoc?['phone'],
    //       address: userDoc?['address'],
    //       bookings: userDoc?['bookings'],
    //       image: userDoc?['image'],
    //     );
    //   }
    // });

    return AppUser.User(
      u_id: firebaseUserData.uid,
      email: firebaseUserData.email,
    );
  }

  @override
  Future<void> recoverPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> getUser(String uid) async {
    var userDoc = await _usersCollection.where('u_id', isEqualTo: uid).get();
    Map<String, dynamic>? user;
    if (userDoc.docs[0].exists) {
      user = userDoc.docs[0].data() as Map<String, dynamic>;
      // print("userDoc is " + user.toString());
      _currentUser = AppUser.User.fromJson(user);
    } else {
      user = null;
      _currentUser = null;
    }
  }
}
