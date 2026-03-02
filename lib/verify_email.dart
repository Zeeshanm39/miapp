import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isSending = false;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Icon(Icons.mark_email_unread,
                  color: Colors.amber, size: 80),

              const SizedBox(height: 20),

              const Text(
                "Verify your email",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                user?.email ?? "",
                style: const TextStyle(color: Colors.white70),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: isSending ? null : () async {
                  setState(() => isSending = true);
                  await user?.sendEmailVerification();
                  setState(() => isSending = false);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Verification email sent"),
                    ),
                  );
                },
                child: const Text("Resend verification email"),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}