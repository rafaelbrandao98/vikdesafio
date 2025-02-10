import 'package:desafiovik/app_module.dart';
import 'package:desafiovik/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyD3L9wzLymdm510SNv5UeInLWzUPV-Xbus",
        authDomain: "desafiovik-34a55.firebaseapp.com",
        projectId: "desafiovik-34a55",
        storageBucket: "desafiovik-34a55.firebasestorage.app",
        messagingSenderId: "889708550994",
        appId: "1:889708550994:web:c8c294538c0eaeb801b88b",
        measurementId: "G-FRYK93C062"),
  );
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
