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
    apiKey: 'AIzaSyBacjt0qcN32DPCK4_Q189wjMSuNsXD0TA',
    appId: '1:511658793244:web:f75dd5dca6ad5bac13c2d9',
    messagingSenderId: '511658793244',
    projectId: 'stuzone-8afd7',
    authDomain: 'stuzone-8afd7.firebaseapp.com',
    storageBucket: 'stuzone-8afd7.appspot.com',
    measurementId: 'G-KH4DCPV26M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBka2JzGpEm2tGdaievqYq4dB6SIUc9kLg',
    appId: '1:511658793244:android:6e73c250bd5cc68213c2d9',
    messagingSenderId: '511658793244',
    projectId: 'stuzone-8afd7',
    storageBucket: 'stuzone-8afd7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAp0b4XTvVg3BfL2OeLeNRN_EHwT7qegc',
    appId: '1:511658793244:ios:da0df829f50fd06413c2d9',
    messagingSenderId: '511658793244',
    projectId: 'stuzone-8afd7',
    storageBucket: 'stuzone-8afd7.appspot.com',
    iosBundleId: 'com.example.stuzonefinal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBAp0b4XTvVg3BfL2OeLeNRN_EHwT7qegc',
    appId: '1:511658793244:ios:83cbbe00605c772213c2d9',
    messagingSenderId: '511658793244',
    projectId: 'stuzone-8afd7',
    storageBucket: 'stuzone-8afd7.appspot.com',
    iosBundleId: 'com.example.stuzonefinal.RunnerTests',
  );
}
