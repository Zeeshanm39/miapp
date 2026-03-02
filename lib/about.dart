// import 'package:flutter/material.dart';
//
// class About extends StatefulWidget {
//   const About({super.key});
//
//   @override
//   State<About> createState() => _AboutPageState();
// }
//
// class _AboutPageState extends State<About> {
//   final TextEditingController textController = TextEditingController();
//
//   final List<Map<String, dynamic>> posts = [
//     {
//       'text':
//       "Merveille Investments is a renowned international investment & consulting company registered in the UK, USA & UAE in 2019. It was founded by two ambitious bizwiz with a philanthropic mission to benefit the underprivileged. Operating across diversified industries globally while making a positive impact on humanity.\n\nOur primary objective is to offer strategic investment and consulting solutions that foster sustainable growth for businesses and stakeholders. The company strives to identify ingenious business ideas that generate profitable opportunities worldwide, while emphasizing a multidimensional development strategy to drive growth.\n\nMerveille Investments success grid focuses on excellence, ethics, and integrity. With the support of investors and stakeholders, Merveille Investments is confident in scaling new milestones of excellence for years to come.",
//     }
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("About Us"),
//         backgroundColor: const Color(0xFF2C577E),
//         foregroundColor: Colors.white,
//       ),
//       body: Container(
//         width: double.infinity,
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
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 10),
//
//               /// Title
//               const Text(
//                 "Merveille Investments",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//
//               /// About content card
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.9),
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black26,
//                       blurRadius: 10,
//                       offset: Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: Text(
//                   posts[0]['text'],
//                   style: const TextStyle(
//                     fontSize: 15,
//                     color: Colors.black87,
//                     height: 1.6,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutPageState();
}

class _AboutPageState extends State<About>
    with SingleTickerProviderStateMixin {

  static const Color black = Color(0xFF080808);
  static const Color gold = Color(0xFFD4AF37);

  late AnimationController _controller;

  final String aboutText =
      "Merveille Investments is a renowned international investment & consulting "
      "company registered in the UK, USA & UAE in 2019. It was founded by two "
      "ambitious visionaries with a philanthropic mission to benefit the "
      "underprivileged.\n\n"
      "Operating across diversified industries globally, the company delivers "
      "strategic investment and consulting solutions that foster sustainable "
      "growth for businesses and stakeholders.\n\n"
      "Merveille Investments focuses on excellence, ethics, and integrity. With "
      "the continued support of investors and partners, the company is poised "
      "to scale new milestones of global excellence.";

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
      body: Stack(
        children: [

          /// 🔥 Animated Gold Spotlight Background
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
                    radius: 1.5,
                    colors: [
                      gold.withOpacity(0.15),
                      black,
                    ],
                  ),
                ),
              );
            },
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 🔙 Back Button
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: gold),
                    onPressed: () => Navigator.pop(context),
                  ),

                  const SizedBox(height: 20),

                  /// ✨ Shimmer Title
                  Shimmer.fromColors(
                    baseColor: gold,
                    highlightColor: Colors.white,
                    child: const Text(
                      "About Merveille",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Investments & Consulting",
                    style: TextStyle(
                      color: Colors.white54,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// 🏆 Glassmorphism About Card
                  Container(
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
                    child: Text(
                      aboutText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        height: 1.8,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  /// 🌍 Footer
                  Center(
                    child: Text(
                      "© Merveille Investments",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        letterSpacing: 1.5,
                      ),
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
}