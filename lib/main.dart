
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'auth_gate.dart';
import 'login.dart';
import 'register.dart';
import 'profile_page.dart';
import 'dashboard.dart';
import 'splash_video.dart';
import 'about.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const SplashVideoScreen(), // 👈 start with splash

      routes: {
        'auth': (context) => const AuthGate(),   // 👈 ADD THIS
        'login': (context) => const MyLogin(),
        'register': (context) => const MyRegister(),
        'dashboard': (context) => const DashboardPage(),
        'profile': (context) => const MyProfile(),
        'about': (context) => const About(),
      },
    );
  }
}