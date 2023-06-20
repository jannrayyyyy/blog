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
    apiKey: 'AIzaSyDVoyOmOk8SBngGjgmf5i0H18TloLUjmcw',
    appId: '1:722949622156:web:6025f51c412a1a1f9feea9',
    messagingSenderId: '722949622156',
    projectId: 'food-blog-be262',
    authDomain: 'food-blog-be262.firebaseapp.com',
    storageBucket: 'food-blog-be262.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeoRF9hFn8DFI3itLZD2ydo9m3i22uzyQ',
    appId: '1:722949622156:android:a1779825e4a38f3c9feea9',
    messagingSenderId: '722949622156',
    projectId: 'food-blog-be262',
    storageBucket: 'food-blog-be262.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDeJyD5lAq4OXdVE2qvpyMOCI3pXUZVXac',
    appId: '1:722949622156:ios:c25cea7f70e1f10e9feea9',
    messagingSenderId: '722949622156',
    projectId: 'food-blog-be262',
    storageBucket: 'food-blog-be262.appspot.com',
    iosClientId: '722949622156-4kei2dekpem0d9trmn66g76lsspe09u8.apps.googleusercontent.com',
    iosBundleId: 'com.example.blog',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDeJyD5lAq4OXdVE2qvpyMOCI3pXUZVXac',
    appId: '1:722949622156:ios:424113df385ca4279feea9',
    messagingSenderId: '722949622156',
    projectId: 'food-blog-be262',
    storageBucket: 'food-blog-be262.appspot.com',
    iosClientId: '722949622156-2pnl5gkcvc5hpba6gema8rrmhnf6feeq.apps.googleusercontent.com',
    iosBundleId: 'com.example.blog.RunnerTests',
  );
}
