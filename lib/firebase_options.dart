// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDT12n1QXdDQZAY9WEWaZHQkbr6MQB_4Lo',
    appId: '1:1062782348588:web:545555971f3aead68e5089',
    messagingSenderId: '1062782348588',
    projectId: 'drinkseverywhere-c8336',
    authDomain: 'drinkseverywhere-c8336.firebaseapp.com',
    storageBucket: 'drinkseverywhere-c8336.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBouTCjlhvjwV6kiycjsXeMX-rgpzHVE2Y',
    appId: '1:1062782348588:android:653e569f9a805fb98e5089',
    messagingSenderId: '1062782348588',
    projectId: 'drinkseverywhere-c8336',
    storageBucket: 'drinkseverywhere-c8336.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIWz32mNsN2UJfzZUwI7nSCnK6nTfpPGI',
    appId: '1:1062782348588:ios:a797ba3f0bd096608e5089',
    messagingSenderId: '1062782348588',
    projectId: 'drinkseverywhere-c8336',
    storageBucket: 'drinkseverywhere-c8336.appspot.com',
    androidClientId: '1062782348588-3eg1qn0fjelm237rkjhf6v24bb9bc50m.apps.googleusercontent.com',
    iosClientId: '1062782348588-u44efur74ai19kik6j8rg1gtmva6pdp0.apps.googleusercontent.com',
    iosBundleId: 'com.example.drinksEverywhere',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIWz32mNsN2UJfzZUwI7nSCnK6nTfpPGI',
    appId: '1:1062782348588:ios:a797ba3f0bd096608e5089',
    messagingSenderId: '1062782348588',
    projectId: 'drinkseverywhere-c8336',
    storageBucket: 'drinkseverywhere-c8336.appspot.com',
    androidClientId: '1062782348588-3eg1qn0fjelm237rkjhf6v24bb9bc50m.apps.googleusercontent.com',
    iosClientId: '1062782348588-u44efur74ai19kik6j8rg1gtmva6pdp0.apps.googleusercontent.com',
    iosBundleId: 'com.example.drinksEverywhere',
  );
}
