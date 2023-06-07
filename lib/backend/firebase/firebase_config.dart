import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDdEJh8oov5qJl53BjoPuEVOkceXsvKDoU",
            authDomain: "agriculturescan.firebaseapp.com",
            projectId: "agriculturescan",
            storageBucket: "agriculturescan.appspot.com",
            messagingSenderId: "119535848870",
            appId: "1:119535848870:web:2237cbbcbc520e4686d367"));
  } else {
    await Firebase.initializeApp();
  }
}
