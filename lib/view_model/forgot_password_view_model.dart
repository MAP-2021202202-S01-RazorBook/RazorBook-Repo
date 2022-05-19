import 'package:firebase_auth/firebase_auth.dart';

Future sendResetEmail(String email) async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}
