// import 'package:flutter/material.dart';
// import 'package:miapp/profile_page.dart';
// import 'package:miapp/splash_video.dart';
// import 'about.dart';
// import 'login.dart';
// import 'register.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//
//       // Start app with splash video
//       initialRoute: 'splash',
//
//       routes: {
//         'splash': (context) => const SplashVideoScreen(),
//         'login': (context) => const MyLogin(),
//         'register': (context) => const MyRegister(),
//         'profile': (context) => const MyProfile(),
//         'about': (context) => const About(),
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'login.dart';
import 'register.dart';
import 'profile_page.dart';
import 'dashboard.dart';
import 'splash_video.dart';
import 'about.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); // 🔥 REQUIRED
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash': (context) => const SplashVideoScreen(),
        'login': (context) => const MyLogin(),
        'register': (context) => const MyRegister(),
        'dashboard': (context) => const DashboardPage(),
        'profile': (context) => const MyProfile(),
        'about': (context) => const About(),
      },
    );
  }
}