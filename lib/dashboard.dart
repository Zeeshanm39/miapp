// import 'package:flutter/material.dart';
//
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await ThemeManager.initialise();
//   await setupLocator();
//   runApp(const App());
// }
// setupLocator() {
// }
// class ThemeManager {
//   static initialise() {}
// }
//
// class App extends StatelessWidget {
//   const App({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ThemeBuilder(
//       defaultThemeMode: ThemeMode.light,
//       darkTheme: ThemeData.dark(),
//       lightTheme: ThemeData.light(),
//       builder: (context, regularTheme, darkTheme, themeMode) => materialApp(context, regularTheme, darkTheme, themeMode),
//     );
//   }
//
//   Widget materialApp(context, regularTheme, darkTheme, themeMode) {
//     return MaterialApp(
//       title: 'Your Dashboard',
//       theme: regularTheme,
//       themeMode: themeMode,
//       debugShowCheckedModeBanner: false,
//       initialRoute: Root.routeName,
//       navigatorKey: StackedService.navigatorKey,
//       onGenerateRoute: StackedRouter().onGenerateRoute, builder: (context, child) => ResponsiveWrapper.builder( useShortestSide: false, defaultScale: true, child: child, breakpoints: [
//         ResponsiveBreakpoint.resize(600, name: 'MOBILE'),
//         ResponsiveBreakpoint.autoScale(800, name: 'TABLET', scaleFactor: 0.7),
//         ResponsiveBreakpoint.autoScale(1200, name: 'DESKTOP', scaleFactor: 0.7),
//   ],
// ),
//     );
//   }
// }
//
// class ResponsiveBreakpoint {
//   const ResponsiveBreakpoint();
//   static autoScale(int i, {required String name, required double scaleFactor}) {}
//   static resize(int i, {required String name}) {}
// }
//
// class ResponsiveWrapper {
//   static Widget builder({required bool useShortestSide, required bool defaultScale, Widget? child, required List<dynamic> breakpoints, param4}) {
//     return child ?? SizedBox();
//   }
// }
//
// class StackedRouter {
//   Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
//     return null;
//   }
// }
//
// class StackedService {
//   static var navigatorKey;
// }
//
// class Root {
//   static var routeName;
// }
//
// class ThemeBuilder extends StatelessWidget {
//   final ThemeMode defaultThemeMode;
//   final ThemeData darkTheme;
//   final ThemeData lightTheme;
//   final Widget Function(BuildContext, ThemeData, ThemeData, ThemeMode) builder;
//
//   const ThemeBuilder({
//     required this.defaultThemeMode,
//     required this.darkTheme,
//     required this.lightTheme,
//     required this.builder,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return builder(context, lightTheme, darkTheme, defaultThemeMode);
//   }
// }

// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//
// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});
//
//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage>
//     with SingleTickerProviderStateMixin {
//
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//   int _currentIndex = 0;
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
//       drawer: _appDrawer(context),
//       bottomNavigationBar: _bottomNav(),
//       body: Stack(
//         children: [
//
//           /// 🔥 Animated Gold Background
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
//                     radius: 1.5,
//                     colors: [
//                       gold.withOpacity(0.12),
//                       black,
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   /// TOP BAR
//                   Row(
//                     children: [
//                       Builder(
//                         builder: (context) => IconButton(
//                           icon: const Icon(Icons.menu, color: gold),
//                           onPressed: () => Scaffold.of(context).openDrawer(),
//                         ),
//                       ),
//                       const Spacer(),
//                       const Icon(Icons.notifications, color: gold),
//                     ],
//                   ),
//
//                   const SizedBox(height: 30),
//
//                   /// WELCOME
//                   Shimmer.fromColors(
//                     baseColor: gold,
//                     highlightColor: Colors.white,
//                     child: const Text(
//                       "Welcome Back,",
//                       style: TextStyle(fontSize: 22),
//                     ),
//                   ),
//
//                   const SizedBox(height: 5),
//
//                   const Text(
//                     "Dr. Syed Touseef",
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//
//                   const SizedBox(height: 40),
//
//                   /// KPI CARDS
//                   Expanded(
//                     child: GridView.count(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 20,
//                       crossAxisSpacing: 20,
//                       children: [
//                         _kpiCard("Clients", "128", Icons.people),
//                         _kpiCard("Revenue", "\$2.4M", Icons.trending_up),
//                         _kpiCard("Projects", "36", Icons.workspaces),
//                         _kpiCard("Reports", "14", Icons.bar_chart),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// 🏆 KPI CARD
//   Widget _kpiCard(String title, String value, IconData icon) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: Colors.white.withOpacity(0.06),
//         border: Border.all(color: gold.withOpacity(0.3)),
//         boxShadow: [
//           BoxShadow(
//             color: gold.withOpacity(0.15),
//             blurRadius: 30,
//             spreadRadius: 5,
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: gold, size: 30),
//           const Spacer(),
//           Text(
//             value,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 26,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white54),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// 📌 DRAWER
//   Drawer _appDrawer(BuildContext context) {
//     return Drawer(
//       backgroundColor: black,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(color: gold.withOpacity(0.1)),
//             child: const Text(
//               "Merveille Dashboard",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//
//           _drawerItem(Icons.dashboard, "Dashboard", () {
//             Navigator.pop(context);
//           }),
//
//           _drawerItem(Icons.person, "Profile", () {
//             Navigator.pushNamed(context, 'profile');
//           }),
//
//           _drawerItem(Icons.info, "About", () {
//             Navigator.pushNamed(context, 'about');
//           }),
//
//           _drawerItem(Icons.logout, "Logout", () {
//             Navigator.pushNamedAndRemoveUntil(
//               context,
//               'login',
//                   (route) => false,
//             );
//           }),
//         ],
//       ),
//     );
//   }
//
//   ListTile _drawerItem(IconData icon, String title, VoidCallback onTap) {
//     return ListTile(
//       leading: Icon(icon, color: gold),
//       title: Text(title, style: const TextStyle(color: Colors.white)),
//       onTap: onTap,
//     );
//   }
//
//   /// 🔽 BOTTOM NAV
//   Widget _bottomNav() {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       backgroundColor: black,
//       selectedItemColor: gold,
//       unselectedItemColor: Colors.white38,
//       onTap: (index) {
//         setState(() => _currentIndex = index);
//       },
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//         BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analytics"),
//         BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
//       ],
//     );
//   }
// }

// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});
//
//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage>
//     with SingleTickerProviderStateMixin {
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//   int _currentIndex = 0;
//
//   String userName = "";
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 8),
//     )..repeat();
//
//     fetchUserName();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   /// 🔹 Fetch user name from Firestore
//   Future<void> fetchUserName() async {
//     try {
//       final uid = FirebaseAuth.instance.currentUser?.uid;
//       if (uid != null) {
//         final doc =
//         await FirebaseFirestore.instance.collection('users').doc(uid).get();
//         if (doc.exists) {
//           setState(() {
//             userName = doc['name'] ?? "User";
//           });
//         }
//       }
//     } catch (e) {
//       print("Error fetching user name: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       drawer: _appDrawer(context),
//       bottomNavigationBar: _bottomNav(),
//       body: Stack(
//         children: [
//           /// 🔥 Animated Gold Background
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
//                     radius: 1.5,
//                     colors: [
//                       gold.withOpacity(0.12),
//                       black,
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// TOP BAR
//                   Row(
//                     children: [
//                       Builder(
//                         builder: (context) => IconButton(
//                           icon: const Icon(Icons.menu, color: gold),
//                           onPressed: () => Scaffold.of(context).openDrawer(),
//                         ),
//                       ),
//                       const Spacer(),
//                       const Icon(Icons.notifications, color: gold),
//                     ],
//                   ),
//
//                   const SizedBox(height: 30),
//
//                   /// WELCOME
//                   Shimmer.fromColors(
//                     baseColor: gold,
//                     highlightColor: Colors.white,
//                     child: const Text(
//                       "Welcome Back,",
//                       style: TextStyle(fontSize: 22),
//                     ),
//                   ),
//
//                   const SizedBox(height: 5),
//
//                   /// 🔹 Dynamic user name
//                   Text(
//                     userName.isEmpty ? "Loading..." : userName,
//                     style: const TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//
//                   const SizedBox(height: 40),
//
//                   /// KPI CARDS
//                   Expanded(
//                     child: GridView.count(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 20,
//                       crossAxisSpacing: 20,
//                       children: [
//                         _kpiCard("Clients", "128", Icons.people),
//                         _kpiCard("Revenue", "\$2.4M", Icons.trending_up),
//                         _kpiCard("Projects", "36", Icons.workspaces),
//                         _kpiCard("Reports", "14", Icons.bar_chart),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// 🏆 KPI CARD
//   Widget _kpiCard(String title, String value, IconData icon) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: Colors.white.withOpacity(0.06),
//         border: Border.all(color: gold.withOpacity(0.3)),
//         boxShadow: [
//           BoxShadow(
//             color: gold.withOpacity(0.15),
//             blurRadius: 30,
//             spreadRadius: 5,
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: gold, size: 30),
//           const Spacer(),
//           Text(
//             value,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 26,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white54),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// 📌 DRAWER
//   Drawer _appDrawer(BuildContext context) {
//     return Drawer(
//       backgroundColor: black,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(color: gold.withOpacity(0.1)),
//             child: const Text(
//               "Merveille Dashboard",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           _drawerItem(Icons.dashboard, "Dashboard", () {
//             Navigator.pop(context);
//           }),
//           _drawerItem(Icons.person, "Profile", () {
//             Navigator.pushNamed(context, 'profile');
//           }),
//           _drawerItem(Icons.info, "About", () {
//             Navigator.pushNamed(context, 'about');
//           }),
//           _drawerItem(Icons.logout, "Logout", () {
//             FirebaseAuth.instance.signOut();
//             Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
//           }),
//         ],
//       ),
//     );
//   }
//
//   ListTile _drawerItem(IconData icon, String title, VoidCallback onTap) {
//     return ListTile(
//       leading: Icon(icon, color: gold),
//       title: Text(title, style: const TextStyle(color: Colors.white)),
//       onTap: onTap,
//     );
//   }
//
//   /// 🔽 BOTTOM NAV
//   Widget _bottomNav() {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       backgroundColor: black,
//       selectedItemColor: gold,
//       unselectedItemColor: Colors.white38,
//       onTap: (index) {
//         setState(() => _currentIndex = index);
//       },
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//         BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analytics"),
//         BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
//       ],
//     );
//   }
// }

