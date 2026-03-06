import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage>
    with SingleTickerProviderStateMixin {
  static const Color black = Color(0xFF080808);
  static const Color gold = Color(0xFFD4AF37);

  late AnimationController _controller;

  int totalInvestors = 0;
  double totalInvestment = 0;
  double totalPaid = 0;
  double totalBalance = 0;

  @override
  void initState() {
    super.initState();

    FirebaseAnalytics.instance.logScreenView(screenName: "Analytics");

    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 8))
      ..repeat();

    loadAnalytics();
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
    return double.tryParse(value.toString()) ?? 0;
  }

  Future<void> loadAnalytics() async {
    final snapshot =
    await FirebaseFirestore.instance.collection("investments").get();

    double investment = 0;
    double paid = 0;
    double balance = 0;

    for (var doc in snapshot.docs) {
      final data = doc.data();

      investment += safeDouble(data["investmentAmount"]);
      paid += safeDouble(data["paidTillDate"]);
      balance += safeDouble(data["balanceProfit"]);
    }

    setState(() {
      totalInvestors = snapshot.docs.length;
      totalInvestment = investment;
      totalPaid = paid;
      totalBalance = balance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const SizedBox(height: 20),

                const Text(
                  "Analytics Overview",
                  style: TextStyle(
                      color: gold,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                /// KPI CARDS
                Row(
                  children: [
                    _glassCard("Investors", totalInvestors.toString(),
                        Icons.people),
                    const SizedBox(width: 12),
                    _glassCard("Investment",
                        totalInvestment.toStringAsFixed(0), Icons.account_balance),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    _glassCard("Paid", totalPaid.toStringAsFixed(0),
                        Icons.payments),
                    const SizedBox(width: 12),
                    _glassCard("Balance",
                        totalBalance.toStringAsFixed(0), Icons.trending_down),
                  ],
                ),

                const SizedBox(height: 40),

                const Text(
                  "Investment Distribution",
                  style: TextStyle(
                      color: gold,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: 260,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 3,
                      centerSpaceRadius: 50,
                      sections: [
                        _pieSection(totalInvestment, "Investment"),
                        _pieSection(totalPaid, "Paid"),
                        _pieSection(totalBalance, "Balance"),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                const Text(
                  "Profit Growth",
                  style: TextStyle(
                      color: gold,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: 250,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            const FlSpot(0, 2),
                            const FlSpot(1, 3),
                            const FlSpot(2, 5),
                            const FlSpot(3, 3),
                            const FlSpot(4, 6),
                            const FlSpot(5, 8),
                          ],
                          isCurved: true,
                          color: gold,
                          barWidth: 4,
                          dotData: FlDotData(show: false),
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// GLASS CARD
  Widget _glassCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        height: 120,
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
      ),
    );
  }

  /// PIE CHART SECTION
  PieChartSectionData _pieSection(double value, String title) {
    return PieChartSectionData(
      color: gold,
      value: value,
      title: title,
      radius: 70,
      titleStyle: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}