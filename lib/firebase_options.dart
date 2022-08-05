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
    apiKey: 'AIzaSyCm1VkCDQC65ioTr29dpga9XvcjNIEuzWQ',
    appId: '1:977444080570:web:d987f576bdc2b34bb9eb83',
    messagingSenderId: '977444080570',
    projectId: 'food-delivery-c45c1',
    authDomain: 'food-delivery-c45c1.firebaseapp.com',
    storageBucket: 'food-delivery-c45c1.appspot.com',
    measurementId: 'G-J5MTK7CTYK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANds5cwPC54gSu0Hk0TG4CYszCGz7XmKc',
    appId: '1:977444080570:android:f10c5ebd72f8b221b9eb83',
    messagingSenderId: '977444080570',
    projectId: 'food-delivery-c45c1',
    storageBucket: 'food-delivery-c45c1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtVg1cnS9mzopdAOYeLckWh4uFMJSi6YY',
    appId: '1:977444080570:ios:eb4f1840050b345bb9eb83',
    messagingSenderId: '977444080570',
    projectId: 'food-delivery-c45c1',
    storageBucket: 'food-delivery-c45c1.appspot.com',
    iosClientId: '977444080570-dha61u35sph5kfftkkghkkdm0325fr45.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodDelivery',
  );
}