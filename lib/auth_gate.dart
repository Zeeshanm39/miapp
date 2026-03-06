import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dashboard.dart';
import 'login.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

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

        /// ❌ Not logged in
        if (user == null) {
          return const MyLogin();
        }

        /// 🔥 Logged in → check Firestore document
        return FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get(),
          builder: (context, userSnapshot) {

            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            if (!userSnapshot.hasData || !userSnapshot.data!.exists) {
              FirebaseAuth.instance.signOut();
              return const MyLogin();
            }

            final userDoc =
            userSnapshot.data!.data() as Map<String, dynamic>;

            /// 🚫 Account disabled from Firestore
            if (userDoc['isActive'] == false) {
              FirebaseAuth.instance.signOut();
              return const MyLogin();
            }

            /// ✅ Everything valid → Dashboard
            return const DashboardPage();
          },
        );
      },
    );
  }
}