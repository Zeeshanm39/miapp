import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String uid;
  final String email;
  final String name;
  final String role;
  final bool emailVerified;
  final bool isActive;
  final Timestamp createdAt;
  final Timestamp lastLogin;

  AppUser({
    required this.uid,
    required this.email,
    required this.name,
    required this.role,
    required this.emailVerified,
    required this.isActive,
    required this.createdAt,
    required this.lastLogin,
  });

  factory AppUser.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AppUser(
      uid: data['uid'],
      email: data['email'],
      name: data['name'],
      role: data['role'],
      emailVerified: data['emailVerified'],
      isActive: data['isActive'],
      createdAt: data['createdAt'],
      lastLogin: data['lastLogin'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'role': role,
      'emailVerified': emailVerified,
      'isActive': isActive,
      'createdAt': createdAt,
      'lastLogin': lastLogin,
    };
  }
}