//-------------------------
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});
//
//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage>
//     with SingleTickerProviderStateMixin {
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//   int _currentIndex = 0;
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
//       drawer: _appDrawer(context),
//       bottomNavigationBar: _bottomNav(),
//       body: Stack(
//         children: [
//           /// 🔥 Animated Gold Background
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
//                     radius: 1.5,
//                     colors: [
//                       gold.withOpacity(0.12),
//                       black,
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// TOP BAR
//                   Row(
//                     children: [
//                       Builder(
//                         builder: (context) => IconButton(
//                           icon: const Icon(Icons.menu, color: gold),
//                           onPressed: () => Scaffold.of(context).openDrawer(),
//                         ),
//                       ),
//                       const Spacer(),
//                       const Icon(Icons.notifications, color: gold),
//                     ],
//                   ),
//
//                   const SizedBox(height: 30),
//
//                   /// WELCOME
//                   Shimmer.fromColors(
//                     baseColor: gold,
//                     highlightColor: Colors.white,
//                     child: const Text(
//                       "Welcome Back,",
//                       style: TextStyle(fontSize: 22),
//                     ),
//                   ),
//
//                   const SizedBox(height: 5),
//
//                   /// 🔹 Dynamic user name with StreamBuilder
//                   StreamBuilder<DocumentSnapshot>(
//                     stream: FirebaseFirestore.instance
//                         .collection('users')
//                         .doc(FirebaseAuth.instance.currentUser!.uid)
//                         .snapshots(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Text(
//                           "Loading...",
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         );
//                       }
//
//                       if (snapshot.hasError ||
//                           !snapshot.hasData ||
//                           !snapshot.data!.exists) {
//                         return const Text(
//                           "User",
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         );
//                       }
//
//                       final userDoc = snapshot.data!;
//                       final name = userDoc['name'] ?? "User";
//
//                       return Text(
//                         name,
//                         style: const TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       );
//                     },
//                   ),
//
//                   const SizedBox(height: 40),
//
//                   /// KPI CARDS
//                   Expanded(
//                     child: GridView.count(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 20,
//                       crossAxisSpacing: 20,
//                       children: [
//                         _kpiCard("Clients", "128", Icons.people),
//                         _kpiCard("Revenue", "\$2.4M", Icons.trending_up),
//                         _kpiCard("Projects", "36", Icons.workspaces),
//                         _kpiCard("Reports", "14", Icons.bar_chart),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// 🏆 KPI CARD
//   Widget _kpiCard(String title, String value, IconData icon) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: Colors.white.withOpacity(0.06),
//         border: Border.all(color: gold.withOpacity(0.3)),
//         boxShadow: [
//           BoxShadow(
//             color: gold.withOpacity(0.15),
//             blurRadius: 30,
//             spreadRadius: 5,
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: gold, size: 30),
//           const Spacer(),
//           Text(
//             value,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 26,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white54),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// 📌 DRAWER
//   Drawer _appDrawer(BuildContext context) {
//     return Drawer(
//       backgroundColor: black,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           /// 🔹 Drawer Header with dynamic user name
//           StreamBuilder<DocumentSnapshot>(
//             stream: FirebaseFirestore.instance
//                 .collection('users')
//                 .doc(FirebaseAuth.instance.currentUser!.uid)
//                 .snapshots(),
//             builder: (context, snapshot) {
//               String displayName = "User";
//               if (snapshot.hasData && snapshot.data!.exists) {
//                 displayName = snapshot.data!['name'] ?? "User";
//               }
//
//               return DrawerHeader(
//                 decoration: BoxDecoration(color: gold.withOpacity(0.1)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       "Merveille Dashboard",
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       displayName,
//                       style: const TextStyle(
//                         color: Colors.white70,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//
//           _drawerItem(Icons.dashboard, "Dashboard", () {
//             Navigator.pop(context);
//           }),
//           _drawerItem(Icons.person, "Profile", () {
//             Navigator.pushNamed(context, 'profile');
//           }),
//           _drawerItem(Icons.info, "About", () {
//             Navigator.pushNamed(context, 'about');
//           }),
//           _drawerItem(Icons.logout, "Logout", () {
//             FirebaseAuth.instance.signOut();
//             Navigator.pushNamedAndRemoveUntil(
//                 context, 'login', (route) => false);
//           }),
//         ],
//       ),
//     );
//   }
//
//   ListTile _drawerItem(IconData icon, String title, VoidCallback onTap) {
//     return ListTile(
//       leading: Icon(icon, color: gold),
//       title: Text(title, style: const TextStyle(color: Colors.white)),
//       onTap: onTap,
//     );
//   }
//
//   /// 🔽 BOTTOM NAV
//   Widget _bottomNav() {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       backgroundColor: black,
//       selectedItemColor: gold,
//       unselectedItemColor: Colors.white38,
//       onTap: (index) {
//         setState(() => _currentIndex = index);
//       },
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//         BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analytics"),
//         BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
//       ],
//     );
//   }
// }

//
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:miapp/setting_page.dart';
//
// import 'analytics_page.dart';
//
// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});
//
//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage>
//     with SingleTickerProviderStateMixin {
//
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//
//   int _currentIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 8),
//     )..repeat();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       body: Stack(
//         children: [
//
//           /// Animated gold background
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
//                     radius: 1.5,
//                     colors: [
//                       gold.withOpacity(0.12),
//                       black,
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           SafeArea(
//             child: _pages(),
//           ),
//         ],
//       ),
//
//       bottomNavigationBar: _bottomNav(),
//     );
//   }
//
//   /// Pages
//   Widget _pages() {
//
//     switch (_currentIndex) {
//       case 0:
//         return _dashboard();
//       case 1:
//         return const AnalyticsPage();
//       case 2:
//         return const SettingsPage();
//       default:
//         return _dashboard();
//     }
//   }
//
//   /// Dashboard Page
//   Widget _dashboard() {
//
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           /// Header
//           Row(
//             children: [
//               const Icon(Icons.dashboard, color: gold),
//               const SizedBox(width: 10),
//               const Text(
//                 "Investor Dashboard",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold),
//               ),
//               const Spacer(),
//               IconButton(
//                   onPressed: () {
//                     FirebaseAuth.instance.signOut();
//                   },
//                   icon: const Icon(Icons.logout, color: gold))
//             ],
//           ),
//
//           const SizedBox(height: 30),
//
//           /// KPI Cards
//           SizedBox(
//             height: 170,
//             child: GridView(
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate:
//               const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 15,
//                 crossAxisSpacing: 15,
//                 childAspectRatio: 1.7,
//               ),
//               children: [
//
//                 _totalInvestors(),
//                 _totalInvestment(),
//                 _totalPaid(),
//                 _totalBalance(),
//
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 25),
//
//           const Text(
//             "Active Investors",
//             style: TextStyle(
//                 color: gold,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 15),
//
//           /// Investor list
//           Expanded(
//             child: _investorList(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// KPI Cards
//
//   Widget _kpiCard(String title, String value, IconData icon) {
//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(.05),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: gold.withOpacity(.3)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           Icon(icon, color: gold),
//
//           const Spacer(),
//
//           Text(
//             value,
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white60),
//           )
//         ],
//       ),
//     );
//   }
//
//   /// Total Investors
//   Widget _totalInvestors() {
//     return StreamBuilder<QuerySnapshot>(
//       stream:
//       FirebaseFirestore.instance.collection('investments').snapshots(),
//       builder: (context, snapshot) {
//
//         if (!snapshot.hasData) {
//           return _kpiCard("Investors", "...", Icons.people);
//         }
//
//         return _kpiCard(
//             "Investors",
//             snapshot.data!.docs.length.toString(),
//             Icons.people);
//       },
//     );
//   }
//
//   /// Total Investment
//   Widget _totalInvestment() {
//     return StreamBuilder<QuerySnapshot>(
//       stream:
//       FirebaseFirestore.instance.collection('investments').snapshots(),
//       builder: (context, snapshot) {
//
//         double total = 0;
//
//         if (snapshot.hasData) {
//           for (var doc in snapshot.data!.docs) {
//             total += (doc['investmentAmount'] ?? 0).toDouble();
//           }
//         }
//
//         return _kpiCard(
//             "Investment",
//             total.toStringAsFixed(0),
//             Icons.account_balance);
//       },
//     );
//   }
//
//   /// Total Paid
//   Widget _totalPaid() {
//     return StreamBuilder<QuerySnapshot>(
//       stream:
//       FirebaseFirestore.instance.collection('investments').snapshots(),
//       builder: (context, snapshot) {
//
//         double total = 0;
//
//         if (snapshot.hasData) {
//           for (var doc in snapshot.data!.docs) {
//             total += (doc['paidTillDate'] ?? 0).toDouble();
//           }
//         }
//
//         return _kpiCard(
//             "Paid",
//             total.toStringAsFixed(0),
//             Icons.payments);
//       },
//     );
//   }
//
//   /// Total Balance
//   Widget _totalBalance() {
//     return StreamBuilder<QuerySnapshot>(
//       stream:
//       FirebaseFirestore.instance.collection('investments').snapshots(),
//       builder: (context, snapshot) {
//
//         double total = 0;
//
//         if (snapshot.hasData) {
//           for (var doc in snapshot.data!.docs) {
//             total += (doc['balanceProfit'] ?? 0).toDouble();
//           }
//         }
//
//         return _kpiCard(
//             "Balance",
//             total.toStringAsFixed(0),
//             Icons.trending_down);
//       },
//     );
//   }
//
//   /// Investor List
//   Widget _investorList() {
//     return StreamBuilder<QuerySnapshot>(
//       stream:
//       FirebaseFirestore.instance.collection('investments').snapshots(),
//       builder: (context, snapshot) {
//
//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         final docs = snapshot.data!.docs;
//
//         return ListView.builder(
//           itemCount: docs.length,
//           itemBuilder: (context, index) {
//
//             final data = docs[index];
//
//             return Container(
//               margin: const EdgeInsets.only(bottom: 15),
//               padding: const EdgeInsets.all(18),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(.05),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: gold.withOpacity(.3)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   Text(
//                     data['investorName'],
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 17,
//                         fontWeight: FontWeight.bold),
//                   ),
//
//                   const SizedBox(height: 6),
//
//                   Text(
//                     "Investment: ${data['investmentAmount']}",
//                     style: const TextStyle(color: Colors.white70),
//                   ),
//
//                   Text(
//                     "Profit: ${data['profit']}",
//                     style: const TextStyle(color: Colors.white70),
//                   ),
//
//                   Text(
//                     "Months Left: ${data['monthsLeft']}",
//                     style: const TextStyle(color: Colors.white70),
//                   ),
//
//                   Text(
//                     "Balance: ${data['balanceProfit']}",
//                     style: const TextStyle(color: Colors.redAccent),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   /// Bottom Navigation
//   Widget _bottomNav() {
//     return BottomNavigationBar(
//       backgroundColor: black,
//       selectedItemColor: gold,
//       unselectedItemColor: Colors.white38,
//       currentIndex: _currentIndex,
//       onTap: (i) {
//         setState(() {
//           _currentIndex = i;
//         });
//       },
//       items: const [
//         BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard), label: "Dashboard"),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.analytics), label: "Analytics"),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.settings), label: "Settings"),
//       ],
//     );
//   }
// }

