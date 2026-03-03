// // import 'package:flutter/material.dart';
// //
// // class ProfilePage extends StatefulWidget {
// //   const ProfilePage({super.key});
// //
// //   @override
// //   State<ProfilePage> createState() => _ProfilePageState();
// // }
// //
// // class _ProfilePageState extends State<ProfilePage> {
// //   bool isEditing = false;
// //
// //   final _firstNameController = TextEditingController(text: "First Name");
// //   final _lastNameController = TextEditingController(text: "Last Name");
// //   final _usernameController = TextEditingController(text: "Username");
// //   final _emailController =
// //   TextEditingController(text: "xyz@merveilleinvestments.com");
// //   final _passwordController = TextEditingController(text: "********");
// //   final _phoneController = TextEditingController(text: "+971-XX-XXXX-XXX");
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topCenter,
// //             end: Alignment.bottomCenter,
// //             colors: [
// //               Color(0xFF2C577E),
// //               Color(0xFFBC9C22),
// //             ],
// //           ),
// //         ),
// //         child: SafeArea(
// //           child: SingleChildScrollView(
// //             padding: const EdgeInsets.symmetric(horizontal: 24),
// //             child: Column(
// //               children: [
// //                 const SizedBox(height: 10),
// //
// //                 /// Back button
// //                 Align(
// //                   alignment: Alignment.topLeft,
// //                   child: IconButton(
// //                     icon: const Icon(Icons.arrow_back_ios,
// //                         color: Colors.black),
// //                     onPressed: () => Navigator.pop(context),
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 10),
// //
// //                 /// Profile image
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     shape: BoxShape.circle,
// //                     border: Border.all(color: Colors.white, width: 4),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Colors.black.withOpacity(0.2),
// //                         blurRadius: 10,
// //                         offset: const Offset(0, 5),
// //                       ),
// //                     ],
// //                   ),
// //                   child: const CircleAvatar(
// //                     radius: 60,
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 20),
// //
// //                 /// Edit button
// //                 TextButton(
// //                   onPressed: () {
// //                     setState(() {
// //                       isEditing = !isEditing;
// //                     });
// //                   },
// //                   child: Text(
// //                     isEditing ? "Stop Editing" : "Edit Information",
// //                     style: const TextStyle(
// //                       fontSize: 16,
// //                       color: Colors.black,
// //                       decoration: TextDecoration.underline,
// //                     ),
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 20),
// //
// //                 const Align(
// //                   alignment: Alignment.centerLeft,
// //                   child: Text(
// //                     "Profile Information",
// //                     style: TextStyle(
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black87,
// //                     ),
// //                   ),
// //                 ),
// //
// //                 _buildTextField("First Name", _firstNameController),
// //                 _buildTextField("Last Name", _lastNameController),
// //                 _buildTextField("Username", _usernameController),
// //                 _buildTextField("Email Address", _emailController),
// //                 _buildTextField(
// //                   "Password",
// //                   _passwordController,
// //                   obscureText: true,
// //                 ),
// //                 _buildTextField("Phone Number", _phoneController),
// //
// //                 const SizedBox(height: 30),
// //
// //                 ElevatedButton(
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: const Color(0xFFBC9C22),
// //                     foregroundColor: Colors.black,
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 40, vertical: 16),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                   ),
// //                   onPressed: () {
// //                     setState(() {
// //                       isEditing = false;
// //                     });
// //                   },
// //                   child: const Text("Done"),
// //                 ),
// //
// //                 const SizedBox(height: 30),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildTextField(
// //       String label,
// //       TextEditingController controller, {
// //         bool obscureText = false,
// //       }) {
// //     return Padding(
// //       padding: const EdgeInsets.only(top: 16),
// //       child: TextField(
// //         controller: controller,
// //         obscureText: obscureText,
// //         readOnly: !isEditing,
// //         decoration: InputDecoration(
// //           labelText: label,
// //           floatingLabelBehavior: FloatingLabelBehavior.always,
// //           filled: true,
// //           fillColor: Colors.white.withOpacity(0.3),
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10),
// //           ),
// //           contentPadding:
// //           const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// // import 'package:flutter/material.dart';
// // import 'app_drawer.dart'; // ✅ import drawer
// //
// // class ProfilePage extends StatefulWidget {
// //   const ProfilePage({super.key});
// //
// //   @override
// //   State<ProfilePage> createState() => _ProfilePageState();
// // }
// //
// // class _ProfilePageState extends State<ProfilePage> {
// //   bool isEditing = false;
// //
// //   final _firstNameController = TextEditingController(text: "First Name");
// //   final _lastNameController = TextEditingController(text: "Last Name");
// //   final _usernameController = TextEditingController(text: "Username");
// //   final _emailController =
// //   TextEditingController(text: "xyz@merveilleinvestments.com");
// //   final _passwordController = TextEditingController(text: "********");
// //   final _phoneController = TextEditingController(text: "+971-XX-XXXX-XXX");
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       drawer: const AppDrawer(), // ✅ ADD DRAWER
// //
// //       body: Container(
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topCenter,
// //             end: Alignment.bottomCenter,
// //             colors: [
// //               Color(0xFF2C577E),
// //               Color(0xFFBC9C22),
// //             ],
// //           ),
// //         ),
// //         child: SafeArea(
// //           child: SingleChildScrollView(
// //             padding: const EdgeInsets.symmetric(horizontal: 24),
// //             child: Column(
// //               children: [
// //                 const SizedBox(height: 10),
// //
// //                 /// TOP BAR (Drawer button instead of back)
// //                 Align(
// //                   alignment: Alignment.topLeft,
// //                   child: Builder(
// //                     builder: (context) => IconButton(
// //                       icon: const Icon(Icons.menu, color: Colors.black),
// //                       onPressed: () {
// //                         Scaffold.of(context).openDrawer();
// //                       },
// //                     ),
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 10),
// //
// //                 /// Profile image
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     shape: BoxShape.circle,
// //                     border: Border.all(color: Colors.white, width: 4),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Colors.black.withOpacity(0.2),
// //                         blurRadius: 10,
// //                         offset: const Offset(0, 5),
// //                       ),
// //                     ],
// //                   ),
// //                   child: const CircleAvatar(
// //                     radius: 60,
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 20),
// //
// //                 /// Edit button
// //                 TextButton(
// //                   onPressed: () {
// //                     setState(() {
// //                       isEditing = !isEditing;
// //                     });
// //                   },
// //                   child: Text(
// //                     isEditing ? "Stop Editing" : "Edit Information",
// //                     style: const TextStyle(
// //                       fontSize: 16,
// //                       color: Colors.black,
// //                       decoration: TextDecoration.underline,
// //                     ),
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 20),
// //
// //                 const Align(
// //                   alignment: Alignment.centerLeft,
// //                   child: Text(
// //                     "Profile Information",
// //                     style: TextStyle(
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black87,
// //                     ),
// //                   ),
// //                 ),
// //
// //                 _buildTextField("First Name", _firstNameController),
// //                 _buildTextField("Last Name", _lastNameController),
// //                 _buildTextField("Username", _usernameController),
// //                 _buildTextField("Email Address", _emailController),
// //                 _buildTextField(
// //                   "Password",
// //                   _passwordController,
// //                   obscureText: true,
// //                 ),
// //                 _buildTextField("Phone Number", _phoneController),
// //
// //                 const SizedBox(height: 30),
// //
// //                 ElevatedButton(
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: const Color(0xFFBC9C22),
// //                     foregroundColor: Colors.black,
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 40, vertical: 16),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                   ),
// //                   onPressed: () {
// //                     setState(() {
// //                       isEditing = false;
// //                     });
// //                   },
// //                   child: const Text("Done"),
// //                 ),
// //
// //                 const SizedBox(height: 30),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildTextField(
// //       String label,
// //       TextEditingController controller, {
// //         bool obscureText = false,
// //       }) {
// //     return Padding(
// //       padding: const EdgeInsets.only(top: 16),
// //       child: TextField(
// //         controller: controller,
// //         obscureText: obscureText,
// //         readOnly: !isEditing,
// //         decoration: InputDecoration(
// //           labelText: label,
// //           floatingLabelBehavior: FloatingLabelBehavior.always,
// //           filled: true,
// //           fillColor: Colors.white.withOpacity(0.3),
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10),
// //           ),
// //           contentPadding:
// //           const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//
// class MyProfile extends StatefulWidget {
//   const MyProfile({super.key});
//
//   @override
//   State<MyProfile> createState() => _MyProfileState();
// }
//
// class _MyProfileState extends State<MyProfile>
//     with SingleTickerProviderStateMixin {
//
//   late AnimationController _controller;
//
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 8),
//     )..repeat();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       body: Stack(
//         children: [
//
//           /// 🔥 Animated Gold Spotlight Background
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return Container(
//                 decoration: BoxDecoration(
//                   gradient: RadialGradient(
//                     center: Alignment(
//                       sin(_controller.value * 2 * pi),
//                       -0.3,
//                     ),
//                     radius: 1.4,
//                     colors: [
//                       gold.withOpacity(0.15),
//                       black,
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           /// 👑 MAIN CONTENT
//           SingleChildScrollView(
//             child: Column(
//               children: [
//
//                 const SizedBox(height: 120),
//
//                 /// 💎 Profile Avatar with Rotating Ring
//                 _legendaryAvatar(),
//
//                 const SizedBox(height: 30),
//
//                 /// ✨ Name with Gold Shimmer
//                 Shimmer.fromColors(
//                   baseColor: gold,
//                   highlightColor: Colors.white,
//                   child: const Text(
//                     "Alexander Merveille",
//                     style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 8),
//
//                 const Text(
//                   "Premium Member",
//                   style: TextStyle(
//                     color: Colors.white54,
//                     letterSpacing: 2,
//                   ),
//                 ),
//
//                 const SizedBox(height: 50),
//
//                 /// 🏆 Glass Profile Info Card
//                 _glassCard(
//                   child: Column(
//                     children: [
//                       _profileItem(Icons.email, "Email", "alex@merveille.com"),
//                       const Divider(color: Colors.white24),
//                       _profileItem(Icons.phone, "Phone", "+1 234 567 890"),
//                       const Divider(color: Colors.white24),
//                       _profileItem(Icons.workspace_premium,
//                           "Membership", "Elite Gold Tier"),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 40),
//
//                 /// 🚪 Logout Button
//                 _luxuryButton("LOG OUT", () {
//                   Navigator.pushNamedAndRemoveUntil(
//                       context, 'login', (route) => false);
//                 }),
//
//                 const SizedBox(height: 80),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// ⭐ Avatar with Rotating Gold Ring
//   Widget _legendaryAvatar() {
//     return SizedBox(
//       width: 200,
//       height: 200,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return Transform.rotate(
//                 angle: _controller.value * 2 * pi,
//                 child: CustomPaint(
//                   size: const Size(180, 180),
//                   painter: LiquidGoldPainter(
//                     animationValue: _controller.value,
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           Container(
//             width: 130,
//             height: 130,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: black,
//               border: Border.all(color: gold, width: 2),
//               boxShadow: [
//                 BoxShadow(
//                   color: gold.withOpacity(0.3),
//                   blurRadius: 30,
//                   spreadRadius: 5,
//                 ),
//               ],
//             ),
//             child: const Icon(
//               Icons.person,
//               color: Colors.white,
//               size: 60,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// 🏆 Glassmorphism Card
//   Widget _glassCard({required Widget child}) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 25),
//       padding: const EdgeInsets.all(25),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.05),
//         borderRadius: BorderRadius.circular(35),
//         border: Border.all(color: gold.withOpacity(0.3)),
//         boxShadow: [
//           BoxShadow(
//             color: gold.withOpacity(0.1),
//             blurRadius: 40,
//             spreadRadius: 5,
//           ),
//         ],
//       ),
//       child: child,
//     );
//   }
//
//   Widget _profileItem(IconData icon, String title, String value) {
//     return ListTile(
//       leading: Icon(icon, color: gold),
//       title: Text(
//         title,
//         style: const TextStyle(color: Colors.white70),
//       ),
//       subtitle: Text(
//         value,
//         style: const TextStyle(color: Colors.white),
//       ),
//     );
//   }
//
//   Widget _luxuryButton(String text, VoidCallback onPressed) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         height: 60,
//         margin: const EdgeInsets.symmetric(horizontal: 60),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(40),
//           gradient: const LinearGradient(
//             colors: [
//               Color(0xFFFFF3B0),
//               Color(0xFFD4AF37),
//               Color(0xFFB8902E),
//             ],
//           ),
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black,
//               offset: Offset(4, 8),
//               blurRadius: 15,
//             ),
//           ],
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 2,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// /// 🌟 Liquid Gold Ring Painter
// class LiquidGoldPainter extends CustomPainter {
//   final double animationValue;
//
//   LiquidGoldPainter({required this.animationValue});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Rect.fromLTWH(0, 0, size.width, size.height);
//
//     final gradient = SweepGradient(
//       colors: [
//         Colors.transparent,
//         Color(0xFFD4AF37).withOpacity(0.7),
//         Colors.white,
//         Color(0xFFD4AF37),
//         Colors.transparent,
//       ],
//       stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
//       transform: GradientRotation(animationValue * 2 * pi),
//     );
//
//     final paint = Paint()
//       ..shader = gradient.createShader(rect)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 8
//       ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
//
//     canvas.drawCircle(
//         Offset(size.width / 2, size.height / 2),
//         size.width / 2 - 8,
//         paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
// Theme is been applied
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//
// class MyProfile extends StatefulWidget {
//   const MyProfile({super.key});
//
//   @override
//   State<MyProfile> createState() => _MyProfileState();
// }
//
// class _MyProfileState extends State<MyProfile>
//     with SingleTickerProviderStateMixin {
//
//   late AnimationController _controller;
//
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 8),
//     )..repeat();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       body: Stack(
//         children: [
//
//           /// 🔥 Animated Gold Spotlight Background
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return Container(
//                 decoration: BoxDecoration(
//                   gradient: RadialGradient(
//                     center: Alignment(
//                       sin(_controller.value * 2 * pi),
//                       -0.3,
//                     ),
//                     radius: 1.4,
//                     colors: [
//                       gold.withOpacity(0.15),
//                       black,
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           /// 🔙 BACK BUTTON (SAME AS ABOUT PAGE)
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.arrow_back_ios,
//                     color: gold,
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//             ),
//           ),
//
//           /// 👑 MAIN CONTENT
//           SingleChildScrollView(
//             child: Column(
//               children: [
//
//                 const SizedBox(height: 120),
//
//                 /// 💎 Profile Avatar
//                 _legendaryAvatar(),
//
//                 const SizedBox(height: 30),
//
//                 /// ✨ Name with Gold Shimmer
//                 Shimmer.fromColors(
//                   baseColor: gold,
//                   highlightColor: Colors.white,
//                   child: const Text(
//                     "Alexander Merveille",
//                     style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 8),
//
//                 const Text(
//                   "Premium Member",
//                   style: TextStyle(
//                     color: Colors.white54,
//                     letterSpacing: 2,
//                   ),
//                 ),
//
//                 const SizedBox(height: 50),
//
//                 /// 🏆 Glass Profile Info Card
//                 _glassCard(
//                   child: Column(
//                     children: [
//                       _profileItem(Icons.email, "Email", "alex@merveille.com"),
//                       const Divider(color: Colors.white24),
//                       _profileItem(Icons.phone, "Phone", "+1 234 567 890"),
//                       const Divider(color: Colors.white24),
//                       _profileItem(
//                         Icons.workspace_premium,
//                         "Membership",
//                         "Elite Gold Tier",
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 40),
//
//                 /// 🚪 Logout Button
//                 _luxuryButton("LOG OUT", () {
//                   Navigator.pushNamedAndRemoveUntil(
//                     context,
//                     'login',
//                         (route) => false,
//                   );
//                 }),
//
//                 const SizedBox(height: 80),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// ⭐ Avatar with Rotating Gold Ring
//   Widget _legendaryAvatar() {
//     return SizedBox(
//       width: 200,
//       height: 200,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return Transform.rotate(
//                 angle: _controller.value * 2 * pi,
//                 child: CustomPaint(
//                   size: const Size(180, 180),
//                   painter: LiquidGoldPainter(
//                     animationValue: _controller.value,
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           Container(
//             width: 130,
//             height: 130,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: black,
//               border: Border.all(color: gold, width: 2),
//               boxShadow: [
//                 BoxShadow(
//                   color: gold.withOpacity(0.3),
//                   blurRadius: 30,
//                   spreadRadius: 5,
//                 ),
//               ],
//             ),
//             child: const Icon(
//               Icons.person,
//               color: Colors.white,
//               size: 60,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// 🏆 Glass Card
//   Widget _glassCard({required Widget child}) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 25),
//       padding: const EdgeInsets.all(25),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.05),
//         borderRadius: BorderRadius.circular(35),
//         border: Border.all(color: gold.withOpacity(0.3)),
//         boxShadow: [
//           BoxShadow(
//             color: gold.withOpacity(0.1),
//             blurRadius: 40,
//             spreadRadius: 5,
//           ),
//         ],
//       ),
//       child: child,
//     );
//   }
//
//   Widget _profileItem(IconData icon, String title, String value) {
//     return ListTile(
//       leading: Icon(icon, color: gold),
//       title: Text(
//         title,
//         style: const TextStyle(color: Colors.white70),
//       ),
//       subtitle: Text(
//         value,
//         style: const TextStyle(color: Colors.white),
//       ),
//     );
//   }
//
//   Widget _luxuryButton(String text, VoidCallback onPressed) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         height: 60,
//         margin: const EdgeInsets.symmetric(horizontal: 60),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(40),
//           gradient: const LinearGradient(
//             colors: [
//               Color(0xFFFFF3B0),
//               Color(0xFFD4AF37),
//               Color(0xFFB8902E),
//             ],
//           ),
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black,
//               offset: Offset(4, 8),
//               blurRadius: 15,
//             ),
//           ],
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 2,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// /// 🌟 Liquid Gold Ring Painter
// class LiquidGoldPainter extends CustomPainter {
//   final double animationValue;
//
//   LiquidGoldPainter({required this.animationValue});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Rect.fromLTWH(0, 0, size.width, size.height);
//
//     final gradient = SweepGradient(
//       colors: [
//         Colors.transparent,
//         Color(0xFFD4AF37).withOpacity(0.7),
//         Colors.white,
//         Color(0xFFD4AF37),
//         Colors.transparent,
//       ],
//       stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
//       transform: GradientRotation(animationValue * 2 * pi),
//     );
//
//     final paint = Paint()
//       ..shader = gradient.createShader(rect)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 8
//       ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
//
//     canvas.drawCircle(
//       Offset(size.width / 2, size.height / 2),
//       size.width / 2 - 8,
//       paint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
// From here we added back button functioning with the theme
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//
// class MyProfile extends StatefulWidget {
//   const MyProfile({super.key});
//
//   @override
//   State<MyProfile> createState() => _MyProfileState();
// }
//
// class _MyProfileState extends State<MyProfile>
//     with SingleTickerProviderStateMixin {
//
//   late AnimationController _controller;
//
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   @override
//   void initState() {
//     super.initState();
//     _controller =
//     AnimationController(vsync: this, duration: const Duration(seconds: 8))
//       ..repeat();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => true, // ✅ Android back enabled
//       child: Scaffold(
//         backgroundColor: black,
//
//         /// ✅ APPBAR WITH BACK BUTTON (LIKE ABOUT PAGE)
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//             onPressed: () {
//               Navigator.pop(context); // ✅ WORKING BACK
//             },
//           ),
//           title: const Text(
//             "My Profile",
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//
//         body: Stack(
//           children: [
//
//             /// 🔥 Animated Background
//             AnimatedBuilder(
//               animation: _controller,
//               builder: (_, __) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     gradient: RadialGradient(
//                       center: Alignment(
//                         sin(_controller.value * 2 * pi),
//                         -0.3,
//                       ),
//                       radius: 1.4,
//                       colors: [
//                         gold.withOpacity(0.15),
//                         black,
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//
//             /// 👑 CONTENT
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//
//                   const SizedBox(height: 40),
//
//                   _legendaryAvatar(),
//
//                   const SizedBox(height: 30),
//
//                   Shimmer.fromColors(
//                     baseColor: gold,
//                     highlightColor: Colors.white,
//                     child: const Text(
//                       "Alexander Merveille",
//                       style:
//                       TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//
//                   const SizedBox(height: 8),
//
//                   const Text(
//                     "Premium Member",
//                     style:
//                     TextStyle(color: Colors.white54, letterSpacing: 2),
//                   ),
//
//                   const SizedBox(height: 50),
//
//                   _glassCard(
//                     child: Column(
//                       children: [
//                         _profileItem(Icons.email, "Email",
//                             "alex@merveille.com"),
//                         const Divider(color: Colors.white24),
//                         _profileItem(
//                             Icons.phone, "Phone", "+1 234 567 890"),
//                         const Divider(color: Colors.white24),
//                         _profileItem(Icons.workspace_premium,
//                             "Membership", "Elite Gold Tier"),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 40),
//
//                   _luxuryButton("LOG OUT", () {
//                     Navigator.pushNamedAndRemoveUntil(
//                         context, '/login', (_) => false);
//                   }),
//
//                   const SizedBox(height: 80),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// ⭐ Avatar
//   Widget _legendaryAvatar() {
//     return SizedBox(
//       width: 200,
//       height: 200,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return Transform.rotate(
//                 angle: _controller.value * 2 * pi,
//                 child: CustomPaint(
//                   size: const Size(180, 180),
//                   painter:
//                   LiquidGoldPainter(animationValue: _controller.value),
//                 ),
//               );
//             },
//           ),
//
//           Container(
//             width: 130,
//             height: 130,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: black,
//               border: Border.all(color: gold, width: 2),
//               boxShadow: [
//                 BoxShadow(
//                   color: gold.withOpacity(0.3),
//                   blurRadius: 30,
//                   spreadRadius: 5,
//                 ),
//               ],
//             ),
//             child:
//             const Icon(Icons.person, color: Colors.white, size: 60),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _glassCard({required Widget child}) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 25),
//       padding: const EdgeInsets.all(25),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.05),
//         borderRadius: BorderRadius.circular(35),
//         border: Border.all(color: gold.withOpacity(0.3)),
//       ),
//       child: child,
//     );
//   }
//
//   Widget _profileItem(IconData icon, String title, String value) {
//     return ListTile(
//       leading: Icon(icon, color: gold),
//       title: Text(title, style: const TextStyle(color: Colors.white70)),
//       subtitle: Text(value, style: const TextStyle(color: Colors.white)),
//     );
//   }
//
//   Widget _luxuryButton(String text, VoidCallback onPressed) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         height: 60,
//         margin: const EdgeInsets.symmetric(horizontal: 60),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(40),
//           gradient: const LinearGradient(
//             colors: [
//               Color(0xFFFFF3B0),
//               Color(0xFFD4AF37),
//               Color(0xFFB8902E),
//             ],
//           ),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 2),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// /// 🎨 Ring Painter
// class LiquidGoldPainter extends CustomPainter {
//   final double animationValue;
//
//   LiquidGoldPainter({required this.animationValue});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Rect.fromLTWH(0, 0, size.width, size.height);
//
//     final gradient = SweepGradient(
//       colors: [
//         Colors.transparent,
//         Color(0xFFD4AF37).withOpacity(0.7),
//         Colors.white,
//         Color(0xFFD4AF37),
//         Colors.transparent,
//       ],
//       transform: GradientRotation(animationValue * 2 * pi),
//     );
//
//     final paint = Paint()
//       ..shader = gradient.createShader(rect)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 8;
//
//     canvas.drawCircle(
//         Offset(size.width / 2, size.height / 2),
//         size.width / 2 - 8,
//         paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//
// class MyProfile extends StatefulWidget {
//   const MyProfile({super.key});
//
//   @override
//   State<MyProfile> createState() => _MyProfileState();
// }
//
// class _MyProfileState extends State<MyProfile>
//     with SingleTickerProviderStateMixin {
//
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 8),
//     )..repeat();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       body: Stack(
//         children: [
//
//           /// 🔥 Animated Gold Spotlight Background (SAME AS ABOUT)
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return Container(
//                 decoration: BoxDecoration(
//                   gradient: RadialGradient(
//                     center: Alignment(
//                       sin(_controller.value * 2 * pi),
//                       -0.4,
//                     ),
//                     radius: 1.5,
//                     colors: [
//                       gold.withOpacity(0.15),
//                       black,
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//
//                   /// 🔙 BACK BUTTON (IDENTICAL LOGIC AS ABOUT PAGE)
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: IconButton(
//                       icon: const Icon(Icons.arrow_back_ios, color: gold),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   /// 💎 Avatar
//                   _legendaryAvatar(),
//
//                   const SizedBox(height: 30),
//
//                   /// ✨ Name Shimmer
//                   Shimmer.fromColors(
//                     baseColor: gold,
//                     highlightColor: Colors.white,
//                     child: const Text(
//                       "Dr. Syed Touseef",
//                       style: TextStyle(
//                         fontSize: 26,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1.2,
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 8),
//
//                   const Text(
//                     "Premium Member",
//                     style: TextStyle(
//                       color: Colors.white54,
//                       letterSpacing: 2,
//                     ),
//                   ),
//
//                   const SizedBox(height: 40),
//
//                   /// 🏆 Glass Profile Card
//                   _glassCard(
//                     child: Column(
//                       children: [
//                         _profileItem(Icons.email, "Email", "alex@merveille.com"),
//                         const Divider(color: Colors.white24),
//                         _profileItem(Icons.phone, "Phone", "+1 234 567 890"),
//                         const Divider(color: Colors.white24),
//                         _profileItem(Icons.workspace_premium,
//                             "Membership", "Elite Gold Tier"),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 40),
//
//                   /// 🚪 Logout
//                   _luxuryButton("LOG OUT", () {
//                     Navigator.pushNamedAndRemoveUntil(
//                       context,
//                       '/login',
//                           (_) => false,
//                     );
//                   }),
//
//                   const SizedBox(height: 80),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// ⭐ Avatar with Ring
//   Widget _legendaryAvatar() {
//     return SizedBox(
//       width: 200,
//       height: 200,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return Transform.rotate(
//                 angle: _controller.value * 2 * pi,
//                 child: CustomPaint(
//                   size: const Size(180, 180),
//                   painter: LiquidGoldPainter(
//                     animationValue: _controller.value,
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           Container(
//             width: 130,
//             height: 130,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: black,
//               border: Border.all(color: gold, width: 2),
//               boxShadow: [
//                 BoxShadow(
//                   color: gold.withOpacity(0.3),
//                   blurRadius: 30,
//                   spreadRadius: 5,
//                 ),
//               ],
//             ),
//             child: const Icon(
//               Icons.person,
//               color: Colors.white,
//               size: 60,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// 🏆 Glass Card
//   Widget _glassCard({required Widget child}) {
//     return Container(
//       padding: const EdgeInsets.all(28),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.06),
//         borderRadius: BorderRadius.circular(35),
//         border: Border.all(color: gold.withOpacity(0.3)),
//         boxShadow: [
//           BoxShadow(
//             color: gold.withOpacity(0.15),
//             blurRadius: 40,
//             spreadRadius: 5,
//           ),
//         ],
//       ),
//       child: child,
//     );
//   }
//
//   Widget _profileItem(IconData icon, String title, String value) {
//     return ListTile(
//       leading: Icon(icon, color: gold),
//       title: Text(title, style: const TextStyle(color: Colors.white70)),
//       subtitle: Text(value, style: const TextStyle(color: Colors.white)),
//     );
//   }
//
//   Widget _luxuryButton(String text, VoidCallback onPressed) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         height: 60,
//         margin: const EdgeInsets.symmetric(horizontal: 60),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(40),
//           gradient: const LinearGradient(
//             colors: [
//               Color(0xFFFFF3B0),
//               Color(0xFFD4AF37),
//               Color(0xFFB8902E),
//             ],
//           ),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 2,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// /// 🎨 Gold Ring Painter
// class LiquidGoldPainter extends CustomPainter {
//   final double animationValue;
//
//   LiquidGoldPainter({required this.animationValue});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Rect.fromLTWH(0, 0, size.width, size.height);
//
//     final gradient = SweepGradient(
//       colors: [
//         Colors.transparent,
//         Color(0xFFD4AF37).withOpacity(0.7),
//         Colors.white,
//         Color(0xFFD4AF37),
//         Colors.transparent,
//       ],
//       transform: GradientRotation(animationValue * 2 * pi),
//     );
//
//     final paint = Paint()
//       ..shader = gradient.createShader(rect)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 8;
//
//     canvas.drawCircle(
//       Offset(size.width / 2, size.height / 2),
//       size.width / 2 - 8,
//       paint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

// -----------------------------------------
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class MyProfile extends StatefulWidget {
//   const MyProfile({super.key});
//
//   @override
//   State<MyProfile> createState() => _MyProfileState();
// }
//
// class _MyProfileState extends State<MyProfile>
//     with SingleTickerProviderStateMixin {
//
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//   final user = FirebaseAuth.instance.currentUser;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 8),
//     )..repeat();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       body: Stack(
//         children: [
//
//           /// 🔥 Animated Gold Spotlight
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return Container(
//                 decoration: BoxDecoration(
//                   gradient: RadialGradient(
//                     center: Alignment(
//                       sin(_controller.value * 2 * pi),
//                       -0.4,
//                     ),
//                     radius: 1.5,
//                     colors: [
//                       gold.withOpacity(0.15),
//                       black,
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//
//                   /// 🔙 Back
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: IconButton(
//                       icon: const Icon(Icons.arrow_back_ios, color: gold),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   /// 💎 Avatar
//                   _legendaryAvatar(),
//
//                   const SizedBox(height: 30),
//
//                   /// ✨ Name
//                   Shimmer.fromColors(
//                     baseColor: gold,
//                     highlightColor: Colors.white,
//                     child: Text(
//                       user?.displayName ?? "Premium User",
//                       style: const TextStyle(
//                         fontSize: 26,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1.2,
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 8),
//
//                   const Text(
//                     "Authenticated Member",
//                     style: TextStyle(
//                       color: Colors.white54,
//                       letterSpacing: 2,
//                     ),
//                   ),
//
//                   const SizedBox(height: 40),
//
//                   /// 🏆 Profile Info
//                   _glassCard(
//                     child: Column(
//                       children: [
//                         _profileItem(
//                           Icons.email,
//                           "Email",
//                           user?.email ?? "Not available",
//                         ),
//                         const Divider(color: Colors.white24),
//                         _profileItem(
//                           Icons.verified_user,
//                           "Account Status",
//                           user?.emailVerified == true
//                               ? "Verified"
//                               : "Not Verified",
//                         ),
//                         const Divider(color: Colors.white24),
//                         _profileItem(
//                           Icons.security,
//                           "UID",
//                           user?.uid.substring(0, 8) ?? "---",
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 40),
//
//                   /// 🚪 LOGOUT (🔥 FIXED)
//                   _luxuryButton("LOG OUT", () async {
//                     await FirebaseAuth.instance.signOut();
//                     // ❌ NO NAVIGATION HERE
//                     // ✅ AuthGate will redirect automatically
//                   }),
//
//                   const SizedBox(height: 80),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// ⭐ Avatar
//   Widget _legendaryAvatar() {
//     return SizedBox(
//       width: 200,
//       height: 200,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return Transform.rotate(
//                 angle: _controller.value * 2 * pi,
//                 child: CustomPaint(
//                   size: const Size(180, 180),
//                   painter: LiquidGoldPainter(
//                     animationValue: _controller.value,
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           Container(
//             width: 130,
//             height: 130,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: black,
//               border: Border.all(color: gold, width: 2),
//               boxShadow: [
//                 BoxShadow(
//                   color: gold.withOpacity(0.3),
//                   blurRadius: 30,
//                   spreadRadius: 5,
//                 ),
//               ],
//             ),
//             child: const Icon(
//               Icons.person,
//               color: Colors.white,
//               size: 60,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// 🏆 Glass Card
//   Widget _glassCard({required Widget child}) {
//     return Container(
//       padding: const EdgeInsets.all(28),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.06),
//         borderRadius: BorderRadius.circular(35),
//         border: Border.all(color: gold.withOpacity(0.3)),
//         boxShadow: [
//           BoxShadow(
//             color: gold.withOpacity(0.15),
//             blurRadius: 40,
//             spreadRadius: 5,
//           ),
//         ],
//       ),
//       child: child,
//     );
//   }
//
//   Widget _profileItem(IconData icon, String title, String value) {
//     return ListTile(
//       leading: Icon(icon, color: gold),
//       title: Text(title, style: const TextStyle(color: Colors.white70)),
//       subtitle: Text(value, style: const TextStyle(color: Colors.white)),
//     );
//   }
//
//   Widget _luxuryButton(String text, VoidCallback onPressed) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         height: 60,
//         margin: const EdgeInsets.symmetric(horizontal: 60),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(40),
//           gradient: const LinearGradient(
//             colors: [
//               Color(0xFFFFF3B0),
//               Color(0xFFD4AF37),
//               Color(0xFFB8902E),
//             ],
//           ),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 2,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// /// 🎨 Gold Ring Painter
// class LiquidGoldPainter extends CustomPainter {
//   final double animationValue;
//
//   LiquidGoldPainter({required this.animationValue});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Rect.fromLTWH(0, 0, size.width, size.height);
//
//     final gradient = SweepGradient(
//       colors: [
//         Colors.transparent,
//         Color(0xFFD4AF37).withOpacity(0.7),
//         Colors.white,
//         Color(0xFFD4AF37),
//         Colors.transparent,
//       ],
//       transform: GradientRotation(animationValue * 2 * pi),
//     );
//
//     final paint = Paint()
//       ..shader = gradient.createShader(rect)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 8;
//
//     canvas.drawCircle(
//       Offset(size.width / 2, size.height / 2),
//       size.width / 2 - 8,
//       paint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
//

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>
    with SingleTickerProviderStateMixin {

  static const Color black = Color(0xFF080808);
  static const Color gold = Color(0xFFD4AF37);

  late AnimationController _controller;
  final user = FirebaseAuth.instance.currentUser;

  String userName = "Premium User";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .get();

      if (doc.exists) {
        setState(() {
          userName = doc.data()?['name'] ?? "Premium User";
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [

          /// 🔥 Animated Gold Spotlight (Same as Login)
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              return Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(
                      sin(_controller.value * 2 * pi),
                      -0.4,
                    ),
                    radius: 1.4,
                    colors: [
                      gold.withOpacity(0.15),
                      black,
                    ],
                  ),
                ),
              );
            },
          ),

          /// ✨ Gold Grid Background
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: GoldGridPainter(),
          ),

          /// 👑 MAIN CONTENT
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [

                  /// 🔙 Back
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: gold),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// 💎 Legendary Avatar
                  _legendaryAvatar(),

                  const SizedBox(height: 30),

                  /// ✨ Firestore Name
                  isLoading
                      ? const CircularProgressIndicator(color: gold)
                      : Shimmer.fromColors(
                    baseColor: gold,
                    highlightColor: Colors.white,
                    child: Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Authenticated Member",
                    style: TextStyle(
                      color: Colors.white54,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// 🏆 Profile Info Card
                  _glassCard(
                    child: Column(
                      children: [
                        _profileItem(
                          Icons.email,
                          "Email",
                          user?.email ?? "Not available",
                        ),
                        const Divider(color: Colors.white24),
                        _profileItem(
                          Icons.verified_user,
                          "Account Status",
                          user?.emailVerified == true
                              ? "Verified"
                              : "Not Verified",
                        ),
                        const Divider(color: Colors.white24),
                        _profileItem(
                          Icons.security,
                          "UID",
                          user?.uid.substring(0, 8) ?? "---",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// 🚪 Logout
                  _luxuryButton("LOG OUT", () async {
                    await FirebaseAuth.instance.signOut();
                    // AuthGate handles redirect
                  }),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ⭐ Animated Avatar
  Widget _legendaryAvatar() {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [

          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              return Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: CustomPaint(
                  size: const Size(180, 180),
                  painter: LiquidGoldPainter(
                    animationValue: _controller.value,
                  ),
                ),
              );
            },
          ),

          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: black,
              border: Border.all(color: gold, width: 2),
              boxShadow: [
                BoxShadow(
                  color: gold.withOpacity(0.3),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 60,
            ),
          ),
        ],
      ),
    );
  }

  /// 🏆 Glass Card
  Widget _glassCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: gold.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: gold.withOpacity(0.15),
            blurRadius: 40,
            spreadRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _profileItem(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon, color: gold),
      title: Text(title, style: const TextStyle(color: Colors.white70)),
      subtitle: Text(value, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _luxuryButton(String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFFFF3B0),
              Color(0xFFD4AF37),
              Color(0xFFB8902E),
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}

/// ✨ Gold Grid Painter (Same as Login)
class GoldGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD4AF37).withOpacity(0.05)
      ..strokeWidth = 1;

    const gap = 40.0;
    for (double i = 0; i < size.width; i += gap) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += gap) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

/// 🌟 Liquid Gold Ring
class LiquidGoldPainter extends CustomPainter {
  final double animationValue;

  LiquidGoldPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final gradient = SweepGradient(
      colors: [
        Colors.transparent,
        const Color(0xFFD4AF37).withOpacity(0.7),
        Colors.white,
        const Color(0xFFD4AF37),
        Colors.transparent,
      ],
      transform: GradientRotation(animationValue * 2 * pi),
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2 - 8,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}