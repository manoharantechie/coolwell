// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;




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
    apiKey: 'AIzaSyBL_wpeCNJKVcsWrzgdPPZ-fRLkUuY9qUs',
    appId: '1:93931199067:web:8bb500f71a944533a63d7e',
    messagingSenderId: '93931199067',
    projectId: 'coolwell-dd0e0',
    authDomain: 'coolwell-dd0e0.firebaseapp.com',
    storageBucket: 'coolwell-dd0e0.appspot.com',
    measurementId: 'G-HXL0WLGLXN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJx76TLwOxXghaDKsachGNBwYJ_K3moLM',
    appId: '1:93931199067:android:59d28986c2674fbba63d7e',
    messagingSenderId: '93931199067',
    projectId: 'coolwell-dd0e0',
    storageBucket: 'coolwell-dd0e0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKik4jix24RpfcRxBL6DMoj0Bm77qTWNU',
    appId: '1:93931199067:ios:fe6e16776d4b4881a63d7e',
    messagingSenderId: '93931199067',
    projectId: 'coolwell-dd0e0',
    storageBucket: 'coolwell-dd0e0.appspot.com',
    iosClientId: '93931199067-1viimmpru8cct8ru8eqhgq074k3bqcla.apps.googleusercontent.com',
    iosBundleId: 'com.example.coolwell',
  );
}
