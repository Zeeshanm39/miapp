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
//   /// SAFE NUMBER CONVERTER
//   double safeDouble(dynamic value) {
//     if (value == null) return 0;
//     if (value is int) return value.toDouble();
//     if (value is double) return value;
//     if (value is String) return double.tryParse(value) ?? 0;
//     return 0;
//   }
//
//   /// FETCH USER NAME
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
//   /// LOGOUT
//   void logout() async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.pushReplacementNamed(context, 'auth');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       drawer: _drawer(),
//       body: Stack(
//         children: [
//           /// ANIMATED BACKGROUND
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
//           SafeArea(child: _pages()),
//         ],
//       ),
//       bottomNavigationBar: _bottomNav(),
//     );
//   }
//
//   /// PAGE SWITCH
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
//   /// PREMIUM DRAWER
//   Widget _drawer() {
//     return Drawer(
//       backgroundColor: black,
//       child: SafeArea(
//         child: Column(
//           children: [
//             /// HEADER
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [gold.withOpacity(.25), Colors.transparent],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const CircleAvatar(
//                     radius: 35,
//                     backgroundColor: gold,
//                     child: Icon(Icons.person, size: 35, color: Colors.black),
//                   ),
//
//                   const SizedBox(height: 15),
//
//                   Text(
//                     userName,
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//
//                   const SizedBox(height: 5),
//
//                   Text(
//                     FirebaseAuth.instance.currentUser?.email ?? "",
//                     style: const TextStyle(color: Colors.white60),
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 10),
//
//             _drawerItem(Icons.dashboard, "Dashboard", () {
//               Navigator.pop(context);
//               setState(() => _currentIndex = 0);
//             }),
//
//             _drawerItem(Icons.analytics, "Analytics", () {
//               Navigator.pop(context);
//               setState(() => _currentIndex = 1);
//             }),
//
//             _drawerItem(Icons.settings, "Settings", () {
//               Navigator.pop(context);
//               setState(() => _currentIndex = 2);
//             }),
//
//             _drawerItem(Icons.person, "Profile", () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const MyProfile()),
//               );
//             }),
//
//             _drawerItem(Icons.info_outline, "About", () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const About()),
//               );
//             }),
//
//             const Spacer(),
//
//             /// GOLD DIVIDER
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 20),
//               height: 1,
//               color: gold.withOpacity(.4),
//             ),
//
//             const SizedBox(height: 10),
//
//             /// LOGOUT
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.redAccent),
//               title: const Text(
//                 "Logout",
//                 style: TextStyle(
//                     color: Colors.redAccent, fontWeight: FontWeight.bold),
//               ),
//               onTap: logout,
//             ),
//
//             const SizedBox(height: 15),
//           ],
//         ),
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
//   /// DASHBOARD
//   Widget _dashboard() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
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
//             "Active Investments",
//             style: TextStyle(
//                 color: gold, fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 10),
//
//           Expanded(child: _investorCards()),
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
//         FirebaseFirestore.instance
//             .collection('investments')
//             .where('ownerUid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
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
//               _glassCard(
//                   "Number of Investments", investors.toString(), Icons.people),
//               _glassCard("Total Investment", investment.toStringAsFixed(0),
//                   Icons.account_balance),
//               _glassCard("Amount Paid", paid.toStringAsFixed(0), Icons.payments),
//               _glassCard(
//                   "Total Balance", balance.toStringAsFixed(0), Icons.trending_down),
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
//         gradient: LinearGradient(
//           colors: [
//             Colors.white.withOpacity(.08),
//             Colors.white.withOpacity(.02),
//           ],
//         ),
//         border: Border.all(color: gold.withOpacity(.3)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: gold),
//           const Spacer(),
//           Text(value,
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold)),
//           Text(title, style: const TextStyle(color: Colors.white60)),
//         ],
//       ),
//     );
//   }
//
//   /// INVESTOR CARDS
//   Widget _investorCards() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('investments')
//           .where('ownerUid',
//           isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//           .snapshots(),
//       builder: (context, snapshot) {
//
//         if (snapshot.hasError) {
//           return Center(
//             child: Text(
//               "Error: ${snapshot.error}",
//               style: const TextStyle(color: Colors.red),
//             ),
//           );
//         }
//
//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         final docs = snapshot.data!.docs;
//
//         if (docs.isEmpty) {
//           return const Center(
//             child: Text(
//               "No Investments Found",
//               style: TextStyle(color: Colors.white),
//             ),
//           );
//         }
//
//         return ListView.builder(
//           itemCount: docs.length,
//           itemBuilder: (context, index) {
//             final data = docs[index].data() as Map<String, dynamic>;
//             return _investorCard(data);
//           },
//         );
//       },
//     );
//   }
//
//   Widget _investorCard(Map<String, dynamic> data) {
//     double investment = safeDouble(data['investmentAmount']);
//     double paid = safeDouble(data['paidTillDate']);
//     double balance = safeDouble(data['balanceProfit']);
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 15),
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(22),
//         gradient: LinearGradient(
//           colors: [
//             Colors.white.withOpacity(.08),
//             Colors.white.withOpacity(.02),
//           ],
//         ),
//         border: Border.all(color: gold.withOpacity(.3)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
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
//               _miniStat("Investment", investment),
//               const SizedBox(width: 10),
//               _miniStat("Paid", paid),
//               const SizedBox(width: 10),
//               _miniStat("Balance", balance),
//             ],
//           ),
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
//             Text(value.toStringAsFixed(0),
//                 style: const TextStyle(
//                     color: Colors.white, fontWeight: FontWeight.bold)),
//             Text(title,
//                 style: const TextStyle(color: Colors.white54, fontSize: 12)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// BOTTOM NAVIGATION
//   Widget _bottomNav() {
//     return BottomNavigationBar(
//       backgroundColor: black,
//       selectedItemColor: gold,
//       unselectedItemColor: Colors.white54,
//       currentIndex: _currentIndex,
//       onTap: (i) => setState(() => _currentIndex = i),
//       items: const [
//         BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard), label: "Dashboard"),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.analytics), label: "Analytics"),
//         BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
//       ],
//     );
//   }
// }
// --------I have included the Progress Bar in the below code-------
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:intl/intl.dart';
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
//   String currency = "AED";
//
//   final formatter = NumberFormat("#,##0", "en_US");
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
//   /// SAFE DOUBLE
//   double safeDouble(dynamic value) {
//     if (value == null) return 0;
//     if (value is int) return value.toDouble();
//     if (value is double) return value;
//     if (value is String) return double.tryParse(value) ?? 0;
//     return 0;
//   }
//
//   /// CURRENCY FORMAT
//   String money(double value) {
//     return "$currency ${formatter.format(value)}";
//   }
//
//   /// USER NAME
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
//   /// LOGOUT
//   void logout() async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.pushReplacementNamed(context, 'auth');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       drawer: _drawer(),
//       body: Stack(
//         children: [
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
//           SafeArea(child: _pages()),
//         ],
//       ),
//       bottomNavigationBar: _bottomNav(),
//     );
//   }
//
//   Widget _pages() {
//     switch (_currentIndex) {
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
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
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
//             "Active Investments",
//             style: TextStyle(
//                 color: gold,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 10),
//
//           Expanded(child: _investorCards()),
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
//         stream: FirebaseFirestore.instance
//             .collection('investments')
//             .where('ownerUid',
//             isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           double investment = 0;
//           double paid = 0;
//           double balance = 0;
//           int investors = 0;
//
//           final docs = snapshot.data!.docs;
//           investors = docs.length;
//
//           for (var doc in docs) {
//             final data = doc.data() as Map<String, dynamic>;
//
//             investment += safeDouble(data['investmentAmount']);
//             paid += safeDouble(data['paidTillDate']);
//             balance += safeDouble(data['balanceProfit']);
//           }
//
//           return ListView(
//             scrollDirection: Axis.horizontal,
//             children: [
//               _glassCard("Investors", investors.toString(), Icons.people),
//               _glassCard("Investment", money(investment), Icons.account_balance),
//               _glassCard("Paid", money(paid), Icons.payments),
//               _glassCard("Balance", money(balance), Icons.trending_up),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _glassCard(String title, String value, IconData icon) {
//     return Container(
//       width: 180,
//       margin: const EdgeInsets.only(right: 15),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(22),
//         gradient: LinearGradient(
//           colors: [
//             Colors.white.withOpacity(.08),
//             Colors.white.withOpacity(.02),
//           ],
//         ),
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
//           Text(title, style: const TextStyle(color: Colors.white60)),
//         ],
//       ),
//     );
//   }
//
//   /// INVESTOR CARDS
//   Widget _investorCards() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('investments')
//           .where('ownerUid',
//           isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
//   /// INVESTOR CARD WITH PROFIT BAR
//   Widget _investorCard(Map<String, dynamic> data) {
//
//     double investment = safeDouble(data['investmentAmount']);
//     double paid = safeDouble(data['paidTillDate']);
//     double balance = safeDouble(data['balanceProfit']);
//
//     double progress = 0;
//
//     if (investment > 0) {
//       progress = paid / investment;
//     }
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 15),
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(22),
//         gradient: LinearGradient(
//           colors: [
//             Colors.white.withOpacity(.08),
//             Colors.white.withOpacity(.02),
//           ],
//         ),
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
//           const SizedBox(height: 12),
//
//           Row(
//             children: [
//
//               _miniStat("Investment", money(investment)),
//
//               const SizedBox(width: 10),
//
//               _miniStat("Paid", money(paid)),
//
//               const SizedBox(width: 10),
//
//               _miniStat("Balance", money(balance)),
//             ],
//           ),
//
//           const SizedBox(height: 15),
//
//           /// PROFIT PROGRESS BAR
//
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               const Text(
//                 "Profit Progress",
//                 style: TextStyle(color: Colors.white60, fontSize: 12),
//               ),
//
//               const SizedBox(height: 6),
//
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: LinearProgressIndicator(
//                   value: progress,
//                   minHeight: 8,
//                   backgroundColor: Colors.black,
//                   color: gold,
//                 ),
//               ),
//
//               const SizedBox(height: 6),
//
//               Text(
//                 "${(progress * 100).toStringAsFixed(1)} %",
//                 style: const TextStyle(
//                     color: gold,
//                     fontWeight: FontWeight.bold),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _miniStat(String title, String value) {
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
//             Text(value,
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold)),
//             Text(title,
//                 style: const TextStyle(
//                     color: Colors.white54,
//                     fontSize: 12)),
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
//         BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard), label: "Dashboard"),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.analytics), label: "Analytics"),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.settings), label: "Settings"),
//       ],
//     );
//   }
//
//   /// DRAWER
//   Widget _drawer() {
//     return Drawer(
//       backgroundColor: black,
//       child: Column(
//         children: [
//
//           const SizedBox(height: 60),
//
//           ListTile(
//             leading: const Icon(Icons.dashboard, color: gold),
//             title: const Text("Dashboard",
//                 style: TextStyle(color: Colors.white)),
//             onTap: () {
//               Navigator.pop(context);
//               setState(() => _currentIndex = 0);
//             },
//           ),
//
//           ListTile(
//             leading: const Icon(Icons.analytics, color: gold),
//             title: const Text("Analytics",
//                 style: TextStyle(color: Colors.white)),
//             onTap: () {
//               Navigator.pop(context);
//               setState(() => _currentIndex = 1);
//             },
//           ),
//
//           ListTile(
//             leading: const Icon(Icons.settings, color: gold),
//             title: const Text("Settings",
//                 style: TextStyle(color: Colors.white)),
//             onTap: () {
//               Navigator.pop(context);
//               setState(() => _currentIndex = 2);
//             },
//           ),
//
//           ListTile(
//             leading: const Icon(Icons.person, color: gold),
//             title: const Text("Profile",
//                 style: TextStyle(color: Colors.white)),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const MyProfile()),
//               );
//             },
//           ),
//
//           ListTile(
//             leading: const Icon(Icons.info_outline, color: gold),
//             title: const Text("About",
//                 style: TextStyle(color: Colors.white)),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const About()),
//               );
//             },
//           ),
//
//           const Spacer(),
//
//           ListTile(
//             leading: const Icon(Icons.logout, color: Colors.red),
//             title: const Text("Logout",
//                 style: TextStyle(color: Colors.red)),
//             onTap: logout,
//           ),
//
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
// import 'dart:math';
// import 'dart:ui';
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
//   /// Safe number
//   double safeDouble(dynamic value) {
//     if (value == null) return 0;
//     if (value is int) return value.toDouble();
//     if (value is double) return value;
//     if (value is String) return double.tryParse(value) ?? 0;
//     return 0;
//   }
//
//   /// Safe date
//   DateTime? safeDate(dynamic value) {
//     if (value == null) return null;
//     if (value is Timestamp) return value.toDate();
//     if (value is String) return DateTime.tryParse(value);
//     return null;
//   }
//
//   /// Format date
//   String formatDate(DateTime? date) {
//     if (date == null) return "Not set";
//     return "${date.day}/${date.month}/${date.year}";
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
//   void logout() async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.pushReplacementNamed(context, 'auth');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       drawer: _drawer(),
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
//           SafeArea(child: _pages()),
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
//   /// Drawer
//   Widget _drawer() {
//     return Drawer(
//       backgroundColor: black,
//       child: SafeArea(
//         child: Column(
//           children: [
//
//             /// Header
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [gold.withOpacity(.25), Colors.transparent],
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   const CircleAvatar(
//                     radius: 35,
//                     backgroundColor: gold,
//                     child: Icon(Icons.person, size: 35, color: Colors.black),
//                   ),
//
//                   const SizedBox(height: 15),
//
//                   Text(
//                     userName,
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//
//                   const SizedBox(height: 5),
//
//                   Text(
//                     FirebaseAuth.instance.currentUser?.email ?? "",
//                     style: const TextStyle(color: Colors.white60),
//                   ),
//                 ],
//               ),
//             ),
//
//             _drawerItem(Icons.dashboard, "Dashboard", () {
//               Navigator.pop(context);
//               setState(() => _currentIndex = 0);
//             }),
//
//             _drawerItem(Icons.analytics, "Analytics", () {
//               Navigator.pop(context);
//               setState(() => _currentIndex = 1);
//             }),
//
//             _drawerItem(Icons.settings, "Settings", () {
//               Navigator.pop(context);
//               setState(() => _currentIndex = 2);
//             }),
//
//             _drawerItem(Icons.person, "Profile", () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const MyProfile()),
//               );
//             }),
//
//             _drawerItem(Icons.info_outline, "About", () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const About()),
//               );
//             }),
//
//             const Spacer(),
//
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.redAccent),
//               title: const Text("Logout",
//                   style: TextStyle(
//                       color: Colors.redAccent,
//                       fontWeight: FontWeight.bold)),
//               onTap: logout,
//             )
//           ],
//         ),
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
//           const Text(
//             "Active Investments",
//             style: TextStyle(
//                 color: gold,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 15),
//
//           Expanded(child: _investorCards()),
//         ],
//       ),
//     );
//   }
//
//   /// Investor cards
//   Widget _investorCards() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('investments')
//           .where('ownerUid',
//           isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//           .snapshots(),
//       builder: (context, snapshot) {
//
//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         final docs = snapshot.data!.docs;
//
//         if (docs.isEmpty) {
//           return const Center(
//               child: Text("No Investments Found",
//                   style: TextStyle(color: Colors.white)));
//         }
//
//         return ListView.builder(
//           itemCount: docs.length,
//           itemBuilder: (context, index) {
//
//             final data = docs[index].data() as Map<String, dynamic>;
//
//             return _glassInvestorCard(data);
//           },
//         );
//       },
//     );
//   }
//
//   /// Glass card
//   Widget _glassInvestorCard(Map<String, dynamic> data) {
//
//     double investment = safeDouble(data['investmentAmount']);
//     double paid = safeDouble(data['paidTillDate']);
//     double balance = safeDouble(data['balanceProfit']);
//
//     DateTime? startDate = safeDate(data['contractStartDate']);
//     DateTime? endDate = safeDate(data['contractEndDate']);
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 18),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(22),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
//           child: Container(
//             padding: const EdgeInsets.all(18),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(22),
//               color: Colors.white.withOpacity(.06),
//               border: Border.all(color: Colors.white.withOpacity(.15)),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 /// Investor Name
//                 Text(
//                   data['investorName'] ?? "Investor",
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold),
//                 ),
//
//                 const SizedBox(height: 15),
//
//                 /// Stats
//                 Row(
//                   children: [
//                     _miniStat("Investment", investment),
//                     const SizedBox(width: 10),
//                     _miniStat("Paid", paid),
//                     const SizedBox(width: 10),
//                     _miniStat("Balance", balance),
//                   ],
//                 ),
//
//                 const SizedBox(height: 15),
//
//                 /// Dates
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//
//                     Row(
//                       children: [
//                         const Icon(Icons.play_circle,
//                             color: Colors.greenAccent, size: 18),
//                         const SizedBox(width: 5),
//                         Text(
//                           formatDate(startDate),
//                           style: const TextStyle(color: Colors.white70),
//                         ),
//                       ],
//                     ),
//
//                     Row(
//                       children: [
//                         const Icon(Icons.stop_circle,
//                             color: Colors.redAccent, size: 18),
//                         const SizedBox(width: 5),
//                         Text(
//                           formatDate(endDate),
//                           style: const TextStyle(color: Colors.white70),
//                         ),
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _miniStat(String title, double value) {
//     return Expanded(
//       child: Container(
//         height: 65,
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.black.withOpacity(.45),
//           border: Border.all(color: gold.withOpacity(.3)),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//
//             FittedBox(
//               child: Text(
//                 value.toStringAsFixed(0),
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//
//             const SizedBox(height: 3),
//
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white54,
//                 fontSize: 11,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _bottomNav() {
//     return BottomNavigationBar(
//       backgroundColor: black,
//       selectedItemColor: gold,
//       unselectedItemColor: Colors.white54,
//       currentIndex: _currentIndex,
//       onTap: (i) => setState(() => _currentIndex = i),
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
//         BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analytics"),
//         BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
//       ],
//     );
//   }
// }
// Make changes to back buttons in app so that whenever they hit back button it showed always come to dashboard page
//
// import 'dart:math';
// import 'dart:ui';
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
//   final int initialIndex;
//   const DashboardPage({super.key, this.initialIndex = 0});
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
//
//   late int _currentIndex;
//   String userName = "Loading...";
//
//   @override
//   void initState() {
//     super.initState();
//
//     _currentIndex = widget.initialIndex; // Set initial bottom nav index
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
//   /// Safe number conversion
//   double safeDouble(dynamic value) {
//     if (value == null) return 0;
//     if (value is int) return value.toDouble();
//     if (value is double) return value;
//     if (value is String) return double.tryParse(value) ?? 0;
//     return 0;
//   }
//
//   /// Safe date conversion
//   DateTime? safeDate(dynamic value) {
//     if (value == null) return null;
//     if (value is Timestamp) return value.toDate();
//     if (value is String) return DateTime.tryParse(value);
//     return null;
//   }
//
//   /// Format date for display
//   String formatDate(DateTime? date) {
//     if (date == null) return "Not set";
//     return "${date.day}/${date.month}/${date.year}";
//   }
//
//   /// Fetch the current user's name
//   Future<void> fetchUserName() async {
//     try {
//       final uid = FirebaseAuth.instance.currentUser?.uid;
//       if (uid != null) {
//         final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
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
//   void logout() async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.pushReplacementNamed(context, 'auth');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       drawer: _drawer(),
//       body: Stack(
//         children: [
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
//           SafeArea(child: _pages()),
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
//   /// Drawer menu
//   Widget _drawer() {
//     return Drawer(
//       backgroundColor: black,
//       child: SafeArea(
//         child: Column(
//           children: [
//             /// Header
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [gold.withOpacity(.25), Colors.transparent],
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const CircleAvatar(
//                     radius: 35,
//                     backgroundColor: gold,
//                     child: Icon(Icons.person, size: 35, color: Colors.black),
//                   ),
//                   const SizedBox(height: 15),
//                   Text(
//                     userName,
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     FirebaseAuth.instance.currentUser?.email ?? "",
//                     style: const TextStyle(color: Colors.white60),
//                   ),
//                 ],
//               ),
//             ),
//
//             _drawerItem(Icons.dashboard, "Dashboard", () {
//               Navigator.pop(context);
//               setState(() => _currentIndex = 0);
//             }),
//             _drawerItem(Icons.analytics, "Analytics", () {
//               Navigator.pop(context);
//               setState(() => _currentIndex = 1);
//             }),
//             _drawerItem(Icons.settings, "Settings", () {
//               Navigator.pop(context);
//               setState(() => _currentIndex = 2);
//             }),
//             _drawerItem(Icons.person, "Profile", () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const MyProfile()),
//               );
//             }),
//             _drawerItem(Icons.info_outline, "About", () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const About()),
//               );
//             }),
//
//             const Spacer(),
//
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.redAccent),
//               title: const Text("Logout",
//                   style: TextStyle(
//                       color: Colors.redAccent,
//                       fontWeight: FontWeight.bold)),
//               onTap: logout,
//             ),
//           ],
//         ),
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
//   /// Dashboard main page
//   Widget _dashboard() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
//           Shimmer.fromColors(
//             baseColor: gold,
//             highlightColor: Colors.white,
//             child: const Text(
//               "Welcome Back",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             userName,
//             style: const TextStyle(
//                 color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 25),
//           const Text(
//             "Active Investments",
//             style: TextStyle(
//                 color: gold, fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 15),
//           Expanded(child: _investorCards()),
//         ],
//       ),
//     );
//   }
//
//   /// Investor cards
//   Widget _investorCards() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('investments')
//           .where('ownerUid',
//           isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
//         final docs = snapshot.data!.docs;
//         if (docs.isEmpty) return const Center(
//             child: Text("No Investments Found", style: TextStyle(color: Colors.white)));
//         return ListView.builder(
//           itemCount: docs.length,
//           itemBuilder: (context, index) {
//             final data = docs[index].data() as Map<String, dynamic>;
//             return _glassInvestorCard(data);
//           },
//         );
//       },
//     );
//   }
//
//   /// Glass-style investor card
//   Widget _glassInvestorCard(Map<String, dynamic> data) {
//     double investment = safeDouble(data['investmentAmount']);
//     double paid = safeDouble(data['paidTillDate']);
//     double balance = safeDouble(data['balanceProfit']);
//     DateTime? startDate = safeDate(data['contractStartDate']);
//     DateTime? endDate = safeDate(data['contractEndDate']);
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 18),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(22),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
//           child: Container(
//             padding: const EdgeInsets.all(18),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(22),
//               color: Colors.white.withOpacity(.06),
//               border: Border.all(color: Colors.white.withOpacity(.15)),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   data['investorName'] ?? "Investor",
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 15),
//                 Row(
//                   children: [
//                     _miniStat("Investment", investment),
//                     const SizedBox(width: 10),
//                     _miniStat("Paid", paid),
//                     const SizedBox(width: 10),
//                     _miniStat("Balance", balance),
//                   ],
//                 ),
//                 const SizedBox(height: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(Icons.play_circle, color: Colors.greenAccent, size: 18),
//                         const SizedBox(width: 5),
//                         Text(formatDate(startDate), style: const TextStyle(color: Colors.white70)),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         const Icon(Icons.stop_circle, color: Colors.redAccent, size: 18),
//                         const SizedBox(width: 5),
//                         Text(formatDate(endDate), style: const TextStyle(color: Colors.white70)),
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _miniStat(String title, double value) {
//     return Expanded(
//       child: Container(
//         height: 65,
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.black.withOpacity(.45),
//           border: Border.all(color: gold.withOpacity(.3)),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FittedBox(
//               child: Text(
//                 value.toStringAsFixed(0),
//                 style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 3),
//             Text(title, style: const TextStyle(color: Colors.white54, fontSize: 11))
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// Bottom navigation
//   Widget _bottomNav() {
//     return BottomNavigationBar(
//       backgroundColor: black,
//       selectedItemColor: gold,
//       unselectedItemColor: Colors.white54,
//       currentIndex: _currentIndex,
//       onTap: (i) => setState(() => _currentIndex = i),
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
//         BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analytics"),
//         BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
//       ],
//     );
//   }
// }

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'analytics_page.dart';
import 'setting_page.dart';
import 'profile_page.dart';
import 'about.dart';

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
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 8))
      ..repeat();
    fetchUserName();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double safeDouble(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value) ?? 0;
    return 0;
  }

  DateTime? safeDate(dynamic value) {
    if (value == null) return null;
    if (value is Timestamp) return value.toDate();
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  String formatDate(DateTime? date) {
    if (date == null) return "Not set";
    return "${date.day}/${date.month}/${date.year}";
  }

  Future<void> fetchUserName() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
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

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, 'auth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      drawer: _drawer(),
      body: Stack(
        children: [
          // Animated background
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

  Widget _drawer() {
    return Drawer(
      backgroundColor: black,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [gold.withOpacity(.25), Colors.transparent]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: gold,
                    child: Icon(Icons.person, size: 35, color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  Text(userName,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(FirebaseAuth.instance.currentUser?.email ?? "",
                      style: const TextStyle(color: Colors.white60)),
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
              Navigator.push(context, MaterialPageRoute(builder: (_) => const MyProfile()));
            }),
            _drawerItem(Icons.info_outline, "About", () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const About()));
            }),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text("Logout", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
              onTap: logout,
            )
          ],
        ),
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

  Widget _dashboard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top bar with Shimmer logo
          Row(
            children: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: gold),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              const Spacer(),
              Shimmer.fromColors(
                baseColor: gold,
                highlightColor: Colors.white,
                period: const Duration(seconds: 2),
                child: Image.asset('assets/MILogo.png', width: 40, height: 40),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Shimmer.fromColors(
            baseColor: gold,
            highlightColor: Colors.white,
            child: const Text("Welcome Back", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Text(userName, style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
          const SizedBox(height: 25),
          const Text("Active Investments", style: TextStyle(color: gold, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Expanded(child: _investorCards()),
        ],
      ),
    );
  }

  Widget _investorCards() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('investments')
          .where('ownerUid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

        final docs = snapshot.data!.docs;
        if (docs.isEmpty) return const Center(child: Text("No Investments Found", style: TextStyle(color: Colors.white)));

        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final data = docs[index].data() as Map<String, dynamic>;
            return _glassInvestorCard(data);
          },
        );
      },
    );
  }

  Widget _glassInvestorCard(Map<String, dynamic> data) {
    double investment = safeDouble(data['investmentAmount']);
    double paid = safeDouble(data['paidTillDate']);
    double balance = safeDouble(data['balanceProfit']);
    DateTime? startDate = safeDate(data['contractStartDate']);
    DateTime? endDate = safeDate(data['contractEndDate']);

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.white.withOpacity(.06),
              border: Border.all(color: Colors.white.withOpacity(.15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data['investorName'] ?? "Investor",
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                Row(
                  children: [
                    _miniStat("Investment", investment),
                    const SizedBox(width: 10),
                    _miniStat("Paid", paid),
                    const SizedBox(width: 10),
                    _miniStat("Balance", balance),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.play_circle, color: Colors.greenAccent, size: 18),
                        const SizedBox(width: 5),
                        Text(formatDate(startDate), style: const TextStyle(color: Colors.white70)),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.stop_circle, color: Colors.redAccent, size: 18),
                        const SizedBox(width: 5),
                        Text(formatDate(endDate), style: const TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _miniStat(String title, double value) {
    return Expanded(
      child: Container(
        height: 65,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(.45),
          border: Border.all(color: gold.withOpacity(.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(child: Text(value.toStringAsFixed(0), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            const SizedBox(height: 3),
            Text(title, style: const TextStyle(color: Colors.white54, fontSize: 11))
          ],
        ),
      ),
    );
  }

  Widget _bottomNav() {
    return BottomNavigationBar(
      backgroundColor: black,
      selectedItemColor: gold,
      unselectedItemColor: Colors.white54,
      currentIndex: _currentIndex,
      onTap: (i) => setState(() => _currentIndex = i),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
        BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analytics"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}