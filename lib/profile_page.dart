// import 'package:flutter/material.dart';
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   bool isEditing = false;
//
//   final _firstNameController = TextEditingController(text: "First Name");
//   final _lastNameController = TextEditingController(text: "Last Name");
//   final _usernameController = TextEditingController(text: "Username");
//   final _emailController =
//   TextEditingController(text: "xyz@merveilleinvestments.com");
//   final _passwordController = TextEditingController(text: "********");
//   final _phoneController = TextEditingController(text: "+971-XX-XXXX-XXX");
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF2C577E),
//               Color(0xFFBC9C22),
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               children: [
//                 const SizedBox(height: 10),
//
//                 /// Back button
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: IconButton(
//                     icon: const Icon(Icons.arrow_back_ios,
//                         color: Colors.black),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 /// Profile image
//                 Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.white, width: 4),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         blurRadius: 10,
//                         offset: const Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: const CircleAvatar(
//                     radius: 60,
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 /// Edit button
//                 TextButton(
//                   onPressed: () {
//                     setState(() {
//                       isEditing = !isEditing;
//                     });
//                   },
//                   child: Text(
//                     isEditing ? "Stop Editing" : "Edit Information",
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.black,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Profile Information",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//
//                 _buildTextField("First Name", _firstNameController),
//                 _buildTextField("Last Name", _lastNameController),
//                 _buildTextField("Username", _usernameController),
//                 _buildTextField("Email Address", _emailController),
//                 _buildTextField(
//                   "Password",
//                   _passwordController,
//                   obscureText: true,
//                 ),
//                 _buildTextField("Phone Number", _phoneController),
//
//                 const SizedBox(height: 30),
//
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFBC9C22),
//                     foregroundColor: Colors.black,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 40, vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       isEditing = false;
//                     });
//                   },
//                   child: const Text("Done"),
//                 ),
//
//                 const SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(
//       String label,
//       TextEditingController controller, {
//         bool obscureText = false,
//       }) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 16),
//       child: TextField(
//         controller: controller,
//         obscureText: obscureText,
//         readOnly: !isEditing,
//         decoration: InputDecoration(
//           labelText: label,
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           filled: true,
//           fillColor: Colors.white.withOpacity(0.3),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           contentPadding:
//           const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'app_drawer.dart'; // ✅ import drawer

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;

  final _firstNameController = TextEditingController(text: "First Name");
  final _lastNameController = TextEditingController(text: "Last Name");
  final _usernameController = TextEditingController(text: "Username");
  final _emailController =
  TextEditingController(text: "xyz@merveilleinvestments.com");
  final _passwordController = TextEditingController(text: "********");
  final _phoneController = TextEditingController(text: "+971-XX-XXXX-XXX");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(), // ✅ ADD DRAWER

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2C577E),
              Color(0xFFBC9C22),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 10),

                /// TOP BAR (Drawer button instead of back)
                Align(
                  alignment: Alignment.topLeft,
                  child: Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// Profile image
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                  ),
                ),

                const SizedBox(height: 20),

                /// Edit button
                TextButton(
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                  child: Text(
                    isEditing ? "Stop Editing" : "Edit Information",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Profile Information",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),

                _buildTextField("First Name", _firstNameController),
                _buildTextField("Last Name", _lastNameController),
                _buildTextField("Username", _usernameController),
                _buildTextField("Email Address", _emailController),
                _buildTextField(
                  "Password",
                  _passwordController,
                  obscureText: true,
                ),
                _buildTextField("Phone Number", _phoneController),

                const SizedBox(height: 30),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBC9C22),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isEditing = false;
                    });
                  },
                  child: const Text("Done"),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label,
      TextEditingController controller, {
        bool obscureText = false,
      }) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        readOnly: !isEditing,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Colors.white.withOpacity(0.3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
