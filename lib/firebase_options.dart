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
    apiKey: 'AIzaSyBo0JcQeeWasx9qH6oHrthOgPtY_fyFohw',
    appId: '1:173143905888:web:0c273c97e41390805f1505',
    messagingSenderId: '173143905888',
    projectId: 'fir-integration-app-2cf1a',
    authDomain: 'fir-integration-app-2cf1a.firebaseapp.com',
    storageBucket: 'fir-integration-app-2cf1a.appspot.com',
    measurementId: 'G-Z39KT0KHBS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCgVjcSeQN1y_kYuJs9tFNeH13dUGi_7w',
    appId: '1:173143905888:android:f1a3c9f29314ad915f1505',
    messagingSenderId: '173143905888',
    projectId: 'fir-integration-app-2cf1a',
    storageBucket: 'fir-integration-app-2cf1a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCXUwTn6_0nRwCsiIrF-yHknbdzOBexy4',
    appId: '1:173143905888:ios:6b879a0238a5e88a5f1505',
    messagingSenderId: '173143905888',
    projectId: 'fir-integration-app-2cf1a',
    storageBucket: 'fir-integration-app-2cf1a.appspot.com',
    iosClientId: '173143905888-o8rncvspsi0d32thqaoie9tip15ev895.apps.googleusercontent.com',
    iosBundleId: 'com.app.flutterIntegrationApp',
  );
}