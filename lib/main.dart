//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
//
// import 'auth_gate.dart';
// import 'login.dart';
// import 'register.dart';
// import 'profile_page.dart';
// import 'dashboard.dart';
// import 'splash_video.dart';
// import 'about.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
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
//       home: const SplashVideoScreen(), // 👈 start with splash
//
//       routes: {
//         'auth': (context) => const AuthGate(),   // 👈 ADD THIS
//         'login': (context) => const MyLogin(),
//         'register': (context) => const MyRegister(),
//         'dashboard': (context) => const DashboardPage(),
//         'profile': (context) => const MyProfile(),
//         'about': (context) => const About(),
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

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

/// GLOBAL ANALYTICS INSTANCE
final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
final FirebaseAnalyticsObserver observer =
FirebaseAnalyticsObserver(analytics: analytics);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// PREMIUM APP THEME (Matches your Dashboard)
  ThemeData _appTheme() {
    const Color black = Color(0xFF080808);
    const Color gold = Color(0xFFD4AF37);

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: black,

      colorScheme: const ColorScheme.dark(
        primary: gold,
        secondary: gold,
        background: black,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: black,
        elevation: 0,
        centerTitle: true,
      ),

      drawerTheme: const DrawerThemeData(
        backgroundColor: black,
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: black,
        selectedItemColor: gold,
        unselectedItemColor: Colors.white54,
      ),

      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Merveille Investments",

      debugShowCheckedModeBanner: false,

      theme: _appTheme(),

      /// START WITH SPLASH VIDEO
      home: const SplashVideoScreen(),

      /// FIREBASE ANALYTICS NAVIGATION TRACKING
      navigatorObservers: [observer],

      /// APP ROUTES
      routes: {
        'auth': (context) => const AuthGate(),
        'login': (context) => const MyLogin(),
        'register': (context) => const MyRegister(),
        'dashboard': (context) => const DashboardPage(),
        'profile': (context) => const MyProfile(),
        'about': (context) => const About(),
      },
    );
  }
}
