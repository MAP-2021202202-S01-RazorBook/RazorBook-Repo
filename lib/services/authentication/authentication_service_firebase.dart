import 'package:firebase_auth/firebase_auth.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';

import '../failure.dart';
// import '../../models/user.dart'
//     as AppUser; // To resolve conflict with firebase 'User' class

// TODO: Add a user object which stores the logged in user

class AuthenticationServiceFirebase extends AuthenticationService {
  FirebaseAuth get _auth => FirebaseAuth.instance;
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

      /// save uid to local Storage
      await localStorageServiceProvider.saveUID(credential.user!.uid);

      /// get and save profile
      await customerServiceFirebase.getCustomerProfile(credential.user!.uid);

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
      await localStorageServiceProvider.logout();
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
