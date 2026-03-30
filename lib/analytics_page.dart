//
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class AnalyticsPage extends StatefulWidget {
//   const AnalyticsPage({super.key});
//
//   @override
//   State<AnalyticsPage> createState() => _AnalyticsPageState();
// }
//
// class _AnalyticsPageState extends State<AnalyticsPage>
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
//
//     FirebaseAnalytics.instance.logScreenView(screenName: "Analytics");
//
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
//   double safeDouble(dynamic value) {
//     if (value == null) return 0;
//     if (value is int) return value.toDouble();
//     if (value is double) return value;
//     return double.tryParse(value.toString()) ?? 0;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final uid = FirebaseAuth.instance.currentUser!.uid;
//
//     return Stack(
//       children: [
//
//         /// ANIMATED BACKGROUND
//         AnimatedBuilder(
//           animation: _controller,
//           builder: (_, __) {
//             return Container(
//               decoration: BoxDecoration(
//                 gradient: RadialGradient(
//                   center: Alignment(sin(_controller.value * 2 * pi), -0.3),
//                   radius: 1.6,
//                   colors: [gold.withOpacity(.15), black],
//                 ),
//               ),
//             );
//           },
//         ),
//
//         /// FIRESTORE STREAM
//         StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection("investments")
//               .where("ownerUid", isEqualTo: uid)
//               .snapshots(),
//           builder: (context, snapshot) {
//
//             if (!snapshot.hasData) {
//               return const Center(child: CircularProgressIndicator());
//             }
//
//             double totalInvestment = 0;
//             double totalPaid = 0;
//             double totalBalance = 0;
//
//             final docs = snapshot.data!.docs;
//
//             for (var doc in docs) {
//               final data = doc.data() as Map<String, dynamic>;
//
//               totalInvestment += safeDouble(data["investmentAmount"]);
//               totalPaid += safeDouble(data["paidTillDate"]);
//               totalBalance += safeDouble(data["balanceProfit"]);
//             }
//
//             int totalInvestors = docs.length;
//
//             return SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: ListView(
//                   children: [
//
//                     const SizedBox(height: 20),
//
//                     const Text(
//                       "Analytics Overview",
//                       style: TextStyle(
//                           color: gold,
//                           fontSize: 26,
//                           fontWeight: FontWeight.bold),
//                     ),
//
//                     const SizedBox(height: 30),
//
//                     /// KPI CARDS
//                     Row(
//                       children: [
//                         _glassCard(
//                             "Number of Investments",
//                             totalInvestors.toString(),
//                             Icons.people),
//                         const SizedBox(width: 12),
//                         _glassCard(
//                             "Total Investment",
//                             totalInvestment.toStringAsFixed(0),
//                             Icons.account_balance),
//                       ],
//                     ),
//
//                     const SizedBox(height: 12),
//
//                     Row(
//                       children: [
//                         _glassCard(
//                             "Amount Paid",
//                             totalPaid.toStringAsFixed(0),
//                             Icons.payments),
//                         const SizedBox(width: 12),
//                         _glassCard(
//                             "Total Balance",
//                             totalBalance.toStringAsFixed(0),
//                             Icons.trending_down),
//                       ],
//                     ),
//
//                     const SizedBox(height: 40),
//
//                     const Text(
//                       "Investment Distribution",
//                       style: TextStyle(
//                           color: gold,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     SizedBox(
//                       height: 260,
//                       child: PieChart(
//                         PieChartData(
//                           sectionsSpace: 3,
//                           centerSpaceRadius: 50,
//                           sections: [
//                             _pieSection(totalInvestment, "Investment"),
//                             _pieSection(totalPaid, "Paid"),
//                             _pieSection(totalBalance, "Balance"),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 40),
//
//                     const Text(
//                       "Profit Growth",
//                       style: TextStyle(
//                           color: gold,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     SizedBox(
//                       height: 250,
//                       child: LineChart(
//                         LineChartData(
//                           gridData: FlGridData(show: false),
//                           titlesData: FlTitlesData(show: false),
//                           borderData: FlBorderData(show: false),
//                           lineBarsData: [
//                             LineChartBarData(
//                               spots: [
//                                 FlSpot(0, totalInvestment * 0.2),
//                                 FlSpot(1, totalInvestment * 0.35),
//                                 FlSpot(2, totalInvestment * 0.5),
//                                 FlSpot(3, totalInvestment * 0.6),
//                                 FlSpot(4, totalInvestment * 0.75),
//                                 FlSpot(5, totalInvestment * 0.9),
//                               ],
//                               isCurved: true,
//                               color: gold,
//                               barWidth: 4,
//                               dotData: FlDotData(show: false),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 50),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
//
//   /// GLASS CARD
//   Widget _glassCard(String title, String value, IconData icon) {
//     return Expanded(
//       child: Container(
//         height: 120,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(22),
//           gradient: LinearGradient(
//             colors: [
//               Colors.white.withOpacity(.08),
//               Colors.white.withOpacity(.02),
//             ],
//           ),
//           border: Border.all(color: gold.withOpacity(.3)),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(icon, color: gold, size: 22),
//
//             Text(
//               value,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white60,
//                 fontSize: 12,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   /// PIE CHART
//   PieChartSectionData _pieSection(double value, String title) {
//     return PieChartSectionData(
//       color: gold,
//       value: value,
//       title: title,
//       radius: 70,
//       titleStyle: const TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.bold,
//           color: Colors.black),
//     );
//   }
// }
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class AnalyticsPage extends StatefulWidget {
//   const AnalyticsPage({super.key});
//
//   @override
//   State<AnalyticsPage> createState() => _AnalyticsPageState();
// }
//
// class _AnalyticsPageState extends State<AnalyticsPage>
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
//
//     FirebaseAnalytics.instance.logScreenView(screenName: "Analytics");
//
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
//   double safeDouble(dynamic value) {
//     if (value == null) return 0;
//     if (value is int) return value.toDouble();
//     if (value is double) return value;
//     return double.tryParse(value.toString()) ?? 0;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final uid = FirebaseAuth.instance.currentUser!.uid;
//
//     return Scaffold(
//       backgroundColor: black,
//       body: Stack(
//         children: [
//
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
//           SafeArea(
//             child: Column(
//               children: [
//
//                 /// TOP BAR
//                 Padding(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                   child: Row(
//                     children: [
//
//                       /// BACK BUTTON
//                       IconButton(
//                         icon: const Icon(Icons.arrow_back, color: gold),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//
//                       const Spacer(),
//
//                       const Text(
//                         "Analytics",
//                         style: TextStyle(
//                             color: gold,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       ),
//
//                       const Spacer(),
//
//                       const Icon(Icons.bar_chart, color: gold)
//                     ],
//                   ),
//                 ),
//
//                 Expanded(
//                   child: StreamBuilder<QuerySnapshot>(
//                     stream: FirebaseFirestore.instance
//                         .collection("investments")
//                         .where("ownerUid", isEqualTo: uid)
//                         .snapshots(),
//                     builder: (context, snapshot) {
//
//                       if (!snapshot.hasData) {
//                         return const Center(
//                             child: CircularProgressIndicator(color: gold));
//                       }
//
//                       double totalInvestment = 0;
//                       double totalPaid = 0;
//                       double totalBalance = 0;
//
//                       final docs = snapshot.data!.docs;
//
//                       for (var doc in docs) {
//                         final data = doc.data() as Map<String, dynamic>;
//
//                         totalInvestment += safeDouble(data["investmentAmount"]);
//                         totalPaid += safeDouble(data["paidTillDate"]);
//                         totalBalance += safeDouble(data["balanceProfit"]);
//                       }
//
//                       int totalInvestors = docs.length;
//
//                       return ListView(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         children: [
//
//                           const SizedBox(height: 20),
//
//                           const Text(
//                             "Analytics Overview",
//                             style: TextStyle(
//                                 color: gold,
//                                 fontSize: 26,
//                                 fontWeight: FontWeight.bold),
//                           ),
//
//                           const SizedBox(height: 25),
//
//                           /// KPI CARDS
//                           Row(
//                             children: [
//                               _glassCard("Investments",
//                                   totalInvestors.toString(), Icons.people),
//                               const SizedBox(width: 12),
//                               _glassCard("Total Investment",
//                                   totalInvestment.toStringAsFixed(0),
//                                   Icons.account_balance),
//                             ],
//                           ),
//
//                           const SizedBox(height: 12),
//
//                           Row(
//                             children: [
//                               _glassCard("Amount Paid",
//                                   totalPaid.toStringAsFixed(0),
//                                   Icons.payments),
//                               const SizedBox(width: 12),
//                               _glassCard("Balance",
//                                   totalBalance.toStringAsFixed(0),
//                                   Icons.trending_down),
//                             ],
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           /// PIE CHART TITLE
//                           const Text(
//                             "Investment Distribution",
//                             style: TextStyle(
//                                 color: gold,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//
//                           const SizedBox(height: 20),
//
//                           /// PIE CHART
//                           Container(
//                             height: 260,
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(22),
//                               border: Border.all(color: gold.withOpacity(.3)),
//                               color: Colors.black.withOpacity(.4),
//                             ),
//                             child: PieChart(
//                               PieChartData(
//                                 sectionsSpace: 4,
//                                 centerSpaceRadius: 45,
//                                 sections: [
//                                   _pieSection(totalInvestment, "Investment"),
//                                   _pieSection(totalPaid, "Paid"),
//                                   _pieSection(totalBalance, "Balance"),
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                           const SizedBox(height: 40),
//
//                           /// LINE CHART TITLE
//                           const Text(
//                             "Profit Growth",
//                             style: TextStyle(
//                                 color: gold,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//
//                           const SizedBox(height: 20),
//
//                           /// LINE CHART
//                           Container(
//                             height: 260,
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(22),
//                               border: Border.all(color: gold.withOpacity(.3)),
//                               color: Colors.black.withOpacity(.4),
//                             ),
//                             child: LineChart(
//                               LineChartData(
//                                 gridData: FlGridData(show: false),
//                                 titlesData: FlTitlesData(show: false),
//                                 borderData: FlBorderData(show: false),
//                                 lineBarsData: [
//                                   LineChartBarData(
//                                     spots: [
//                                       FlSpot(0, totalInvestment * 0.2),
//                                       FlSpot(1, totalInvestment * 0.35),
//                                       FlSpot(2, totalInvestment * 0.5),
//                                       FlSpot(3, totalInvestment * 0.6),
//                                       FlSpot(4, totalInvestment * 0.75),
//                                       FlSpot(5, totalInvestment * 0.9),
//                                     ],
//                                     isCurved: true,
//                                     color: gold,
//                                     barWidth: 4,
//                                     dotData: FlDotData(show: false),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                           const SizedBox(height: 40),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// GLASS KPI CARD
//   Widget _glassCard(String title, String value, IconData icon) {
//     return Expanded(
//       child: Container(
//         height: 120,
//         padding: const EdgeInsets.all(18),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(22),
//           gradient: LinearGradient(
//             colors: [
//               Colors.white.withOpacity(.08),
//               Colors.white.withOpacity(.02),
//             ],
//           ),
//           border: Border.all(color: gold.withOpacity(.3)),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Icon(icon, color: gold),
//
//             Text(value,
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold)),
//
//             Text(title, style: const TextStyle(color: Colors.white60)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// PIE CHART SECTION
//   PieChartSectionData _pieSection(double value, String title) {
//     return PieChartSectionData(
//       color: gold,
//       value: value,
//       title: title,
//       radius: 70,
//       titleStyle: const TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.bold,
//           color: Colors.black),
//     );
//   }
// }
//
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shimmer/shimmer.dart';
//
// import 'dashboard.dart';
//
// class AnalyticsPage extends StatefulWidget {
//   const AnalyticsPage({super.key});
//
//   @override
//   State<AnalyticsPage> createState() => _AnalyticsPageState();
// }
//
// class _AnalyticsPageState extends State<AnalyticsPage>
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
//
//     FirebaseAnalytics.instance.logScreenView(screenName: "Analytics");
//
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
//   double safeDouble(dynamic value) {
//     if (value == null) return 0;
//     if (value is int) return value.toDouble();
//     if (value is double) return value;
//     return double.tryParse(value.toString()) ?? 0;
//   }
//
//   /// RETURN TO DASHBOARD
//   void goDashboard() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => const DashboardPage()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final uid = FirebaseAuth.instance.currentUser!.uid;
//
//     return Scaffold(
//       backgroundColor: black,
//       body: Stack(
//         children: [
//
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
//           SafeArea(
//             child: Column(
//               children: [
//
//                 /// TOP BAR
//                 Padding(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                   child: Row(
//                     children: [
//
//                       /// BACK BUTTON
//                       IconButton(
//                         icon: const Icon(Icons.arrow_back, color: gold),
//                         onPressed: goDashboard,
//                       ),
//
//                       const Spacer(),
//
//                       const Text(
//                         "Analytics",
//                         style: TextStyle(
//                             color: gold,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       ),
//
//                       const Spacer(),
//
//                       const Icon(Icons.bar_chart, color: gold)
//                     ],
//                   ),
//                 ),
//
//                 Expanded(
//                   child: StreamBuilder<QuerySnapshot>(
//                     stream: FirebaseFirestore.instance
//                         .collection("investments")
//                         .where("ownerUid", isEqualTo: uid)
//                         .snapshots(),
//                     builder: (context, snapshot) {
//
//                       if (!snapshot.hasData) {
//                         return _shimmerLoading();
//                       }
//
//                       double totalInvestment = 0;
//                       double totalPaid = 0;
//                       double totalBalance = 0;
//
//                       final docs = snapshot.data!.docs;
//
//                       for (var doc in docs) {
//                         final data = doc.data() as Map<String, dynamic>;
//
//                         totalInvestment += safeDouble(data["investmentAmount"]);
//                         totalPaid += safeDouble(data["paidTillDate"]);
//                         totalBalance += safeDouble(data["balanceProfit"]);
//                       }
//
//                       int totalInvestors = docs.length;
//
//                       return ListView(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         children: [
//
//                           const SizedBox(height: 20),
//
//                           const Text(
//                             "Analytics Overview",
//                             style: TextStyle(
//                                 color: gold,
//                                 fontSize: 26,
//                                 fontWeight: FontWeight.bold),
//                           ),
//
//                           const SizedBox(height: 25),
//
//                           /// KPI CARDS
//                           Row(
//                             children: [
//                               _glassCard("Investments",
//                                   totalInvestors.toString(), Icons.people),
//                               const SizedBox(width: 12),
//                               _glassCard("Total Investment",
//                                   totalInvestment.toStringAsFixed(0),
//                                   Icons.account_balance),
//                             ],
//                           ),
//
//                           const SizedBox(height: 12),
//
//                           Row(
//                             children: [
//                               _glassCard("Amount Paid",
//                                   totalPaid.toStringAsFixed(0),
//                                   Icons.payments),
//                               const SizedBox(width: 12),
//                               _glassCard("Balance",
//                                   totalBalance.toStringAsFixed(0),
//                                   Icons.trending_down),
//                             ],
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           const Text(
//                             "Investment Distribution",
//                             style: TextStyle(
//                                 color: gold,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//
//                           const SizedBox(height: 20),
//
//                           /// PIE CHART
//                           Container(
//                             height: 260,
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(22),
//                               border: Border.all(color: gold.withOpacity(.3)),
//                               color: Colors.black.withOpacity(.4),
//                             ),
//                             child: PieChart(
//                               PieChartData(
//                                 sectionsSpace: 4,
//                                 centerSpaceRadius: 45,
//                                 sections: [
//                                   _pieSection(totalInvestment, "Investment"),
//                                   _pieSection(totalPaid, "Paid"),
//                                   _pieSection(totalBalance, "Balance"),
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                           const SizedBox(height: 40),
//
//                           const Text(
//                             "Profit Growth",
//                             style: TextStyle(
//                                 color: gold,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//
//                           const SizedBox(height: 20),
//
//                           /// LINE CHART
//                           Container(
//                             height: 260,
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(22),
//                               border: Border.all(color: gold.withOpacity(.3)),
//                               color: Colors.black.withOpacity(.4),
//                             ),
//                             child: LineChart(
//                               LineChartData(
//                                 gridData: FlGridData(show: false),
//                                 titlesData: FlTitlesData(show: false),
//                                 borderData: FlBorderData(show: false),
//                                 lineBarsData: [
//                                   LineChartBarData(
//                                     spots: [
//                                       FlSpot(0, totalInvestment * 0.2),
//                                       FlSpot(1, totalInvestment * 0.35),
//                                       FlSpot(2, totalInvestment * 0.5),
//                                       FlSpot(3, totalInvestment * 0.6),
//                                       FlSpot(4, totalInvestment * 0.75),
//                                       FlSpot(5, totalInvestment * 0.9),
//                                     ],
//                                     isCurved: true,
//                                     color: gold,
//                                     barWidth: 4,
//                                     dotData: FlDotData(show: false),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                           const SizedBox(height: 40),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// GLASS CARD
//   Widget _glassCard(String title, String value, IconData icon) {
//     return Expanded(
//       child: Container(
//         height: 120,
//         padding: const EdgeInsets.all(18),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(22),
//           gradient: LinearGradient(
//             colors: [
//               Colors.white.withOpacity(.08),
//               Colors.white.withOpacity(.02),
//             ],
//           ),
//           border: Border.all(color: gold.withOpacity(.3)),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Icon(icon, color: gold),
//
//             Text(value,
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold)),
//
//             Text(title, style: const TextStyle(color: Colors.white60)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// PIE SECTION
//   PieChartSectionData _pieSection(double value, String title) {
//     return PieChartSectionData(
//       color: gold,
//       value: value,
//       title: title,
//       radius: 70,
//       titleStyle: const TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.bold,
//           color: Colors.black),
//     );
//   }
//
//   /// LUXURY SHIMMER
//   Widget _shimmerLoading() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Shimmer.fromColors(
//         baseColor: Colors.grey.shade800,
//         highlightColor: Colors.grey.shade600,
//         child: ListView(
//           children: [
//
//             const SizedBox(height: 30),
//
//             Container(height: 25, width: 200, color: Colors.white),
//
//             const SizedBox(height: 30),
//
//             Row(children: [_shimmerCard(), const SizedBox(width: 12), _shimmerCard()]),
//             const SizedBox(height: 12),
//             Row(children: [_shimmerCard(), const SizedBox(width: 12), _shimmerCard()]),
//
//             const SizedBox(height: 40),
//
//             Container(height: 250, color: Colors.white),
//
//             const SizedBox(height: 40),
//
//             Container(height: 250, color: Colors.white),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _shimmerCard() {
//     return Expanded(
//       child: Container(
//         height: 120,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     );
//   }
// }
//
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class AnalyticsPage extends StatefulWidget {
//   const AnalyticsPage({super.key});
//
//   @override
//   State<AnalyticsPage> createState() => _AnalyticsPageState();
// }
//
// class _AnalyticsPageState extends State<AnalyticsPage>
//     with SingleTickerProviderStateMixin {
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     FirebaseAnalytics.instance.logScreenView(screenName: "Analytics");
//
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
//   double safeDouble(dynamic value) {
//     if (value == null) return 0;
//     if (value is int) return value.toDouble();
//     if (value is double) return value;
//     return double.tryParse(value.toString()) ?? 0;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final uid = FirebaseAuth.instance.currentUser!.uid;
//
//     return Scaffold(
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
//           /// FIRESTORE STREAM
//           StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance
//                 .collection("investments")
//                 .where("ownerUid", isEqualTo: uid)
//                 .snapshots(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//
//               double totalInvestment = 0;
//               double totalPaid = 0;
//               double totalBalance = 0;
//
//               final docs = snapshot.data!.docs;
//
//               for (var doc in docs) {
//                 final data = doc.data() as Map<String, dynamic>;
//                 totalInvestment += safeDouble(data["investmentAmount"]);
//                 totalPaid += safeDouble(data["paidTillDate"]);
//                 totalBalance += safeDouble(data["balanceProfit"]);
//               }
//
//               int totalInvestors = docs.length;
//
//               return SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     children: [
//                       /// BACK BUTTON + TITLE
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.arrow_back, color: Colors.white),
//                             onPressed: () {
//                               Navigator.pop(context); // Goes back to Dashboard
//                             },
//                           ),
//                           const SizedBox(width: 8),
//                           const Text(
//                             "Analytics Overview",
//                             style: TextStyle(
//                                 color: gold,
//                                 fontSize: 26,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//
//                       /// PAGE CONTENT
//                       Expanded(
//                         child: ListView(
//                           children: [
//                             /// KPI CARDS
//                             Row(
//                               children: [
//                                 _glassCard(
//                                     "Number of Investments",
//                                     totalInvestors.toString(),
//                                     Icons.people),
//                                 const SizedBox(width: 12),
//                                 _glassCard(
//                                     "Total Investment",
//                                     totalInvestment.toStringAsFixed(0),
//                                     Icons.account_balance),
//                               ],
//                             ),
//                             const SizedBox(height: 12),
//                             Row(
//                               children: [
//                                 _glassCard(
//                                     "Amount Paid",
//                                     totalPaid.toStringAsFixed(0),
//                                     Icons.payments),
//                                 const SizedBox(width: 12),
//                                 _glassCard(
//                                     "Total Balance",
//                                     totalBalance.toStringAsFixed(0),
//                                     Icons.trending_down),
//                               ],
//                             ),
//                             const SizedBox(height: 40),
//
//                             /// PIE CHART
//                             const Text(
//                               "Investment Distribution",
//                               style: TextStyle(
//                                   color: gold,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 20),
//                             SizedBox(
//                               height: 260,
//                               child: PieChart(
//                                 PieChartData(
//                                   sectionsSpace: 3,
//                                   centerSpaceRadius: 50,
//                                   sections: [
//                                     _pieSection(totalInvestment, "Investment"),
//                                     _pieSection(totalPaid, "Paid"),
//                                     _pieSection(totalBalance, "Balance"),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 40),
//
//                             /// LINE CHART
//                             const Text(
//                               "Profit Growth",
//                               style: TextStyle(
//                                   color: gold,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 20),
//                             SizedBox(
//                               height: 250,
//                               child: LineChart(
//                                 LineChartData(
//                                   gridData: FlGridData(show: false),
//                                   titlesData: FlTitlesData(show: false),
//                                   borderData: FlBorderData(show: false),
//                                   lineBarsData: [
//                                     LineChartBarData(
//                                       spots: [
//                                         FlSpot(0, totalInvestment * 0.2),
//                                         FlSpot(1, totalInvestment * 0.35),
//                                         FlSpot(2, totalInvestment * 0.5),
//                                         FlSpot(3, totalInvestment * 0.6),
//                                         FlSpot(4, totalInvestment * 0.75),
//                                         FlSpot(5, totalInvestment * 0.9),
//                                       ],
//                                       isCurved: true,
//                                       color: gold,
//                                       barWidth: 4,
//                                       dotData: FlDotData(show: false),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 50),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// GLASS CARD
//   Widget _glassCard(String title, String value, IconData icon) {
//     return Expanded(
//       child: Container(
//         height: 120,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(22),
//           gradient: LinearGradient(
//             colors: [
//               Colors.white.withOpacity(.08),
//               Colors.white.withOpacity(.02),
//             ],
//           ),
//           border: Border.all(color: gold.withOpacity(.3)),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(icon, color: gold, size: 22),
//             Text(
//               value,
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white60,
//                 fontSize: 12,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// PIE CHART SECTION
//   PieChartSectionData _pieSection(double value, String title) {
//     return PieChartSectionData(
//       color: gold,
//       value: value,
//       title: title,
//       radius: 70,
//       titleStyle: const TextStyle(
//           fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
//     );
//   }
// }
//
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dashboard.dart'; // Make sure to import your dashboard page
//
// class AnalyticsPage extends StatefulWidget {
//   const AnalyticsPage({super.key});
//
//   @override
//   State<AnalyticsPage> createState() => _AnalyticsPageState();
// }
//
// class _AnalyticsPageState extends State<AnalyticsPage>
//     with SingleTickerProviderStateMixin {
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     FirebaseAnalytics.instance.logScreenView(screenName: "Analytics");
//
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
//   double safeDouble(dynamic value) {
//     if (value == null) return 0;
//     if (value is int) return value.toDouble();
//     if (value is double) return value;
//     return double.tryParse(value.toString()) ?? 0;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final uid = FirebaseAuth.instance.currentUser!.uid;
//
//     return Scaffold(
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
//           /// FIRESTORE STREAM
//           StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance
//                 .collection("investments")
//                 .where("ownerUid", isEqualTo: uid)
//                 .snapshots(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//
//               double totalInvestment = 0;
//               double totalPaid = 0;
//               double totalBalance = 0;
//
//               final docs = snapshot.data!.docs;
//
//               for (var doc in docs) {
//                 final data = doc.data() as Map<String, dynamic>;
//                 totalInvestment += safeDouble(data["investmentAmount"]);
//                 totalPaid += safeDouble(data["paidTillDate"]);
//                 totalBalance += safeDouble(data["balanceProfit"]);
//               }
//
//               int totalInvestors = docs.length;
//
//               return SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     children: [
//                       /// BACK BUTTON + TITLE
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.arrow_back, color: Colors.white),
//                             onPressed: () {
//                               // Navigate to Dashboard and set index = 0
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) => const DashboardPage(initialIndex: 0),
//                                 ),
//                               );
//                             },
//                           ),
//                           const SizedBox(width: 8),
//                           const Text(
//                             "Analytics Overview",
//                             style: TextStyle(
//                                 color: gold,
//                                 fontSize: 26,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//
//                       /// PAGE CONTENT
//                       Expanded(
//                         child: ListView(
//                           children: [
//                             /// KPI CARDS
//                             Row(
//                               children: [
//                                 _glassCard(
//                                     "Number of Investments",
//                                     totalInvestors.toString(),
//                                     Icons.people),
//                                 const SizedBox(width: 12),
//                                 _glassCard(
//                                     "Total Investment",
//                                     totalInvestment.toStringAsFixed(0),
//                                     Icons.account_balance),
//                               ],
//                             ),
//                             const SizedBox(height: 12),
//                             Row(
//                               children: [
//                                 _glassCard(
//                                     "Amount Paid",
//                                     totalPaid.toStringAsFixed(0),
//                                     Icons.payments),
//                                 const SizedBox(width: 12),
//                                 _glassCard(
//                                     "Total Balance",
//                                     totalBalance.toStringAsFixed(0),
//                                     Icons.trending_down),
//                               ],
//                             ),
//                             const SizedBox(height: 40),
//
//                             /// PIE CHART
//                             const Text(
//                               "Investment Distribution",
//                               style: TextStyle(
//                                   color: gold,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 20),
//                             SizedBox(
//                               height: 260,
//                               child: PieChart(
//                                 PieChartData(
//                                   sectionsSpace: 3,
//                                   centerSpaceRadius: 50,
//                                   sections: [
//                                     _pieSection(totalInvestment, "Investment"),
//                                     _pieSection(totalPaid, "Paid"),
//                                     _pieSection(totalBalance, "Balance"),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 40),
//
//                             /// LINE CHART
//                             const Text(
//                               "Profit Growth",
//                               style: TextStyle(
//                                   color: gold,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 20),
//                             SizedBox(
//                               height: 250,
//                               child: LineChart(
//                                 LineChartData(
//                                   gridData: FlGridData(show: false),
//                                   titlesData: FlTitlesData(show: false),
//                                   borderData: FlBorderData(show: false),
//                                   lineBarsData: [
//                                     LineChartBarData(
//                                       spots: [
//                                         FlSpot(0, totalInvestment * 0.2),
//                                         FlSpot(1, totalInvestment * 0.35),
//                                         FlSpot(2, totalInvestment * 0.5),
//                                         FlSpot(3, totalInvestment * 0.6),
//                                         FlSpot(4, totalInvestment * 0.75),
//                                         FlSpot(5, totalInvestment * 0.9),
//                                       ],
//                                       isCurved: true,
//                                       color: gold,
//                                       barWidth: 4,
//                                       dotData: FlDotData(show: false),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 50),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// GLASS CARD
//   Widget _glassCard(String title, String value, IconData icon) {
//     return Expanded(
//       child: Container(
//         height: 120,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(22),
//           gradient: LinearGradient(
//             colors: [
//               Colors.white.withOpacity(.08),
//               Colors.white.withOpacity(.02),
//             ],
//           ),
//           border: Border.all(color: gold.withOpacity(.3)),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(icon, color: gold, size: 22),
//             Text(
//               value,
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white60,
//                 fontSize: 12,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// PIE CHART SECTION
//   PieChartSectionData _pieSection(double value, String title) {
//     return PieChartSectionData(
//       color: gold,
//       value: value,
//       title: title,
//       radius: 70,
//       titleStyle: const TextStyle(
//           fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
//     );
//   }
// }
//
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shimmer/shimmer.dart';
//
// import 'dashboard.dart';
//
// class AnalyticsPage extends StatefulWidget {
//   const AnalyticsPage({super.key});
//
//   @override
//   State<AnalyticsPage> createState() => _AnalyticsPageState();
// }
//
// class _AnalyticsPageState extends State<AnalyticsPage>
//     with SingleTickerProviderStateMixin {
//   static const Color black = Color(0xFF080808);
//   static const Color gold = Color(0xFFD4AF37);
//
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     FirebaseAnalytics.instance.logScreenView(screenName: "Analytics");
//
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
//   double safeDouble(dynamic value) {
//     if (value == null) return 0;
//     if (value is int) return value.toDouble();
//     if (value is double) return value;
//     return double.tryParse(value.toString()) ?? 0;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final uid = FirebaseAuth.instance.currentUser!.uid;
//
//     return Scaffold(
//       backgroundColor: black,
//       body: Stack(
//         children: [
//           // Animated background
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
//           StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance
//                 .collection("investments")
//                 .where("ownerUid", isEqualTo: uid)
//                 .snapshots(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//
//               double totalInvestment = 0;
//               double totalPaid = 0;
//               double totalBalance = 0;
//
//               final docs = snapshot.data!.docs;
//               for (var doc in docs) {
//                 final data = doc.data() as Map<String, dynamic>;
//                 totalInvestment += safeDouble(data["investmentAmount"]);
//                 totalPaid += safeDouble(data["paidTillDate"]);
//                 totalBalance += safeDouble(data["balanceProfit"]);
//               }
//               int totalInvestors = docs.length;
//
//               return SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: ListView(
//                     children: [
//                       const SizedBox(height: 20),
//
//                       // Shining logo
//                       Center(
//                         child: Shimmer.fromColors(
//                           baseColor: gold,
//                           highlightColor: Colors.white,
//                           period: const Duration(seconds: 2),
//                           child: Image.asset(
//                             'assets/MILogo.png',
//                             width: 100,
//                             height: 100,
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 20),
//
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.arrow_back, color: Colors.white),
//                             onPressed: () {
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (_) => const DashboardPage()),
//                               );
//                             },
//                           ),
//                           const SizedBox(width: 10),
//                           const Text(
//                             "Analytics Overview",
//                             style: TextStyle(
//                               color: gold,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       const SizedBox(height: 30),
//
//                       // KPI Cards
//                       Row(
//                         children: [
//                           _glassCard("Investments", totalInvestors.toString(), Icons.people),
//                           const SizedBox(width: 12),
//                           _glassCard(
//                               "Total Investment", totalInvestment.toStringAsFixed(0), Icons.account_balance),
//                         ],
//                       ),
//
//                       const SizedBox(height: 12),
//
//                       Row(
//                         children: [
//                           _glassCard("Amount Paid", totalPaid.toStringAsFixed(0), Icons.payments),
//                           const SizedBox(width: 12),
//                           _glassCard("Balance", totalBalance.toStringAsFixed(0), Icons.trending_down),
//                         ],
//                       ),
//
//                       const SizedBox(height: 40),
//
//                       const Text(
//                         "Investment Distribution",
//                         style: TextStyle(color: gold, fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//
//                       const SizedBox(height: 20),
//
//                       SizedBox(
//                         height: 260,
//                         child: PieChart(
//                           PieChartData(
//                             sectionsSpace: 3,
//                             centerSpaceRadius: 50,
//                             sections: [
//                               _pieSection(totalInvestment, "Investment"),
//                               _pieSection(totalPaid, "Paid"),
//                               _pieSection(totalBalance, "Balance"),
//                             ],
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 40),
//
//                       const Text(
//                         "Profit Growth",
//                         style: TextStyle(color: gold, fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//
//                       const SizedBox(height: 20),
//
//                       SizedBox(
//                         height: 250,
//                         child: LineChart(
//                           LineChartData(
//                             gridData: FlGridData(show: false),
//                             titlesData: FlTitlesData(show: false),
//                             borderData: FlBorderData(show: false),
//                             lineBarsData: [
//                               LineChartBarData(
//                                 spots: [
//                                   FlSpot(0, totalInvestment * 0.2),
//                                   FlSpot(1, totalInvestment * 0.35),
//                                   FlSpot(2, totalInvestment * 0.5),
//                                   FlSpot(3, totalInvestment * 0.6),
//                                   FlSpot(4, totalInvestment * 0.75),
//                                   FlSpot(5, totalInvestment * 0.9),
//                                 ],
//                                 isCurved: true,
//                                 color: gold,
//                                 barWidth: 4,
//                                 dotData: FlDotData(show: false),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 50),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _glassCard(String title, String value, IconData icon) {
//     return Expanded(
//       child: Container(
//         height: 120,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(22),
//           gradient: LinearGradient(
//             colors: [
//               Colors.white.withOpacity(.08),
//               Colors.white.withOpacity(.02),
//             ],
//           ),
//           border: Border.all(color: gold.withOpacity(.3)),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(icon, color: gold, size: 22),
//             Text(value,
//                 style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
//             Text(title,
//                 style: const TextStyle(color: Colors.white60, fontSize: 12)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   PieChartSectionData _pieSection(double value, String title) {
//     return PieChartSectionData(
//       color: gold,
//       value: value,
//       title: title,
//       radius: 70,
//       titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
//     );
//   }
// }

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shimmer/shimmer.dart';

