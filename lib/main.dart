import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app/service_locator/service_locator.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await initializeServiceLocator();
  runApp(const MyApp());
}
