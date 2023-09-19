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
        return macos;
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
    apiKey: 'AIzaSyDknEGwm3UGUcvd05OIOVpFR40sRNbWMac',
    appId: '1:90942181400:web:18452823f3a0531953336d',
    messagingSenderId: '90942181400',
    projectId: 'online-shop-ed36a',
    authDomain: 'online-shop-ed36a.firebaseapp.com',
    storageBucket: 'online-shop-ed36a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4To1-dCJb3wIWh4t4u4Mqp5VF5LyfGCw',
    appId: '1:90942181400:android:4efee412a806c95953336d',
    messagingSenderId: '90942181400',
    projectId: 'online-shop-ed36a',
    storageBucket: 'online-shop-ed36a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWV4GHUo2qNwo311hwC-P9jatWoIYDoEY',
    appId: '1:90942181400:ios:3b30b6ffeb18a09e53336d',
    messagingSenderId: '90942181400',
    projectId: 'online-shop-ed36a',
    storageBucket: 'online-shop-ed36a.appspot.com',
    iosClientId: '90942181400-1km96d87d5h3bp534pq9bf1uo9mcov8f.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBWV4GHUo2qNwo311hwC-P9jatWoIYDoEY',
    appId: '1:90942181400:ios:3b30b6ffeb18a09e53336d',
    messagingSenderId: '90942181400',
    projectId: 'online-shop-ed36a',
    storageBucket: 'online-shop-ed36a.appspot.com',
    iosClientId: '90942181400-1km96d87d5h3bp534pq9bf1uo9mcov8f.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerce',
  );
}
