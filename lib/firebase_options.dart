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
    apiKey: 'AIzaSyB02Rpo984HyutOHYiq77ctScmp_3-S_M4',
    appId: '1:687040477575:web:8bc7a86292d2add160fb22',
    messagingSenderId: '687040477575',
    projectId: 'authtest-39de3',
    authDomain: 'authtest-39de3.firebaseapp.com',
    storageBucket: 'authtest-39de3.appspot.com',
    measurementId: 'G-5SCR7GK16C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBs_7rrCOOU-BwhjNQgYf3q9AIXzXdriV8',
    appId: '1:687040477575:android:790f12f15f02c60760fb22',
    messagingSenderId: '687040477575',
    projectId: 'authtest-39de3',
    storageBucket: 'authtest-39de3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmn3dG3sMeRD8SkU9CUb2bJxAMSXxIKm4',
    appId: '1:687040477575:ios:a87134e2aabc118760fb22',
    messagingSenderId: '687040477575',
    projectId: 'authtest-39de3',
    storageBucket: 'authtest-39de3.appspot.com',
    iosClientId: '687040477575-6814m8og0iou3tt3rfrj9foeml0pciaj.apps.googleusercontent.com',
    iosBundleId: 'com.example.authTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmn3dG3sMeRD8SkU9CUb2bJxAMSXxIKm4',
    appId: '1:687040477575:ios:238e1b1bd5a5607b60fb22',
    messagingSenderId: '687040477575',
    projectId: 'authtest-39de3',
    storageBucket: 'authtest-39de3.appspot.com',
    iosClientId: '687040477575-47lp6v3670uv3sj28iq5b4ikbs0nfci1.apps.googleusercontent.com',
    iosBundleId: 'com.example.authTest.RunnerTests',
  );
}
