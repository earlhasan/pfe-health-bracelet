import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA2yj9TVrj6YqcpBHuNFa9C6sR3aYbFVY0",
            authDomain: "smart-bracelet-project-2025.firebaseapp.com",
            projectId: "smart-bracelet-project-2025",
            storageBucket: "smart-bracelet-project-2025.firebasestorage.app",
            messagingSenderId: "766183131411",
            appId: "1:766183131411:web:8ac2a020ae8f00569df2e6"));
  } else {
    await Firebase.initializeApp();
  }
}
