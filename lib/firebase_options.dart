// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD4ihd4ISwYP3GIwzwCyl6Jz74-Rq9p2oE',
    appId: '1:17961523529:web:a81edf335af096dbcda298',
    messagingSenderId: '17961523529',
    projectId: 'razorbook-app',
    authDomain: 'razorbook-app.firebaseapp.com',
    databaseURL: 'https://razorbook-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'razorbook-app.appspot.com',
    measurementId: 'G-M7R2P15K6K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDml0vRmKi9qMPZ7C2C-sE-XRCfe2FcYZw',
    appId: '1:17961523529:android:ffdcf5c2b4cccc6ccda298',
    messagingSenderId: '17961523529',
    projectId: 'razorbook-app',
    databaseURL: 'https://razorbook-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'razorbook-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkZsigiNdUO1Vyp999hkAvGFqKtdNGEXc',
    appId: '1:17961523529:ios:6c3070cd7ed77921cda298',
    messagingSenderId: '17961523529',
    projectId: 'razorbook-app',
    databaseURL: 'https://razorbook-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'razorbook-app.appspot.com',
    iosClientId: '17961523529-vkq6b5h3i4ms53a1tvo2trh7j0beeko9.apps.googleusercontent.com',
    iosBundleId: 'com.example.razorBook',
  );
}
