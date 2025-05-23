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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPM2C40T1lL4hIwdUmmrSp3ZA_FPl8Erk',
    appId: '1:82363910922:android:860f13dbdb92ff4b4488f3',
    messagingSenderId: '82363910922',
    projectId: 'e-commerce-project-507fc',
    storageBucket: 'e-commerce-project-507fc.firebasestorage.app',
  );


  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCxhkBve9sFFGJ-gUPqWOVMt3pVrYDWWI',
    appId: '1:82363910922:ios:486a67b500605c564488f3',
    messagingSenderId: '82363910922',
    projectId: 'e-commerce-project-507fc',
    storageBucket: 'e-commerce-project-507fc.firebasestorage.app',
    iosBundleId: 'com.example.eCommerce',
  );
}
