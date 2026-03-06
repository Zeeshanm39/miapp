import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnalyticsPage extends StatelessWidget {

  const AnalyticsPage({super.key});

  static const Color black = Color(0xFF080808);
  static const Color gold = Color(0xFFD4AF37);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Text(
          "Analytics Charts Coming Here",
          style: TextStyle(color: gold, fontSize: 20),
        ),
      ),
    );
  }
}