//------from here we are creating the multiple user with multipage and welcome dynamically with the user
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'analytics_page.dart';
// import 'setting_page.dart';
//
// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});
//
//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage>
//     with SingleTickerProviderStateMixin {
//   // Colors
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//   int _currentIndex = 0;
//
//   String userName = "";
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 8),
//     )..repeat();
//
//     fetchUserName();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   /// Fetch current user name from Firestore
//   Future<void> fetchUserName() async {
//     try {
//       final uid = FirebaseAuth.instance.currentUser?.uid;
//       if (uid != null) {
//         final doc = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(uid)
//             .get();
//         if (doc.exists) {
//           setState(() {
//             userName = doc['name'] ?? "User";
//           });
//         }
//       }
//     } catch (e) {
//       print("Error fetching user name: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       drawer: _appDrawer(context),
//       body: Stack(
//         children: [
//           /// Animated gold background
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
//                     radius: 1.5,
//                     colors: [
//                       gold.withOpacity(0.12),
//                       black,
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           SafeArea(
//             child: _pages(),
//           ),
//         ],
//       ),
//       bottomNavigationBar: _bottomNav(),
//     );
//   }
//
//   /// Pages based on BottomNavigationBar
//   Widget _pages() {
//     switch (_currentIndex) {
//       case 0:
//         return _dashboardPage();
//       case 1:
//         return const AnalyticsPage();
//       case 2:
//         return const SettingsPage();
//       default:
//         return _dashboardPage();
//     }
//   }
//
//   /// Dashboard page with welcome + KPI cards + investor list
//   Widget _dashboardPage() {
//     return Padding(
//       padding: const EdgeInsets.all(24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// Top bar
//           Row(
//             children: [
//               Builder(
//                 builder: (context) => IconButton(
//                   icon: const Icon(Icons.menu, color: gold),
//                   onPressed: () => Scaffold.of(context).openDrawer(),
//                 ),
//               ),
//               const Spacer(),
//               const Icon(Icons.notifications, color: gold),
//             ],
//           ),
//           const SizedBox(height: 20),
//
//           /// Welcome message
//           Shimmer.fromColors(
//             baseColor: gold,
//             highlightColor: Colors.white,
//             child: const Text(
//               "Welcome Back,",
//               style: TextStyle(fontSize: 22),
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             userName.isEmpty ? "Loading..." : userName,
//             style: const TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 30),
//
//           /// KPI cards
//           SizedBox(
//             height: 170,
//             child: GridView(
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 20,
//                 crossAxisSpacing: 20,
//                 childAspectRatio: 1.7,
//               ),
//               children: [
//                 _totalInvestors(),
//                 _totalInvestment(),
//                 _totalPaid(),
//                 _totalBalance(),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           /// Active Investors List
//           const Text(
//             "Active Investors",
//             style: TextStyle(
//                 color: gold, fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Expanded(child: _investorList()),
//         ],
//       ),
//     );
//   }
//
//   /// KPI card widget
//   Widget _kpiCard(String title, String value, IconData icon) {
//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(.05),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: gold.withOpacity(.3)),
//         boxShadow: [
//           BoxShadow(
//             color: gold.withOpacity(0.1),
//             blurRadius: 20,
//             spreadRadius: 3,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: gold),
//           const Spacer(),
//           Text(
//             value,
//             style: const TextStyle(
//                 color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white60),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Total Investors
//   Widget _totalInvestors() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('investments').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return _kpiCard("Investors", "...", Icons.people);
//         return _kpiCard(
//             "Investors", snapshot.data!.docs.length.toString(), Icons.people);
//       },
//     );
//   }
//
//   /// Total Investment
//   Widget _totalInvestment() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('investments').snapshots(),
//       builder: (context, snapshot) {
//         double total = 0;
//         if (snapshot.hasData) {
//           for (var doc in snapshot.data!.docs) {
//             total += (doc['investmentAmount'] ?? 0).toDouble();
//           }
//         }
//         return _kpiCard("Investment", total.toStringAsFixed(0), Icons.account_balance);
//       },
//     );
//   }
//
//   /// Total Paid
//   Widget _totalPaid() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('investments').snapshots(),
//       builder: (context, snapshot) {
//         double total = 0;
//         if (snapshot.hasData) {
//           for (var doc in snapshot.data!.docs) {
//             total += (doc['paidTillDate'] ?? 0).toDouble();
//           }
//         }
//         return _kpiCard("Paid", total.toStringAsFixed(0), Icons.payments);
//       },
//     );
//   }
//
//   /// Total Balance
//   Widget _totalBalance() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('investments').snapshots(),
//       builder: (context, snapshot) {
//         double total = 0;
//         if (snapshot.hasData) {
//           for (var doc in snapshot.data!.docs) {
//             total += (doc['balanceProfit'] ?? 0).toDouble();
//           }
//         }
//         return _kpiCard("Balance", total.toStringAsFixed(0), Icons.trending_down);
//       },
//     );
//   }
//
//   /// Investor list
//   Widget _investorList() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('investments').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
//         final docs = snapshot.data!.docs;
//
//         return ListView.builder(
//           itemCount: docs.length,
//           itemBuilder: (context, index) {
//             final data = docs[index];
//             return Container(
//               margin: const EdgeInsets.only(bottom: 15),
//               padding: const EdgeInsets.all(18),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(.05),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: gold.withOpacity(.3)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(data['investorName'],
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 5),
//                   Text("Investment: ${data['investmentAmount']}",
//                       style: const TextStyle(color: Colors.white70)),
//                   Text("Profit: ${data['profit']}",
//                       style: const TextStyle(color: Colors.white70)),
//                   Text("Months Left: ${data['monthsLeft']}",
//                       style: const TextStyle(color: Colors.white70)),
//                   Text("Balance: ${data['balanceProfit']}",
//                       style: const TextStyle(color: Colors.redAccent)),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   /// Drawer
//   Drawer _appDrawer(BuildContext context) {
//     return Drawer(
//       backgroundColor: black,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(color: gold.withOpacity(0.1)),
//             child: const Text(
//               "Merveille Dashboard",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           _drawerItem(Icons.dashboard, "Dashboard", () {
//             Navigator.pop(context);
//             setState(() => _currentIndex = 0);
//           }),
//           _drawerItem(Icons.person, "Profile", () {
//             Navigator.pushNamed(context, 'profile');
//           }),
//           _drawerItem(Icons.info, "About", () {
//             Navigator.pushNamed(context, 'about');
//           }),
//           _drawerItem(Icons.logout, "Logout", () {
//             FirebaseAuth.instance.signOut();
//             Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
//           }),
//         ],
//       ),
//     );
//   }
//
//   ListTile _drawerItem(IconData icon, String title, VoidCallback onTap) {
//     return ListTile(
//       leading: Icon(icon, color: gold),
//       title: Text(title, style: const TextStyle(color: Colors.white)),
//       onTap: onTap,
//     );
//   }
//
//   /// Bottom Navigation
//   Widget _bottomNav() {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       backgroundColor: black,
//       selectedItemColor: gold,
//       unselectedItemColor: Colors.white38,
//       onTap: (index) {
//         setState(() => _currentIndex = index);
//       },
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//         BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analytics"),
//         BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
//       ],
//     );
//   }
// }

