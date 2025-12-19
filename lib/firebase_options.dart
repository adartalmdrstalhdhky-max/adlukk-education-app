// هذا الكود يربط تطبيقك بمشروع Adlak في السحاب
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: 'AIzaSyA...', // سيظهر لك هذا الرمز في لوحة التحكم
      appId: '1:650...', 
      messagingSenderId: '...',
      projectId: 'adlak-smart-school', // اسم مشروعك الحالي
      storageBucket: 'adlak-smart-school.appspot.com',
    );
  }
}
