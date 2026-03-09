import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  static const Color black = Color(0xFF080808);
  static const Color gold = Color(0xFFD4AF37);

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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [
          // 🔥 Animated Gold Spotlight
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
                    colors: [gold.withOpacity(0.15), black],
                  ),
                ),
              );
            },
          ),

          // ✨ Subtle Gold Grid
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: GoldGridPainter(),
          ),

          // 👑 MAIN CONTENT
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 110),

                // 💎 Legendary Logo
                _legendaryLogo(),

                const SizedBox(height: 70),

                // 💎 Glassmorphism Panel
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: gold.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: gold.withOpacity(0.1),
                        blurRadius: 40,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _field("Email", controller: emailController),
                      const SizedBox(height: 25),
                      _field("Password", isPassword: true, controller: passwordController),
                      const SizedBox(height: 45),
                      _liquidGoldButton("ACCESS PORTAL"),
                      const SizedBox(height: 25),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        child: const Text(
                          "Request Private Access",
                          style: TextStyle(color: gold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 🔐 FIREBASE LOGIN BUTTON WITHOUT EMAIL VERIFICATION
  Widget _liquidGoldButton(String text) {
    return GestureDetector(
      onTap: () async {
        try {
          // UserCredential userCredential = await FirebaseAuth.instance
          //     .signInWithEmailAndPassword(
          //   email: emailController.text.trim(),
          //   password: passwordController.text.trim(),
          // );

          // Navigate directly to dashboard
          // Navigator.pushReplacementNamed(context, 'dashboard');
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

// Do NOT navigate manually
// AuthGate will automatically redirect

        } on FirebaseAuthException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.black,
              content: Text(
                e.message ?? "Login failed",
                style: const TextStyle(color: gold),
              ),
            ),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.black,
              content: Text(
                "Something went wrong",
                style: TextStyle(color: gold),
              ),
            ),
          );
        }
      },
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFFFF8DC),
              Color(0xFFD4AF37),
              Color(0xFFB8902E),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(6, 10),
              blurRadius: 20,
            ),
          ],
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.transparent,
          highlightColor: Colors.white,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _field(String hint, {bool isPassword = false, TextEditingController? controller}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        filled: true,
        fillColor: Colors.black.withOpacity(0.6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: gold.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: gold),
        ),
      ),
    );
  }

  /// ⭐ Legendary Logo with Full Effects
  Widget _legendaryLogo() {
    return SizedBox(
      width: 220,
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Pulsing Halo Glow
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              double scale = 1 + 0.05 * sin(_controller.value * 2 * pi);
              return Transform.scale(
                scale: scale,
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: gold.withOpacity(0.3), blurRadius: 50, spreadRadius: 10),
                      BoxShadow(color: gold.withOpacity(0.15), blurRadius: 80, spreadRadius: 20),
                    ],
                  ),
                ),
              );
            },
          ),

          // Rotating Liquid Gold Ring
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              return Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: CustomPaint(
                  size: const Size(200, 200),
                  painter: LiquidGoldPainter(animationValue: _controller.value),
                ),
              );
            },
          ),

          // Floating Particles
          CustomPaint(
            size: const Size(220, 220),
            painter: ParticlePainter(),
          ),

          // Logo Container
          Container(
            width: 140,
            height: 140,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: black,
            ),
            padding: const EdgeInsets.all(20),
            child: Shimmer.fromColors(
              baseColor: gold,
              highlightColor: Colors.white,
              child: Image.asset("assets/Merveille_Logo.png"),
            ),
          ),
        ],
      ),
    );
  }
}

/// ✨ Gold Grid
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

/// 🌟 Floating Gold Particles
class ParticlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.amber.withOpacity(0.2);
    final center = Offset(size.width / 2, size.height / 2);
    final random = Random(42);

    for (int i = 0; i < 15; i++) {
      double angle = random.nextDouble() * 2 * pi;
      double radius = 80 + random.nextDouble() * 40;
      Offset pos = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
      canvas.drawCircle(pos, random.nextDouble() * 3 + 1, paint);
    }
  }

  @override
  bool shouldRepaint(_) => true;
}

/// 🌟 Advanced Liquid Gold Sweep
class LiquidGoldPainter extends CustomPainter {
  final double animationValue;
  LiquidGoldPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final gradient = SweepGradient(
      startAngle: 0,
      endAngle: 2 * pi,
      colors: [
        Colors.transparent,
        const Color(0xFFD4AF37).withOpacity(0.7),
        Colors.white,
        const Color(0xFFD4AF37),
        Colors.transparent,
      ],
      stops: [
        0.0,
        0.2 + 0.2 * sin(animationValue * 2 * pi),
        0.5,
        0.8 - 0.2 * sin(animationValue * 2 * pi),
        1.0
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
  bool shouldRepaint(_) => true;
}