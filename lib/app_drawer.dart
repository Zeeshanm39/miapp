import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          /// Drawer Header
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2C577E),
                  Color(0xFFBC9C22),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.black),
            ),
            accountName: const Text(
              "Merveille User",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: const Text("xyz@merveilleinvestments.com"),
          ),

          /// Profile
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'profile');
            },
          ),

          /// About
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'about');
            },
          ),

          const Spacer(),

          const Divider(),

          /// Logout
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pop(context);

              // Clear session later (Firebase / SharedPrefs)
              Navigator.pushNamedAndRemoveUntil(
                context,
                'login',
                    (route) => false,
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