//
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'analytics_page.dart';
// import 'setting_page.dart';
//
// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});
//
//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage>
//     with SingleTickerProviderStateMixin {
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//   int _currentIndex = 0;
//   String userName = "";
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 8),
//     )..repeat();
//
//     fetchUserName();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Future<void> fetchUserName() async {
//     try {
//       final uid = FirebaseAuth.instance.currentUser?.uid;
//       if (uid != null) {
//         final doc =
//         await FirebaseFirestore.instance.collection('users').doc(uid).get();
//         if (doc.exists) {
//           setState(() {
//             userName = doc['name'] ?? "User";
//           });
//         }
//       }
//     } catch (e) {
//       print("Error fetching user name: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       drawer: _appDrawer(context),
//       body: Stack(
//         children: [
//           /// Animated background
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
//                     radius: 1.5,
//                     colors: [
//                       gold.withOpacity(0.12),
//                       black,
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           SafeArea(
//             child: _pages(),
//           ),
//         ],
//       ),
//       bottomNavigationBar: _bottomNav(),
//     );
//   }
//
//   Widget _pages() {
//     switch (_currentIndex) {
//       case 0:
//         return _dashboardPage();
//       case 1:
//         return const AnalyticsPage();
//       case 2:
//         return const SettingsPage();
//       default:
//         return _dashboardPage();
//     }
//   }
//
//   Widget _dashboardPage() {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// Top bar
//           Row(
//             children: [
//               Builder(
//                 builder: (context) => IconButton(
//                   icon: const Icon(Icons.menu, color: gold),
//                   onPressed: () => Scaffold.of(context).openDrawer(),
//                 ),
//               ),
//               const Spacer(),
//               const Icon(Icons.notifications, color: gold),
//             ],
//           ),
//           const SizedBox(height: 20),
//
//           /// Welcome
//           Shimmer.fromColors(
//             baseColor: gold,
//             highlightColor: Colors.white,
//             child: const Text(
//               "Welcome Back,",
//               style: TextStyle(fontSize: 22),
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             userName.isEmpty ? "Loading..." : userName,
//             style: const TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 25),
//
//           /// KPI Cards (horizontal scroll)
//           SizedBox(
//             height: 140,
//             child: StreamBuilder<QuerySnapshot>(
//               stream:
//               FirebaseFirestore.instance.collection('investments').snapshots(),
//               builder: (context, snapshot) {
//                 double totalInvestment = 0;
//                 double totalPaid = 0;
//                 double totalBalance = 0;
//                 int totalInvestors = 0;
//
//                 if (snapshot.hasData) {
//                   final docs = snapshot.data!.docs;
//                   totalInvestors = docs.length;
//                   for (var doc in docs) {
//                     totalInvestment += (doc['investmentAmount'] ?? 0).toDouble();
//                     totalPaid += (doc['paidTillDate'] ?? 0).toDouble();
//                     totalBalance += (doc['balanceProfit'] ?? 0).toDouble();
//                   }
//                 }
//
//                 return ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     _kpiCard("Investors", totalInvestors.toString(), Icons.people),
//                     _kpiCard("Investment", totalInvestment.toStringAsFixed(0),
//                         Icons.account_balance),
//                     _kpiCard(
//                         "Paid", totalPaid.toStringAsFixed(0), Icons.payments),
//                     _kpiCard("Balance", totalBalance.toStringAsFixed(0),
//                         Icons.trending_down),
//                   ],
//                 );
//               },
//             ),
//           ),
//
//           const SizedBox(height: 25),
//
//           /// Active Investors
//           const Text(
//             "Active Investors",
//             style: TextStyle(
//               color: gold,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Expanded(
//             child: _investorList(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _kpiCard(String title, String value, IconData icon) {
//     return Container(
//       width: 160,
//       margin: const EdgeInsets.only(right: 15),
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(.05),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: gold.withOpacity(.3)),
//         boxShadow: [
//           BoxShadow(
//             color: gold.withOpacity(0.1),
//             blurRadius: 20,
//             spreadRadius: 3,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: gold),
//           const Spacer(),
//           Text(
//             value,
//             style: const TextStyle(
//                 color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white60),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _investorList() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('investments').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
//         final docs = snapshot.data!.docs;
//
//         return ListView.builder(
//           itemCount: docs.length,
//           itemBuilder: (context, index) {
//             final data = docs[index];
//             return Container(
//               margin: const EdgeInsets.only(bottom: 15),
//               padding: const EdgeInsets.all(18),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(.05),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: gold.withOpacity(.3)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(data['investorName'],
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 5),
//                   Text("Investment: ${data['investmentAmount']}",
//                       style: const TextStyle(color: Colors.white70)),
//                   Text("Profit: ${data['profit']}",
//                       style: const TextStyle(color: Colors.white70)),
//                   Text("Months Left: ${data['monthsLeft']}",
//                       style: const TextStyle(color: Colors.white70)),
//                   Text("Balance: ${data['balanceProfit']}",
//                       style: const TextStyle(color: Colors.redAccent)),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Drawer _appDrawer(BuildContext context) {
//     return Drawer(
//       backgroundColor: black,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           UserAccountsDrawerHeader(
//             decoration: BoxDecoration(color: gold.withOpacity(0.1)),
//             accountName: Text(
//               userName.isEmpty ? "Loading..." : userName,
//               style: const TextStyle(color: Colors.white, fontSize: 18),
//             ),
//             accountEmail: null,
//             currentAccountPicture: CircleAvatar(
//               backgroundColor: gold,
//               child: Text(
//                 userName.isNotEmpty ? userName[0].toUpperCase() : "U",
//                 style: const TextStyle(color: black, fontSize: 20),
//               ),
//             ),
//           ),
//           _drawerItem(Icons.dashboard, "Dashboard", () {
//             Navigator.pop(context);
//             setState(() => _currentIndex = 0);
//           }),
//           _drawerItem(Icons.person, "Profile", () {
//             Navigator.pushNamed(context, 'profile');
//           }),
//           _drawerItem(Icons.info, "About", () {
//             Navigator.pushNamed(context, 'about');
//           }),
//           _drawerItem(Icons.logout, "Logout", () {
//             FirebaseAuth.instance.signOut();
//             Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
//           }),
//         ],
//       ),
//     );
//   }
//
//   ListTile _drawerItem(IconData icon, String title, VoidCallback onTap) {
//     return ListTile(
//       leading: Icon(icon, color: gold),
//       title: Text(title, style: const TextStyle(color: Colors.white)),
//       onTap: onTap,
//     );
//   }
//
//   Widget _bottomNav() {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       backgroundColor: black,
//       selectedItemColor: gold,
//       unselectedItemColor: Colors.white38,
//       onTap: (index) {
//         setState(() => _currentIndex = index);
//       },
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//         BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analytics"),
//         BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
//       ],
//     );
//   }
// }
//
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'analytics_page.dart';
// import 'setting_page.dart';
//
// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});
//
//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage>
//     with SingleTickerProviderStateMixin {
//
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//
//   int _currentIndex = 0;
//   String userName = "";
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller =
//     AnimationController(vsync: this, duration: const Duration(seconds: 8))
//       ..repeat();
//
//     fetchUserName();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   /// Fetch logged user name
//   Future<void> fetchUserName() async {
//
//     final uid = FirebaseAuth.instance.currentUser?.uid;
//
//     if (uid != null) {
//
//       final doc =
//       await FirebaseFirestore.instance.collection('users').doc(uid).get();
//
//       if (doc.exists) {
//
//         setState(() {
//           userName = doc['name'] ?? "User";
//         });
//
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       backgroundColor: black,
//       drawer: _drawer(context),
//
//       body: Stack(
//         children: [
//
//           /// Animated luxury background
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return Container(
//                 decoration: BoxDecoration(
//                   gradient: RadialGradient(
//                     center: Alignment(
//                         sin(_controller.value * 2 * pi), -0.3),
//                     radius: 1.6,
//                     colors: [
//                       gold.withOpacity(.15),
//                       black
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           SafeArea(child: _pages())
//         ],
//       ),
//
//       bottomNavigationBar: _bottomNav(),
//     );
//   }
//
//   /// Page Switch
//   Widget _pages() {
//
//     switch (_currentIndex) {
//
//       case 0:
//         return _dashboard();
//
//       case 1:
//         return const AnalyticsPage();
//
//       case 2:
//         return const SettingsPage();
//
//       default:
//         return _dashboard();
//     }
//   }
//
//   /// DASHBOARD
//   Widget _dashboard() {
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//
//         children: [
//
//           /// Top Bar
//           Row(
//             children: [
//
//               Builder(
//                 builder: (context) => IconButton(
//                   icon: const Icon(Icons.menu, color: gold),
//                   onPressed: () =>
//                       Scaffold.of(context).openDrawer(),
//                 ),
//               ),
//
//               const Spacer(),
//
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(.05),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: gold.withOpacity(.3))
//                 ),
//                 child: const Icon(Icons.notifications,
//                     color: gold),
//               )
//             ],
//           ),
//
//           const SizedBox(height: 20),
//
//           /// Shimmer Welcome
//           Shimmer.fromColors(
//             baseColor: gold,
//             highlightColor: Colors.white,
//
//             child: const Text(
//               "Welcome Back",
//               style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 5),
//
//           Text(
//             userName.isEmpty ? "Loading..." : userName,
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 25),
//
//           /// KPI TOTAL
//           _kpiTotals(),
//
//           const SizedBox(height: 25),
//
//           const Text(
//             "Investors",
//             style: TextStyle(
//                 color: gold,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 10),
//
//           /// Investor Cards
//           Expanded(child: _investorList())
//         ],
//       ),
//     );
//   }
//
//   /// KPI TOTAL
//   Widget _kpiTotals() {
//
//     return SizedBox(
//
//       height: 140,
//
//       child: StreamBuilder<QuerySnapshot>(
//
//         stream: FirebaseFirestore.instance
//             .collection('investments')
//             .snapshots(),
//
//         builder: (context, snapshot) {
//
//           double investment = 0;
//           double paid = 0;
//           double balance = 0;
//           int investors = 0;
//
//           if (snapshot.hasData) {
//
//             final docs = snapshot.data!.docs;
//
//             investors = docs.length;
//
//             for (var doc in docs) {
//
//               investment +=
//                   (doc['investmentAmount'] ?? 0).toDouble();
//
//               paid +=
//                   (doc['paidTillDate'] ?? 0).toDouble();
//
//               balance +=
//                   (doc['balanceProfit'] ?? 0).toDouble();
//             }
//           }
//
//           return ListView(
//
//             scrollDirection: Axis.horizontal,
//
//             children: [
//
//               _glassCard("Investors",
//                   investors.toString(), Icons.people),
//
//               _glassCard("Investment",
//                   investment.toStringAsFixed(0),
//                   Icons.account_balance),
//
//               _glassCard("Paid",
//                   paid.toStringAsFixed(0),
//                   Icons.payments),
//
//               _glassCard("Balance",
//                   balance.toStringAsFixed(0),
//                   Icons.trending_down),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   /// GLASS CARD
//   Widget _glassCard(
//       String title,
//       String value,
//       IconData icon
//       ) {
//
//     return Container(
//
//       width: 170,
//       margin: const EdgeInsets.only(right: 15),
//
//       padding: const EdgeInsets.all(20),
//
//       decoration: BoxDecoration(
//
//         borderRadius: BorderRadius.circular(22),
//
//         gradient: LinearGradient(
//             colors: [
//               Colors.white.withOpacity(.08),
//               Colors.white.withOpacity(.02)
//             ]
//         ),
//
//         border: Border.all(color: gold.withOpacity(.3)),
//
//         boxShadow: [
//           BoxShadow(
//               color: gold.withOpacity(.2),
//               blurRadius: 25,
//               spreadRadius: 2)
//         ],
//       ),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//
//         children: [
//
//           Icon(icon, color: gold, size: 26),
//
//           const Spacer(),
//
//           Text(
//             value,
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white60),
//           )
//         ],
//       ),
//     );
//   }
//
//   /// INVESTOR LIST
//   Widget _investorList() {
//
//     return StreamBuilder<QuerySnapshot>(
//
//       stream: FirebaseFirestore.instance
//           .collection('investments')
//           .orderBy('investmentAmount', descending: true)
//           .snapshots(),
//
//       builder: (context, snapshot) {
//
//         if (!snapshot.hasData) {
//           return const Center(
//               child: CircularProgressIndicator());
//         }
//
//         final docs = snapshot.data!.docs;
//
//         return ListView.builder(
//
//           itemCount: docs.length,
//
//           itemBuilder: (context, index) {
//
//             final data = docs[index];
//
//             return _investorCard(data);
//           },
//         );
//       },
//     );
//   }
//
//   /// PROFESSIONAL INVESTOR CARD
//   Widget _investorCard(data) {
//
//     return Container(
//
//       margin: const EdgeInsets.only(bottom: 15),
//
//       padding: const EdgeInsets.all(18),
//
//       decoration: BoxDecoration(
//
//           borderRadius: BorderRadius.circular(22),
//
//           color: Colors.white.withOpacity(.05),
//
//           border: Border.all(color: gold.withOpacity(.25))
//       ),
//
//       child: Row(
//
//         children: [
//
//           /// Avatar
//           CircleAvatar(
//
//             radius: 25,
//             backgroundColor: gold,
//
//             child: Text(
//               data['investorName'][0],
//               style: const TextStyle(
//                   color: black,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//
//           const SizedBox(width: 15),
//
//           /// Investor Info
//           Expanded(
//
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//
//               children: [
//
//                 Text(
//                   data['investorName'],
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16),
//                 ),
//
//                 const SizedBox(height: 4),
//
//                 Text(
//                   "EID: ${data['eid']}",
//                   style: const TextStyle(
//                       color: Colors.white60,
//                       fontSize: 13),
//                 ),
//
//                 const SizedBox(height: 6),
//
//                 Text(
//                   "Investment: ${data['investmentAmount']}",
//                   style: const TextStyle(
//                       color: Colors.white70),
//                 ),
//
//                 Text(
//                   "Paid: ${data['paidTillDate']}",
//                   style: const TextStyle(
//                       color: Colors.white70),
//                 ),
//
//                 Text(
//                   "Balance: ${data['balanceProfit']}",
//                   style: const TextStyle(
//                       color: Colors.redAccent),
//                 ),
//               ],
//             ),
//           ),
//
//           /// Profit badge
//           Container(
//
//             padding: const EdgeInsets.symmetric(
//                 horizontal: 12,
//                 vertical: 6),
//
//             decoration: BoxDecoration(
//                 color: Colors.green.withOpacity(.2),
//                 borderRadius: BorderRadius.circular(10)),
//
//             child: Text(
//               "${data['profit']}%",
//               style: const TextStyle(
//                   color: Colors.greenAccent,
//                   fontWeight: FontWeight.bold),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   /// DRAWER
//   Drawer _drawer(BuildContext context) {
//
//     return Drawer(
//
//       backgroundColor: black,
//
//       child: ListView(
//
//         padding: EdgeInsets.zero,
//
//         children: [
//
//           UserAccountsDrawerHeader(
//
//             decoration: BoxDecoration(
//                 color: gold.withOpacity(.1)),
//
//             accountName: Text(
//                 userName.isEmpty ? "Loading..." : userName),
//
//             accountEmail: null,
//
//             currentAccountPicture: CircleAvatar(
//               backgroundColor: gold,
//               child: Text(
//                   userName.isNotEmpty
//                       ? userName[0].toUpperCase()
//                       : "U",
//                   style: const TextStyle(
//                       color: black,
//                       fontSize: 20)),
//             ),
//           ),
//
//           _drawerItem(Icons.dashboard, "Dashboard", () {
//             Navigator.pop(context);
//             setState(() => _currentIndex = 0);
//           }),
//
//           _drawerItem(Icons.person, "Profile", () {
//             Navigator.pushNamed(context, 'profile');
//           }),
//
//           _drawerItem(Icons.info, "About", () {
//             Navigator.pushNamed(context, 'about');
//           }),
//
//           _drawerItem(Icons.logout, "Logout", () {
//             FirebaseAuth.instance.signOut();
//             Navigator.pushNamedAndRemoveUntil(
//                 context,
//                 'login',
//                     (route) => false);
//           }),
//         ],
//       ),
//     );
//   }
//
//   ListTile _drawerItem(
//       IconData icon,
//       String title,
//       VoidCallback onTap) {
//
//     return ListTile(
//       leading: Icon(icon, color: gold),
//       title: Text(title,
//           style: const TextStyle(color: Colors.white)),
//       onTap: onTap,
//     );
//   }
//
//   /// Bottom Navigation
//   Widget _bottomNav() {
//
//     return BottomNavigationBar(
//
//       currentIndex: _currentIndex,
//
//       backgroundColor: black,
//
//       selectedItemColor: gold,
//
//       unselectedItemColor: Colors.white38,
//
//       onTap: (index) {
//         setState(() => _currentIndex = index);
//       },
//
//       items: const [
//
//         BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home"),
//
//         BottomNavigationBarItem(
//             icon: Icon(Icons.analytics),
//             label: "Analytics"),
//
//         BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: "Settings"),
//       ],
//     );
//   }
// }
//
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'analytics_page.dart';
// import 'setting_page.dart';
//
// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});
//
//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage>
//     with SingleTickerProviderStateMixin {
//
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//
//   int _currentIndex = 0;
//   String userName = "";
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller =
//     AnimationController(vsync: this, duration: const Duration(seconds: 8))
//       ..repeat();
//
//     fetchUserName();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   /// SAFE DOUBLE CONVERTER (Fix for Firestore mixed types)
//   double safeDouble(dynamic value) {
//     if (value == null) return 0;
//
//     if (value is int) {
//       return value.toDouble();
//     }
//
//     if (value is double) {
//       return value;
//     }
//
//     if (value is String) {
//       return double.tryParse(value) ?? 0;
//     }
//
//     return 0;
//   }
//
//   /// Fetch logged user
//   Future<void> fetchUserName() async {
//     try {
//       final uid = FirebaseAuth.instance.currentUser?.uid;
//
//       if (uid != null) {
//         final doc =
//         await FirebaseFirestore.instance.collection('users').doc(uid).get();
//
//         if (doc.exists) {
//           setState(() {
//             userName = doc['name'] ?? "User";
//           });
//         }
//       }
//     } catch (e) {
//       debugPrint("User fetch error: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       drawer: _drawer(context),
//
//       body: Stack(
//         children: [
//
//           /// Animated background
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return Container(
//                 decoration: BoxDecoration(
//                   gradient: RadialGradient(
//                     center:
//                     Alignment(sin(_controller.value * 2 * pi), -0.3),
//                     radius: 1.6,
//                     colors: [gold.withOpacity(.15), black],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           SafeArea(child: _pages())
//         ],
//       ),
//
//       bottomNavigationBar: _bottomNav(),
//     );
//   }
//
//   Widget _pages() {
//     switch (_currentIndex) {
//       case 0:
//         return _dashboard();
//
//       case 1:
//         return const AnalyticsPage();
//
//       case 2:
//         return const SettingsPage();
//
//       default:
//         return _dashboard();
//     }
//   }
//
//   /// DASHBOARD PAGE
//   Widget _dashboard() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//
//         children: [
//
//           /// TOP BAR
//           Row(
//             children: [
//
//               Builder(
//                 builder: (context) => IconButton(
//                   icon: const Icon(Icons.menu, color: gold),
//                   onPressed: () => Scaffold.of(context).openDrawer(),
//                 ),
//               ),
//
//               const Spacer(),
//
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(.05),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: gold.withOpacity(.3))),
//                 child: const Icon(Icons.notifications, color: gold),
//               )
//             ],
//           ),
//
//           const SizedBox(height: 20),
//
//           /// WELCOME
//           Shimmer.fromColors(
//             baseColor: gold,
//             highlightColor: Colors.white,
//             child: const Text(
//               "Welcome Back",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//           ),
//
//           const SizedBox(height: 5),
//
//           Text(
//             userName.isEmpty ? "Loading..." : userName,
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 25),
//
//           /// KPI CARDS
//           _kpiTotals(),
//
//           const SizedBox(height: 25),
//
//           const Text(
//             "Active Investors",
//             style: TextStyle(
//                 color: gold,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 10),
//
//           Expanded(child: _investorList())
//         ],
//       ),
//     );
//   }
//
//   /// KPI TOTALS
//   Widget _kpiTotals() {
//     return SizedBox(
//       height: 140,
//
//       child: StreamBuilder<QuerySnapshot>(
//         stream:
//         FirebaseFirestore.instance.collection('investments').snapshots(),
//
//         builder: (context, snapshot) {
//
//           double investment = 0;
//           double paid = 0;
//           double balance = 0;
//           int investors = 0;
//
//           if (snapshot.hasData) {
//
//             final docs = snapshot.data!.docs;
//
//             investors = docs.length;
//
//             for (var doc in docs) {
//
//               final data = doc.data() as Map<String, dynamic>;
//
//               investment += safeDouble(data['investmentAmount']);
//               paid += safeDouble(data['paidTillDate']);
//               balance += safeDouble(data['balanceProfit']);
//             }
//           }
//
//           return ListView(
//             scrollDirection: Axis.horizontal,
//             children: [
//
//               _glassCard("Investors", investors.toString(), Icons.people),
//
//               _glassCard(
//                   "Investment",
//                   investment.toStringAsFixed(0),
//                   Icons.account_balance),
//
//               _glassCard(
//                   "Paid",
//                   paid.toStringAsFixed(0),
//                   Icons.payments),
//
//               _glassCard(
//                   "Balance",
//                   balance.toStringAsFixed(0),
//                   Icons.trending_down),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _glassCard(String title, String value, IconData icon) {
//     return Container(
//       width: 170,
//       margin: const EdgeInsets.only(right: 15),
//       padding: const EdgeInsets.all(20),
//
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(22),
//         gradient: LinearGradient(colors: [
//           Colors.white.withOpacity(.08),
//           Colors.white.withOpacity(.02)
//         ]),
//         border: Border.all(color: gold.withOpacity(.3)),
//       ),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//
//         children: [
//
//           Icon(icon, color: gold),
//
//           const Spacer(),
//
//           Text(
//             value,
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white60),
//           )
//         ],
//       ),
//     );
//   }
//
//   /// INVESTOR LIST
//   Widget _investorList() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('investments')
//           .orderBy('investmentAmount', descending: true)
//           .snapshots(),
//
//       builder: (context, snapshot) {
//
//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         final docs = snapshot.data!.docs;
//
//         return ListView.builder(
//           itemCount: docs.length,
//
//           itemBuilder: (context, index) {
//
//             final data =
//             docs[index].data() as Map<String, dynamic>;
//
//             return _investorCard(data);
//           },
//         );
//       },
//     );
//   }
//
//   Widget _investorCard(Map<String, dynamic> data) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 15),
//       padding: const EdgeInsets.all(18),
//
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(22),
//           color: Colors.white.withOpacity(.05),
//           border: Border.all(color: gold.withOpacity(.25))),
//
//       child: Row(
//         children: [
//
//           CircleAvatar(
//             radius: 25,
//             backgroundColor: gold,
//             child: Text(
//               data['investorName'][0],
//               style:
//               const TextStyle(color: black, fontWeight: FontWeight.bold),
//             ),
//           ),
//
//           const SizedBox(width: 15),
//
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//
//               children: [
//
//                 Text(
//                   data['investorName'] ?? "",
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16),
//                 ),
//
//                 const SizedBox(height: 4),
//
//                 Text(
//                   "EID: ${data['eid']}",
//                   style:
//                   const TextStyle(color: Colors.white60, fontSize: 13),
//                 ),
//
//                 const SizedBox(height: 6),
//
//                 Text(
//                   "Investment: ${data['investmentAmount']}",
//                   style: const TextStyle(color: Colors.white70),
//                 ),
//
//                 Text(
//                   "Paid: ${data['paidTillDate']}",
//                   style: const TextStyle(color: Colors.white70),
//                 ),
//
//                 Text(
//                   "Balance: ${data['balanceProfit']}",
//                   style:
//                   const TextStyle(color: Colors.redAccent),
//                 ),
//               ],
//             ),
//           ),
//
//           Container(
//             padding:
//             const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//
//             decoration: BoxDecoration(
//                 color: Colors.green.withOpacity(.2),
//                 borderRadius: BorderRadius.circular(10)),
//
//             child: Text(
//               "${data['profit']}%",
//               style: const TextStyle(
//                   color: Colors.greenAccent,
//                   fontWeight: FontWeight.bold),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   /// DRAWER
//   Drawer _drawer(BuildContext context) {
//     return Drawer(
//       backgroundColor: black,
//
//       child: ListView(
//         children: [
//
//           UserAccountsDrawerHeader(
//             decoration: BoxDecoration(color: gold.withOpacity(.1)),
//             accountName: Text(userName),
//             accountEmail: null,
//             currentAccountPicture: CircleAvatar(
//               backgroundColor: gold,
//               child: Text(userName.isEmpty ? "U" : userName[0]),
//             ),
//           ),
//
//           ListTile(
//             leading: const Icon(Icons.logout, color: gold),
//             title: const Text("Logout",
//                 style: TextStyle(color: Colors.white)),
//             onTap: () {
//               FirebaseAuth.instance.signOut();
//               Navigator.pushNamedAndRemoveUntil(
//                   context, 'login', (route) => false);
//             },
//           )
//         ],
//       ),
//     );
//   }
//
//   /// BOTTOM NAV
//   Widget _bottomNav() {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       backgroundColor: black,
//       selectedItemColor: gold,
//       unselectedItemColor: Colors.white38,
//
//       onTap: (index) {
//         setState(() => _currentIndex = index);
//       },
//
//       items: const [
//
//         BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home"),
//
//         BottomNavigationBarItem(
//             icon: Icon(Icons.analytics),
//             label: "Analytics"),
//
//         BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: "Settings"),
//       ],
//     );
//   }
// }
//----------The above code is fully functioning for all the KPI's it was missing profile page in drawer and other pages so we upgrade ---------
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'profile_page.dart';
// import 'about.dart';
// import 'analytics_page.dart';
// import 'setting_page.dart';
//
// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});
//
//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage>
//     with SingleTickerProviderStateMixin {
//
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//
//   int _currentIndex = 0;
//   String userName = "Loading...";
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller =
//     AnimationController(vsync: this, duration: const Duration(seconds: 8))
//       ..repeat();
//
//     fetchUserName();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   /// Safe converter
//   double safeDouble(dynamic value) {
//     if (value == null) return 0;
//     if (value is int) return value.toDouble();
//     if (value is double) return value;
//     if (value is String) return double.tryParse(value) ?? 0;
//     return 0;
//   }
//
//   /// Fetch username
//   Future<void> fetchUserName() async {
//     try {
//       final uid = FirebaseAuth.instance.currentUser?.uid;
//
//       if (uid != null) {
//         final doc =
//         await FirebaseFirestore.instance.collection('users').doc(uid).get();
//
//         if (doc.exists) {
//           setState(() {
//             userName = doc['name'] ?? "User";
//           });
//         }
//       }
//     } catch (e) {
//       debugPrint("User fetch error: $e");
//     }
//   }
//
//   /// Logout
//   void logout() async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.pushReplacementNamed(context, 'login');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       drawer: _drawer(),
//
//       body: Stack(
//         children: [
//
//           /// Animated background
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return Container(
//                 decoration: BoxDecoration(
//                   gradient: RadialGradient(
//                     center: Alignment(sin(_controller.value * 2 * pi), -0.3),
//                     radius: 1.6,
//                     colors: [gold.withOpacity(.15), black],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           SafeArea(child: _pages())
//         ],
//       ),
//
//       bottomNavigationBar: _bottomNav(),
//     );
//   }
//
//   /// Pages
//   Widget _pages() {
//     switch (_currentIndex) {
//       case 0:
//         return _dashboard();
//
//       case 1:
//         return const AnalyticsPage();
//
//       case 2:
//         return const SettingsPage();
//
//       default:
//         return _dashboard();
//     }
//   }
//
//   /// Drawer
//   Widget _drawer() {
//     return Drawer(
//       backgroundColor: black,
//       child: Column(
//         children: [
//
//           DrawerHeader(
//             decoration: const BoxDecoration(color: black),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 const CircleAvatar(
//                   radius: 32,
//                   backgroundColor: gold,
//                   child: Icon(Icons.person, color: Colors.black),
//                 ),
//
//                 const SizedBox(height: 12),
//
//                 Text(
//                   userName,
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold),
//                 ),
//
//                 const SizedBox(height: 5),
//
//                 Text(
//                   FirebaseAuth.instance.currentUser?.email ?? "",
//                   style: const TextStyle(color: Colors.white60),
//                 )
//               ],
//             ),
//           ),
//
//           _drawerItem(Icons.dashboard, "Dashboard", () {
//             Navigator.pop(context);
//             setState(() => _currentIndex = 0);
//           }),
//
//           _drawerItem(Icons.analytics, "Analytics", () {
//             Navigator.pop(context);
//             setState(() => _currentIndex = 1);
//           }),
//
//           _drawerItem(Icons.settings, "Settings", () {
//             Navigator.pop(context);
//             setState(() => _currentIndex = 2);
//           }),
//
//           _drawerItem(Icons.person, "Profile", () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (_) => const MyProfile()),
//             );
//           }),
//
//           _drawerItem(Icons.info, "About", () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (_) => const About()),
//             );
//           }),
//
//           const Spacer(),
//
//           _drawerItem(Icons.logout, "Logout", logout),
//         ],
//       ),
//     );
//   }
//
//   Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
//     return ListTile(
//       leading: Icon(icon, color: gold),
//       title: Text(title, style: const TextStyle(color: Colors.white)),
//       onTap: onTap,
//     );
//   }
//
//   /// Dashboard
//   Widget _dashboard() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           /// Top bar
//           Row(
//             children: [
//
//               Builder(
//                 builder: (context) => IconButton(
//                   icon: const Icon(Icons.menu, color: gold),
//                   onPressed: () => Scaffold.of(context).openDrawer(),
//                 ),
//               ),
//
//               const Spacer(),
//
//               const Icon(Icons.notifications, color: gold),
//             ],
//           ),
//
//           const SizedBox(height: 20),
//
//           Shimmer.fromColors(
//             baseColor: gold,
//             highlightColor: Colors.white,
//             child: const Text(
//               "Welcome Back",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//           ),
//
//           const SizedBox(height: 5),
//
//           Text(
//             userName,
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 25),
//
//           _kpiTotals(),
//
//           const SizedBox(height: 25),
//
//           const Text(
//             "Active Investors",
//             style: TextStyle(
//                 color: gold,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 10),
//
//           Expanded(child: _investorList())
//         ],
//       ),
//     );
//   }
//
//   /// KPI Cards
//   Widget _kpiTotals() {
//     return SizedBox(
//       height: 140,
//       child: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('investments').snapshots(),
//         builder: (context, snapshot) {
//
//           double investment = 0;
//           double paid = 0;
//           double balance = 0;
//           int investors = 0;
//
//           if (snapshot.hasData) {
//             final docs = snapshot.data!.docs;
//             investors = docs.length;
//
//             for (var doc in docs) {
//               final data = doc.data() as Map<String, dynamic>;
//               investment += safeDouble(data['investmentAmount']);
//               paid += safeDouble(data['paidTillDate']);
//               balance += safeDouble(data['balanceProfit']);
//             }
//           }
//
//           return ListView(
//             scrollDirection: Axis.horizontal,
//             children: [
//
//               _card("Investors", investors.toString(), Icons.people),
//
//               _card("Investment", investment.toStringAsFixed(0),
//                   Icons.account_balance),
//
//               _card("Paid", paid.toStringAsFixed(0), Icons.payments),
//
//               _card("Balance", balance.toStringAsFixed(0),
//                   Icons.trending_down),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _card(String title, String value, IconData icon) {
//     return Container(
//       width: 170,
//       margin: const EdgeInsets.only(right: 15),
//       padding: const EdgeInsets.all(20),
//
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(22),
//         gradient: LinearGradient(colors: [
//           Colors.white.withOpacity(.08),
//           Colors.white.withOpacity(.02)
//         ]),
//         border: Border.all(color: gold.withOpacity(.3)),
//       ),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           Icon(icon, color: gold),
//
//           const Spacer(),
//
//           Text(
//             value,
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           Text(title, style: const TextStyle(color: Colors.white60))
//         ],
//       ),
//     );
//   }
//
//   /// Investor List
//   Widget _investorList() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('investments')
//           .orderBy('investmentAmount', descending: true)
//           .snapshots(),
//       builder: (context, snapshot) {
//
//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         final docs = snapshot.data!.docs;
//
//         return ListView.builder(
//           itemCount: docs.length,
//           itemBuilder: (context, index) {
//
//             final data = docs[index].data() as Map<String, dynamic>;
//
//             return ListTile(
//               title: Text(
//                 data['investorName'] ?? "Investor",
//                 style: const TextStyle(color: Colors.white),
//               ),
//
//               subtitle: Text(
//                 "Investment: ${data['investmentAmount']}",
//                 style: const TextStyle(color: Colors.white60),
//               ),
//
//               trailing: const Icon(Icons.arrow_forward_ios, color: gold),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   /// Bottom Navigation
//   Widget _bottomNav() {
//     return BottomNavigationBar(
//       backgroundColor: black,
//       selectedItemColor: gold,
//       unselectedItemColor: Colors.white60,
//       currentIndex: _currentIndex,
//
//       onTap: (i) {
//         setState(() {
//           _currentIndex = i;
//         });
//       },
//
//       items: const [
//
//         BottomNavigationBarItem(
//           icon: Icon(Icons.dashboard),
//           label: "Dashboard",
//         ),
//
//         BottomNavigationBarItem(
//           icon: Icon(Icons.analytics),
//           label: "Analytics",
//         ),
//
//         BottomNavigationBarItem(
//           icon: Icon(Icons.settings),
//           label: "Settings",
//         ),
//       ],
//     );
//   }
// }
//--------The above code has everything but only missing was Active Investors crad style ------
//
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'analytics_page.dart';
// import 'setting_page.dart';
//
// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});
//
//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage>
//     with SingleTickerProviderStateMixin {
//
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//
//   int _currentIndex = 0;
//   String userName = "";
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller =
//     AnimationController(vsync: this, duration: const Duration(seconds: 8))
//       ..repeat();
//
//     fetchUserName();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   double safeDouble(dynamic value) {
//     if (value == null) return 0;
//
//     if (value is int) return value.toDouble();
//     if (value is double) return value;
//     if (value is String) return double.tryParse(value) ?? 0;
//
//     return 0;
//   }
//
//   Future<void> fetchUserName() async {
//     final uid = FirebaseAuth.instance.currentUser?.uid;
//
//     if (uid != null) {
//       final doc =
//       await FirebaseFirestore.instance.collection('users').doc(uid).get();
//
//       if (doc.exists) {
//         setState(() {
//           userName = doc['name'] ?? "User";
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       drawer: _drawer(context),
//       body: Stack(
//         children: [
//
//           /// Animated background
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return Container(
//                 decoration: BoxDecoration(
//                   gradient: RadialGradient(
//                     center:
//                     Alignment(sin(_controller.value * 2 * pi), -0.3),
//                     radius: 1.6,
//                     colors: [gold.withOpacity(.15), black],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           SafeArea(child: _pages())
//         ],
//       ),
//       bottomNavigationBar: _bottomNav(),
//     );
//   }
//
//   Widget _pages() {
//     switch (_currentIndex) {
//       case 0:
//         return _dashboard();
//       case 1:
//         return const AnalyticsPage();
//       case 2:
//         return const SettingsPage();
//       default:
//         return _dashboard();
//     }
//   }
//
//   /// DASHBOARD
//   Widget _dashboard() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//
//         children: [
//
//           /// TOP BAR
//           Row(
//             children: [
//               Builder(
//                 builder: (context) => IconButton(
//                   icon: const Icon(Icons.menu, color: gold),
//                   onPressed: () => Scaffold.of(context).openDrawer(),
//                 ),
//               ),
//               const Spacer(),
//               const Icon(Icons.notifications, color: gold)
//             ],
//           ),
//
//           const SizedBox(height: 20),
//
//           /// Welcome
//           Shimmer.fromColors(
//             baseColor: gold,
//             highlightColor: Colors.white,
//             child: const Text(
//               "Welcome Back",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//           ),
//
//           const SizedBox(height: 5),
//
//           Text(
//             userName.isEmpty ? "Loading..." : userName,
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 25),
//
//           /// KPI
//           _kpiTotals(),
//
//           const SizedBox(height: 25),
//
//           const Text(
//             "Active Investments",
//             style: TextStyle(
//                 color: gold,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 10),
//
//           Expanded(child: _investorCards())
//         ],
//       ),
//     );
//   }
//
//   /// KPI TOTALS
//   Widget _kpiTotals() {
//     return SizedBox(
//       height: 140,
//       child: StreamBuilder<QuerySnapshot>(
//         stream:
//         FirebaseFirestore.instance.collection('investments').snapshots(),
//         builder: (context, snapshot) {
//
//           double investment = 0;
//           double paid = 0;
//           double balance = 0;
//           int investors = 0;
//
//           if (snapshot.hasData) {
//
//             final docs = snapshot.data!.docs;
//
//             investors = docs.length;
//
//             for (var doc in docs) {
//               final data = doc.data() as Map<String, dynamic>;
//
//               investment += safeDouble(data['investmentAmount']);
//               paid += safeDouble(data['paidTillDate']);
//               balance += safeDouble(data['balanceProfit']);
//             }
//           }
//
//           return ListView(
//             scrollDirection: Axis.horizontal,
//             children: [
//
//               _glassCard("Total Investments", investors.toString(), Icons.people),
//
//               _glassCard("Total Investment Amount",
//                   investment.toStringAsFixed(0), Icons.account_balance),
//
//               _glassCard("Paid",
//                   paid.toStringAsFixed(0), Icons.payments),
//
//               _glassCard("Balance",
//                   balance.toStringAsFixed(0), Icons.trending_down),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _glassCard(String title, String value, IconData icon) {
//     return Container(
//       width: 170,
//       margin: const EdgeInsets.only(right: 15),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(22),
//         gradient: LinearGradient(colors: [
//           Colors.white.withOpacity(.08),
//           Colors.white.withOpacity(.02)
//         ]),
//         border: Border.all(color: gold.withOpacity(.3)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           Icon(icon, color: gold),
//
//           const Spacer(),
//
//           Text(
//             value,
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white60),
//           )
//         ],
//       ),
//     );
//   }
//
//   /// ACTIVE INVESTOR CARDS (LUXURY STYLE)
//   Widget _investorCards() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('investments')
//           .orderBy('investmentAmount', descending: true)
//           .snapshots(),
//       builder: (context, snapshot) {
//
//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         final docs = snapshot.data!.docs;
//
//         return ListView.builder(
//           itemCount: docs.length,
//           itemBuilder: (context, index) {
//
//             final data = docs[index].data() as Map<String, dynamic>;
//
//             return _investorCard(data);
//           },
//         );
//       },
//     );
//   }
//
//   Widget _investorCard(Map<String, dynamic> data) {
//
//     double investment = safeDouble(data['investmentAmount']);
//     double paid = safeDouble(data['paidTillDate']);
//     double balance = safeDouble(data['balanceProfit']);
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 15),
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(22),
//         gradient: LinearGradient(colors: [
//           Colors.white.withOpacity(.08),
//           Colors.white.withOpacity(.02)
//         ]),
//         border: Border.all(color: gold.withOpacity(.3)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           Text(
//             data['investorName'] ?? "Investor",
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 10),
//
//           Row(
//             children: [
//
//               _miniStat("Investment", investment),
//
//               const SizedBox(width: 10),
//
//               _miniStat("Paid", paid),
//
//               const SizedBox(width: 10),
//
//               _miniStat("Balance", balance),
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _miniStat(String title, double value) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.black.withOpacity(.4),
//           border: Border.all(color: gold.withOpacity(.3)),
//         ),
//         child: Column(
//           children: [
//
//             Text(
//               value.toStringAsFixed(0),
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold),
//             ),
//
//             Text(
//               title,
//               style: const TextStyle(
//                   color: Colors.white54,
//                   fontSize: 12),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// BOTTOM NAV
//   Widget _bottomNav() {
//     return BottomNavigationBar(
//       backgroundColor: black,
//       selectedItemColor: gold,
//       unselectedItemColor: Colors.white54,
//       currentIndex: _currentIndex,
//       onTap: (i) => setState(() => _currentIndex = i),
//       items: const [
//
//         BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard),
//             label: "Dashboard"),
//
//         BottomNavigationBarItem(
//             icon: Icon(Icons.analytics),
//             label: "Analytics"),
//
//         BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: "Settings"),
//       ],
//     );
//   }
//
//   /// DRAWER
//   Drawer _drawer(BuildContext context) {
//     return Drawer(
//       backgroundColor: black,
//       child: Column(
//         children: [
//
//           const DrawerHeader(
//             child: Icon(Icons.account_circle,
//                 size: 80, color: gold),
//           ),
//
//           _drawerItem(Icons.person, "Profile", () {
//             Navigator.pushNamed(context, 'profile');
//           }),
//
//           _drawerItem(Icons.info, "About", () {
//             Navigator.pushNamed(context, 'about');
//           }),
//
//           _drawerItem(Icons.logout, "Logout", () async {
//             await FirebaseAuth.instance.signOut();
//             Navigator.pushReplacementNamed(context, 'login');
//           }),
//         ],
//       ),
//     );
//   }
//
//   Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
//     return ListTile(
//       leading: Icon(icon, color: gold),
//       title: Text(title, style: const TextStyle(color: Colors.white)),
//       onTap: onTap,
//     );
//   }
// }

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'profile_page.dart';
import 'about.dart';
import 'analytics_page.dart';
import 'setting_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  static const Color black = Color(0xFF080808);
  static const Color gold = Color(0xFFD4AF37);

  late AnimationController _controller;

  int _currentIndex = 0;
  String userName = "Loading...";

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    fetchUserName();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// SAFE NUMBER CONVERTER
  double safeDouble(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value) ?? 0;
    return 0;
  }

  /// FETCH USERNAME
  Future<void> fetchUserName() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid != null) {
        final doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .get();

        if (doc.exists) {
          setState(() {
            userName = doc['name'] ?? "User";
          });
        }
      }
    } catch (e) {
      debugPrint("User fetch error: $e");
    }
  }

  /// LOGOUT
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      drawer: _drawer(),
      body: Stack(
        children: [
          /// ANIMATED BACKGROUND
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              return Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(sin(_controller.value * 2 * pi), -0.3),
                    radius: 1.6,
                    colors: [gold.withOpacity(.15), black],
                  ),
                ),
              );
            },
          ),

          SafeArea(child: _pages()),
        ],
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  /// PAGE SWITCH
  Widget _pages() {
    switch (_currentIndex) {
      case 0:
        return _dashboard();
      case 1:
        return const AnalyticsPage();
      case 2:
        return const SettingsPage();
      default:
        return _dashboard();
    }
  }

  /// DRAWER
  Widget _drawer() {
    return Drawer(
      backgroundColor: black,
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: gold,
                  child: Icon(Icons.person, color: Colors.black),
                ),

                const SizedBox(height: 12),

                Text(
                  userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  FirebaseAuth.instance.currentUser?.email ?? "",
                  style: const TextStyle(color: Colors.white60),
                ),
              ],
            ),
          ),

          _drawerItem(Icons.dashboard, "Dashboard", () {
            Navigator.pop(context);
            setState(() => _currentIndex = 0);
          }),

          _drawerItem(Icons.analytics, "Analytics", () {
            Navigator.pop(context);
            setState(() => _currentIndex = 1);
          }),

          _drawerItem(Icons.settings, "Settings", () {
            Navigator.pop(context);
            setState(() => _currentIndex = 2);
          }),

          _drawerItem(Icons.person, "Profile", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MyProfile()),
            );
          }),

          _drawerItem(Icons.info, "About", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const About()),
            );
          }),

          const Spacer(),

          _drawerItem(Icons.logout, "Logout", logout),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: gold),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }

  /// DASHBOARD
  Widget _dashboard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TOP BAR
          Row(
            children: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: gold),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              const Spacer(),
              const Icon(Icons.notifications, color: gold),
            ],
          ),

          const SizedBox(height: 20),

          Shimmer.fromColors(
            baseColor: gold,
            highlightColor: Colors.white,
            child: const Text(
              "Welcome Back",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            userName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          _kpiTotals(),

          const SizedBox(height: 25),

          const Text(
            "Active Investments",
            style: TextStyle(
              color: gold,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Expanded(child: _investorCards()),
        ],
      ),
    );
  }

  /// KPI TOTALS
  Widget _kpiTotals() {
    return SizedBox(
      height: 140,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('investments')
            .snapshots(),
        builder: (context, snapshot) {
          double investment = 0;
          double paid = 0;
          double balance = 0;
          int investors = 0;

          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            investors = docs.length;

            for (var doc in docs) {
              final data = doc.data() as Map<String, dynamic>;

              investment += safeDouble(data['investmentAmount']);
              paid += safeDouble(data['paidTillDate']);
              balance += safeDouble(data['balanceProfit']);
            }
          }

          return ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _glassCard(
                "Number of Investments",
                investors.toString(),
                Icons.people,
              ),

              _glassCard(
                "Total Investment",
                investment.toStringAsFixed(0),
                Icons.account_balance,
              ),

              _glassCard("Paid", paid.toStringAsFixed(0), Icons.payments),

              _glassCard(
                "Balance",
                balance.toStringAsFixed(0),
                Icons.trending_down,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _glassCard(String title, String value, IconData icon) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(.08),
            Colors.white.withOpacity(.02),
          ],
        ),
        border: Border.all(color: gold.withOpacity(.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: gold),

          const Spacer(),

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(title, style: const TextStyle(color: Colors.white60)),
        ],
      ),
    );
  }

  /// INVESTOR CARDS
  Widget _investorCards() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('investments')
          .orderBy('investmentAmount', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data!.docs;

        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final data = docs[index].data() as Map<String, dynamic>;
            return _investorCard(data);
          },
        );
      },
    );
  }

  Widget _investorCard(Map<String, dynamic> data) {
    double investment = safeDouble(data['investmentAmount']);
    double paid = safeDouble(data['paidTillDate']);
    double balance = safeDouble(data['balanceProfit']);

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(.08),
            Colors.white.withOpacity(.02),
          ],
        ),
        border: Border.all(color: gold.withOpacity(.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['investorName'] ?? "Investor",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              _miniStat("Investment", investment),

              const SizedBox(width: 10),

              _miniStat("Paid", paid),

              const SizedBox(width: 10),

              _miniStat("Balance", balance),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniStat(String title, double value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(.4),
          border: Border.all(color: gold.withOpacity(.3)),
        ),
        child: Column(
          children: [
            Text(
              value.toStringAsFixed(0),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              title,
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  /// BOTTOM NAV
  Widget _bottomNav() {
    return BottomNavigationBar(
      backgroundColor: black,
      selectedItemColor: gold,
      unselectedItemColor: Colors.white54,
      currentIndex: _currentIndex,
      onTap: (i) => setState(() => _currentIndex = i),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: "Dashboard",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.analytics),
          label: "Analytics",
        ),

        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
