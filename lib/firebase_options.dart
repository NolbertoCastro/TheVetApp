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
    apiKey: 'AIzaSyCswrWWzJs0brs5NDrfoOn87W_F1_6NZ2k',
    appId: '1:239864926327:web:8edd72fa3cd70e959d7672',
    messagingSenderId: '239864926327',
    projectId: 'the-vet-app-fa9d6',
    authDomain: 'the-vet-app-fa9d6.firebaseapp.com',
    storageBucket: 'the-vet-app-fa9d6.appspot.com',
    measurementId: 'G-9LK5C1WTSC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4U2bwOdIs1jhqAH7Ss1jf4U3sezsrtj8',
    appId: '1:239864926327:android:cd28ebd968f5ed839d7672',
    messagingSenderId: '239864926327',
    projectId: 'the-vet-app-fa9d6',
    storageBucket: 'the-vet-app-fa9d6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkYOL6ICx0gk7jF__EdAay6d5Z8y8JzlQ',
    appId: '1:239864926327:ios:be522ed044bc40009d7672',
    messagingSenderId: '239864926327',
    projectId: 'the-vet-app-fa9d6',
    storageBucket: 'the-vet-app-fa9d6.appspot.com',
    iosBundleId: 'com.example.theVetApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAkYOL6ICx0gk7jF__EdAay6d5Z8y8JzlQ',
    appId: '1:239864926327:ios:33266e6ad2b21c319d7672',
    messagingSenderId: '239864926327',
    projectId: 'the-vet-app-fa9d6',
    storageBucket: 'the-vet-app-fa9d6.appspot.com',
    iosBundleId: 'com.example.theVetApp.RunnerTests',
  );
}