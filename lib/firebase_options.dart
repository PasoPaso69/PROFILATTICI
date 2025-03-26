// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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

// ...

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
        return windows;
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
    apiKey: 'AIzaSyBHTyapswEyzUt9II7NnXRnqpebQyzcCYU',
    appId: '1:240078807431:web:9145d83b256b1d39b33322',
    messagingSenderId: '240078807431',
    projectId: 'flutter-8918c',
    authDomain: 'flutter-8918c.firebaseapp.com',
    storageBucket: 'flutter-8918c.firebasestorage.app',
    measurementId: 'G-QCSGDVDQ4Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQUVMl9306YEkDKRFsNYrsfiGjYW5sKvE',
    appId: '1:240078807431:android:4019064723bc477fb33322',
    messagingSenderId: '240078807431',
    projectId: 'flutter-8918c',
    storageBucket: 'flutter-8918c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCc3UD5jG0zkVtsTWYN9U2CbYFpmM3O9XY',
    appId: '1:240078807431:ios:db874b65686c14f2b33322',
    messagingSenderId: '240078807431',
    projectId: 'flutter-8918c',
    storageBucket: 'flutter-8918c.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCc3UD5jG0zkVtsTWYN9U2CbYFpmM3O9XY',
    appId: '1:240078807431:ios:db874b65686c14f2b33322',
    messagingSenderId: '240078807431',
    projectId: 'flutter-8918c',
    storageBucket: 'flutter-8918c.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBHTyapswEyzUt9II7NnXRnqpebQyzcCYU',
    appId: '1:240078807431:web:e433db7208b49661b33322',
    messagingSenderId: '240078807431',
    projectId: 'flutter-8918c',
    authDomain: 'flutter-8918c.firebaseapp.com',
    storageBucket: 'flutter-8918c.firebasestorage.app',
    measurementId: 'G-R7ZX12WC9T',
  );
}
