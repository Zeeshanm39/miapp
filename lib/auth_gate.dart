// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:miapp/verify_email.dart';import 'dashboard.dart';
//
//
// import 'login.dart';
//
// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }
//
//         final user = snapshot.data;
//
//         // ❌ Not logged in
//         if (user == null) {
//           return const MyLogin();
//         }
//
//         // 🚨 Logged in but email NOT verified
//         if (!user.emailVerified) {
//           return const VerifyEmailScreen();
//         }
//
//         // ✅ Logged in + verified
//         return const DashboardPage();
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miapp/verify_email.dart';
import 'dashboard.dart';
import 'login.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool _isSyncing = false;

  Future<void> _syncEmailVerification(User user) async {
    if (_isSyncing) return;

    _isSyncing = true;

    await user.reload();
    final refreshedUser = FirebaseAuth.instance.currentUser!;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(refreshedUser.uid)
        .update({
      'emailVerified': refreshedUser.emailVerified,
    });

    _isSyncing = false;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snapshot.data;

        // ❌ Not logged in
        if (user == null) {
          return const MyLogin();
        }

        // 🔄 Sync verification status
        _syncEmailVerification(user);

        // 🚨 Logged in but email NOT verified
        if (!user.emailVerified) {
          return const VerifyEmailScreen();
        }

        // ✅ Logged in + verified
        return const DashboardPage();
      },
    );
  }
}