import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutPageState();
}

class _AboutPageState extends State<About> {
  final TextEditingController textController = TextEditingController();

  final List<Map<String, dynamic>> posts = [
    {
      'text':
      "Merveille Investments is a renowned international investment & consulting company registered in the UK, USA & UAE in 2019. It was founded by two ambitious bizwiz with a philanthropic mission to benefit the underprivileged. Operating across diversified industries globally while making a positive impact on humanity.\n\nOur primary objective is to offer strategic investment and consulting solutions that foster sustainable growth for businesses and stakeholders. The company strives to identify ingenious business ideas that generate profitable opportunities worldwide, while emphasizing a multidimensional development strategy to drive growth.\n\nMerveille Investments success grid focuses on excellence, ethics, and integrity. With the support of investors and stakeholders, Merveille Investments is confident in scaling new milestones of excellence for years to come.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: const Color(0xFF2C577E),
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              /// Title
              const Text(
                "Merveille Investments",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              /// About content card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  posts[0]['text'],
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
