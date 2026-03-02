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
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
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
      drawer: _appDrawer(context),
      bottomNavigationBar: _bottomNav(),
      body: Stack(
        children: [
          /// 🔥 Animated Gold Background
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              return Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(
                      sin(_controller.value * 2 * pi),
                      -0.3,
                    ),
                    radius: 1.5,
                    colors: [
                      gold.withOpacity(0.12),
                      black,
                    ],
                  ),
                ),
              );
            },
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
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

                  const SizedBox(height: 30),

                  /// WELCOME
                  Shimmer.fromColors(
                    baseColor: gold,
                    highlightColor: Colors.white,
                    child: const Text(
                      "Welcome Back,",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),

                  const SizedBox(height: 5),

                  /// 🔹 Dynamic user name with StreamBuilder
                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text(
                          "Loading...",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        );
                      }

                      if (snapshot.hasError ||
                          !snapshot.hasData ||
                          !snapshot.data!.exists) {
                        return const Text(
                          "User",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        );
                      }

                      final userDoc = snapshot.data!;
                      final name = userDoc['name'] ?? "User";

                      return Text(
                        name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 40),

                  /// KPI CARDS
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        _kpiCard("Clients", "128", Icons.people),
                        _kpiCard("Revenue", "\$2.4M", Icons.trending_up),
                        _kpiCard("Projects", "36", Icons.workspaces),
                        _kpiCard("Reports", "14", Icons.bar_chart),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🏆 KPI CARD
  Widget _kpiCard(String title, String value, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white.withOpacity(0.06),
        border: Border.all(color: gold.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: gold.withOpacity(0.15),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: gold, size: 30),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }

  /// 📌 DRAWER
  Drawer _appDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          /// 🔹 Drawer Header with dynamic user name
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              String displayName = "User";
              if (snapshot.hasData && snapshot.data!.exists) {
                displayName = snapshot.data!['name'] ?? "User";
              }

              return DrawerHeader(
                decoration: BoxDecoration(color: gold.withOpacity(0.1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Merveille Dashboard",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      displayName,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          _drawerItem(Icons.dashboard, "Dashboard", () {
            Navigator.pop(context);
          }),
          _drawerItem(Icons.person, "Profile", () {
            Navigator.pushNamed(context, 'profile');
          }),
          _drawerItem(Icons.info, "About", () {
            Navigator.pushNamed(context, 'about');
          }),
          _drawerItem(Icons.logout, "Logout", () {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamedAndRemoveUntil(
                context, 'login', (route) => false);
          }),
        ],
      ),
    );
  }

  ListTile _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: gold),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }

  /// 🔽 BOTTOM NAV
  Widget _bottomNav() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: black,
      selectedItemColor: gold,
      unselectedItemColor: Colors.white38,
      onTap: (index) {
        setState(() => _currentIndex = index);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analytics"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}