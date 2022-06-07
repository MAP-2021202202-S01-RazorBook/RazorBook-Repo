// import 'package:map_mvvm/map_mvvm.dart';

// import '../../models/user.dart' as AppUser;

// ignore_for_file: library_prefixes

import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user.dart' as AppUser;

abstract class AuthenticationService
// with ServiceStream

{
  // To provide dependency about signed in user

  // To be overriden
  Stream<AppUser.User?>? get authState => null;

  AppUser.User? get currentUser => null;

  AppUser.User? transformData(firebaseUserData);
  Future<void> getUser(String uid);
  Future<void> signIn({required String email, required String password});
  Future<void> customerSignup(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String address});
  Future<void> barbershopSignup(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String address,
      required String openTime,
      required String closeTime,
      required String description});
  Future<void> signOut();
  Future<void> recoverPassword({required String email});
}
