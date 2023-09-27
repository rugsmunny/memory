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
      apiKey: "AIzaSyCyW4AAHGvDDdemir6qXxYvkzKY3vjo1vA",
      authDomain: "memory-902ea.firebaseapp.com",
      databaseURL: "https://memory-902ea-default-rtdb.europe-west1.firebasedatabase.app",
      projectId: "memory-902ea",
      storageBucket: "memory-902ea.appspot.com",
      messagingSenderId: "492146080544",
      appId: "1:492146080544:web:eec98033c99d2e33e67545");

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJp56T6xr8zrgOGPHgt8-G5Bri8Ywpvtg',
    appId: '1:492146080544:android:5a849682b837f85ce67545',
    messagingSenderId: '492146080544',
    projectId: 'memory-902ea',
    storageBucket: 'memory-902ea.appspot.com',
  );
}
