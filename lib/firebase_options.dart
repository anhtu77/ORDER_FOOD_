import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  /// Trả về các FirebaseOptions dựa trên nền tảng hiện tại.
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

  /// Các tùy chọn Firebase cho nền tảng web.
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDu2-1bvyccN3cWltQP0J7rObLT3Z7QmA4',
    appId: '1:14771472720:web:bdd580ffd158e448d1c455',
    messagingSenderId: '14771472720',
    projectId: 'order-food-data',
    authDomain: 'order-food-data.firebaseapp.com',
    storageBucket: 'order-food-data.appspot.com',
  );

  /// Các tùy chọn Firebase cho nền tảng Android.
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGAllarCoXVoNiQTbbXn3UjgNtIohtges',
    appId: '1:14771472720:android:d4344f5659fe4b99d1c455',
    messagingSenderId: '14771472720',
    projectId: 'order-food-data',
    storageBucket: 'order-food-data.appspot.com',
  );

  /// Các tùy chọn Firebase cho nền tảng iOS.
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwNANDA8fGJF04P-ydg_w9HmgoqnF0uLY',
    appId: '1:14771472720:ios:d611987553e8dcc9d1c455',
    messagingSenderId: '14771472720',
    projectId: 'order-food-data',
    storageBucket: 'order-food-data.appspot.com',
    iosBundleId: 'com.example.projectOrderFood',
  );
}
