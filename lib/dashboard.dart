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

  /// SAFE NUMBER CONVERTER
  double safeDouble(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value) ?? 0;
    return 0;
  }

  /// FETCH USER NAME
  Future<void> fetchUserName() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid != null) {
        final doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

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
    Navigator.pushReplacementNamed(context, 'auth');
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

  /// PREMIUM DRAWER
  Widget _drawer() {
    return Drawer(
      backgroundColor: black,
      child: SafeArea(
        child: Column(
          children: [
            /// HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [gold.withOpacity(.25), Colors.transparent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
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

                  Text(
                    userName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    FirebaseAuth.instance.currentUser?.email ?? "",
                    style: const TextStyle(color: Colors.white60),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

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

            _drawerItem(Icons.info_outline, "About", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const About()),
              );
            }),

            const Spacer(),

            /// GOLD DIVIDER
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 1,
              color: gold.withOpacity(.4),
            ),

            const SizedBox(height: 10),

            /// LOGOUT
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                "Logout",
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),
              onTap: logout,
            ),

            const SizedBox(height: 15),
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
                fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 25),

          _kpiTotals(),

          const SizedBox(height: 25),

          const Text(
            "Active Investments",
            style: TextStyle(
                color: gold, fontSize: 20, fontWeight: FontWeight.bold),
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
        stream:
        FirebaseFirestore.instance
            .collection('investments')
            .where('ownerUid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                  "Number of Investments", investors.toString(), Icons.people),
              _glassCard("Total Investment", investment.toStringAsFixed(0),
                  Icons.account_balance),
              _glassCard("Amount Paid", paid.toStringAsFixed(0), Icons.payments),
              _glassCard(
                  "Total Balance", balance.toStringAsFixed(0), Icons.trending_down),
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
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
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
          .where('ownerUid',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {

        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error: ${snapshot.error}",
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data!.docs;

        if (docs.isEmpty) {
          return const Center(
            child: Text(
              "No Investments Found",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

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
                fontWeight: FontWeight.bold),
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
            Text(value.toStringAsFixed(0),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text(title,
                style: const TextStyle(color: Colors.white54, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  /// BOTTOM NAVIGATION
  Widget _bottomNav() {
    return BottomNavigationBar(
      backgroundColor: black,
      selectedItemColor: gold,
      unselectedItemColor: Colors.white54,
      currentIndex: _currentIndex,
      onTap: (i) => setState(() => _currentIndex = i),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), label: "Dashboard"),
        BottomNavigationBarItem(
            icon: Icon(Icons.analytics), label: "Analytics"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}