import 'package:firebase_auth/firebase_auth.dart';
import 'package:razor_book/views/signup_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../failure.dart';
import 'authentication_service.dart';
// import '../../models/user.dart'
//     as AppUser; // To resolve conflict with firebase 'User' class

// TODO: Add a user object which stores the logged in user

class AuthenticationServiceFirebase extends AuthenticationService {
  FirebaseAuth get _auth => FirebaseAuth.instance;
  CollectionReference get _registeree => FirebaseFirestore.instance.collection('users');
  // AppUser.User? _user;

  // @override
  // AppUser.User? get user {
  //   // _user ??= transformData(_auth.currentUser);
  //   return _user;
  // }

  // AppUser.User? get user => transformData(_auth.currentUser);
  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // _user = transformData(credential.user);
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
      // _user = null;
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
  Future<void> barbershopSignup({required String email, required String password, required String name, required String phone, required String address, required String openTime, required String closeTime, required String description}) async {
    
    try {
    await _auth
        .createUserWithEmailAndPassword(
            email: email, password: password)
        .then((value) {
      if(value!=null && value.user != null){
        //  userCollection.doc(value.user.uid).set({
          _registeree.add({
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

      }else{
        throw Error();
       }
      
    });
  } catch (err) {
    print(err.toString);
  }
  }

      @override
  Future<void> customerSignup({required String email, required String password, required String name, required String phone, required String address}) async {
    
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value != null && value.user != null) {
          //  userCollection.doc(value.user.uid).set({
          _registeree.add({
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

  // @override
  // Stream<User?>? get stream => _auth.authStateChanges();

  // @override
  // AppUser.User? transformData(firebaseUserData) {
  //   if (firebaseUserData == null) return null;

  //   return AppUser.User(
  //     username: firebaseUserData.email,
  //     email: firebaseUserData.email,
  //     name: firebaseUserData.displayName,
  //     uid: firebaseUserData.uid,
  //   );
  // }

  @override
  Future<void> recoverPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

}
