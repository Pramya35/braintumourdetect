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
    apiKey: 'AIzaSyAXUV12DIMqSWKuf-14iFGz0pVhiTc0bf0',
    appId: '1:1044352826125:web:49382307d1b21f1e1ece44',
    messagingSenderId: '1044352826125',
    projectId: 'brain-care-223e1',
    authDomain: 'brain-care-223e1.firebaseapp.com',
    storageBucket: 'brain-care-223e1.appspot.com',
    measurementId: 'G-TF05E89ENX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJ-PgkzYANi3eKLgxX8j2YZqXK5OzFI-g',
    appId: '1:1044352826125:android:f427398f4251a6521ece44',
    messagingSenderId: '1044352826125',
    projectId: 'brain-care-223e1',
    storageBucket: 'brain-care-223e1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCK03khVxyUfP6_S7F4VPRRhRLS4dmhSNU',
    appId: '1:1044352826125:ios:feb5c558e260bdf71ece44',
    messagingSenderId: '1044352826125',
    projectId: 'brain-care-223e1',
    storageBucket: 'brain-care-223e1.appspot.com',
    iosBundleId: 'com.example.braintumourdetect',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCK03khVxyUfP6_S7F4VPRRhRLS4dmhSNU',
    appId: '1:1044352826125:ios:feb5c558e260bdf71ece44',
    messagingSenderId: '1044352826125',
    projectId: 'brain-care-223e1',
    storageBucket: 'brain-care-223e1.appspot.com',
    iosBundleId: 'com.example.braintumourdetect',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAXUV12DIMqSWKuf-14iFGz0pVhiTc0bf0',
    appId: '1:1044352826125:web:06a06c88a6d8f3f31ece44',
    messagingSenderId: '1044352826125',
    projectId: 'brain-care-223e1',
    authDomain: 'brain-care-223e1.firebaseapp.com',
    storageBucket: 'brain-care-223e1.appspot.com',
    measurementId: 'G-WVC60MC4NK',
  );
}
