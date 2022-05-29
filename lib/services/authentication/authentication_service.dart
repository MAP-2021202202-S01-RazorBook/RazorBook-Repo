// import 'package:map_mvvm/map_mvvm.dart';

// import '../../models/user.dart' as AppUser;

abstract class AuthenticationService
// with ServiceStream

{
  // To provide dependency about signed in user

  // To be overriden
  // AppUser.User? get user => null;

  Future<void> signIn({required String email, required String password});
  Future<void> signOut();
  Future<void> recoverPassword({required String email});
}