import 'dashboard.dart';

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

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logScreenView(screenName: "Analytics");

    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 8))
      ..repeat();
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

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [
          /// Animated background
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

          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("investments")
                .where("ownerUid", isEqualTo: uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              double totalInvestment = 0;
              double totalPaid = 0;
              double totalBalance = 0;

              final docs = snapshot.data!.docs;

              for (var doc in docs) {
                final data = doc.data() as Map<String, dynamic>;
                totalInvestment += safeDouble(data["investmentAmount"]);
                totalPaid += safeDouble(data["paidTillDate"]);
                totalBalance += safeDouble(data["balanceProfit"]);
              }

              int totalInvestors = docs.length;

              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      const SizedBox(height: 10),

                      /// TOP BAR (Same as Dashboard)
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: gold),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const DashboardPage()),
                              );
                            },
                          ),
                          const Spacer(),
                          Shimmer.fromColors(
                            baseColor: gold,
                            highlightColor: Colors.white,
                            period: const Duration(seconds: 2),
                            child: Image.asset(
                              'assets/MILogo.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Analytics Overview",
                        style: TextStyle(
                          color: gold,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      /// KPI Cards
                      Row(
                        children: [
                          _glassCard(
                              "Investments",
                              totalInvestors.toString(),
                              Icons.people),
                          const SizedBox(width: 12),
                          _glassCard(
                              "Total Investment",
                              totalInvestment.toStringAsFixed(0),
                              Icons.account_balance),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          _glassCard("Amount Paid",
                              totalPaid.toStringAsFixed(0), Icons.payments),
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
                                  FlSpot(0, totalInvestment * 0.2),
                                  FlSpot(1, totalInvestment * 0.35),
                                  FlSpot(2, totalInvestment * 0.5),
                                  FlSpot(3, totalInvestment * 0.6),
                                  FlSpot(4, totalInvestment * 0.75),
                                  FlSpot(5, totalInvestment * 0.9),
                                ],
                                isCurved: true,
                                color: gold,
                                barWidth: 4,
                                dotData: FlDotData(show: false),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _glassCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(16),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: gold, size: 22),
            Text(value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text(title,
                style: const TextStyle(color: Colors.white60, fontSize: 12)),
          ],
        ),
      ),
    );
  }

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