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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCEZl8ExvmOUfUarQBnVUMJJoOgNKUlnOE',
    appId: '1:31266500853:web:117540fbc5429b5c5895bc',
    messagingSenderId: '31266500853',
    projectId: 'furniture-app-4ee65',
    authDomain: 'furniture-app-4ee65.firebaseapp.com',
    storageBucket: 'furniture-app-4ee65.appspot.com',
    measurementId: 'G-KF2MTJB34J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAErJ1SNzNaaVY3cRSjBWOulMrJyw-9PbY',
    appId: '1:31266500853:android:c462f518f84ada905895bc',
    messagingSenderId: '31266500853',
    projectId: 'furniture-app-4ee65',
    storageBucket: 'furniture-app-4ee65.appspot.com',
  );
}