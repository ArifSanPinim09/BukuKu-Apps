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
    apiKey: 'AIzaSyAtOa0FlA3cFUiH-bCQUHAOPn4H9NFIbF0',
    appId: '1:373612793547:web:7f02b7c43d0a128e0d954e',
    messagingSenderId: '373612793547',
    projectId: 'book-store-apps-ee305',
    authDomain: 'book-store-apps-ee305.firebaseapp.com',
    storageBucket: 'book-store-apps-ee305.appspot.com',
    measurementId: 'G-K9TBLZP0NH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqQFjOpSydsdL1xyZe3zy8bqAnjK23Hys',
    appId: '1:373612793547:android:080ac585aa9656900d954e',
    messagingSenderId: '373612793547',
    projectId: 'book-store-apps-ee305',
    storageBucket: 'book-store-apps-ee305.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQnF3GGYBc-lXqIN_ZzDo39qBMsvvAs3c',
    appId: '1:373612793547:ios:91fee22adf339d9f0d954e',
    messagingSenderId: '373612793547',
    projectId: 'book-store-apps-ee305',
    storageBucket: 'book-store-apps-ee305.appspot.com',
    iosBundleId: 'com.example.bookStoreApps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQnF3GGYBc-lXqIN_ZzDo39qBMsvvAs3c',
    appId: '1:373612793547:ios:91fee22adf339d9f0d954e',
    messagingSenderId: '373612793547',
    projectId: 'book-store-apps-ee305',
    storageBucket: 'book-store-apps-ee305.appspot.com',
    iosBundleId: 'com.example.bookStoreApps',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAtOa0FlA3cFUiH-bCQUHAOPn4H9NFIbF0',
    appId: '1:373612793547:web:66d288c035a380550d954e',
    messagingSenderId: '373612793547',
    projectId: 'book-store-apps-ee305',
    authDomain: 'book-store-apps-ee305.firebaseapp.com',
    storageBucket: 'book-store-apps-ee305.appspot.com',
    measurementId: 'G-KHE60XMEDB',
  );
}
