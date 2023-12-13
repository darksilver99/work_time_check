import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyADx0wXnMe1oDt_AMFgpDGAKGwdFDCZuG0",
            authDomain: "worktimecheck-465e2.firebaseapp.com",
            projectId: "worktimecheck-465e2",
            storageBucket: "worktimecheck-465e2.appspot.com",
            messagingSenderId: "659036957134",
            appId: "1:659036957134:web:81a6ed7e6734c75b9c639f",
            measurementId: "G-L85PQ5QQH1"));
  } else {
    await Firebase.initializeApp();
  }
}
