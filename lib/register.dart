  import 'dart:math';
  import 'package:flutter/material.dart';
  import 'package:shimmer/shimmer.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';

  class MyRegister extends StatefulWidget {
    const MyRegister({super.key});

    @override
    State<MyRegister> createState() => _MyRegisterState();
  }

  class _MyRegisterState extends State<MyRegister> with SingleTickerProviderStateMixin {
    /// Controllers
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    late AnimationController _controller;
    bool isLoading = false;

    static const Color luxuryBlack = Color(0xFF0F0F0F);
    static const Color cardBlack = Color(0xFF1C1C1C);
    static const Color gold = Color(0xFFD4AF37);

    @override
    void initState() {
      super.initState();
      _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 8))..repeat();
    }

    @override
    void dispose() {
      fullNameController.dispose();
      emailController.dispose();
      passwordController.dispose();
      _controller.dispose();
      super.dispose();
    }

    /// 🔥 Register Logic
    Future<void> _register() async {
      if (fullNameController.text.trim().isEmpty ||
          emailController.text.trim().isEmpty ||
          passwordController.text.trim().length < 6) {
        _showSnack("Please fill all fields (min password 6 chars)");
        return;
      }

      try {
        setState(() => isLoading = true);

        // 1️⃣ Create Firebase user
        final userCredential = await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        final user = userCredential.user!;

        // 2️⃣ Update display name (so it shows in Firebase Auth)
        await user.updateDisplayName(fullNameController.text.trim());

        // 3️⃣ Reload user to ensure displayName is updated in the console
        await user.reload();

        // 4️⃣ Send verification email
        // await user.sendEmailVerification();

        // 5️⃣ Save user document in Firestore
        await firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'email': user.email,
          'name': fullNameController.text.trim(),
          'role': 'user',
          // 'emailVerified': false,
          'isActive': true,
          'createdAt': FieldValue.serverTimestamp(),
          'lastLogin': FieldValue.serverTimestamp(),
        });

        _showSnack("Account created! Verify your email before login.");
        Navigator.pushReplacementNamed(context, 'login');

      } on FirebaseAuthException catch (e) {
        _showSnack(e.message ?? "Registration failed");
      } catch (e) {
        _showSnack("Something went wrong");
      } finally {
        setState(() => isLoading = false);
      }
    }

    void _showSnack(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: luxuryBlack,
        appBar: AppBar(
          backgroundColor: luxuryBlack,
          elevation: 0,
          iconTheme: const IconThemeData(color: gold),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              _legendaryLogo(),
              const SizedBox(height: 20),

              Shimmer.fromColors(
                baseColor: gold,
                highlightColor: Colors.white,
                child: const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// 🌟 Glassmorphism Panel
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(45)),
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
                    _goldField("Full Name", controller: fullNameController),
                    const SizedBox(height: 20),
                    _goldField("Email", controller: emailController),
                    const SizedBox(height: 20),
                    _goldField("Password", controller: passwordController, isPassword: true),
                    const SizedBox(height: 40),

                    isLoading
                        ? const CircularProgressIndicator(color: gold)
                        : _luxuryGoldButton("SIGN UP", _register),

                    const SizedBox(height: 20),

                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
                      child: const Text(
                        "Already have an account? Sign In",
                        style: TextStyle(color: gold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    /// ⭐ Legendary Logo with Particles & Liquid Gold
    Widget _legendaryLogo() {
      return SizedBox(
        width: 220,
        height: 220,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Pulsing Glow
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
            // Particles
            CustomPaint(size: const Size(220, 220), painter: ParticlePainter()),
            // Logo
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: luxuryBlack,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.6), blurRadius: 25, spreadRadius: 5),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Shimmer.fromColors(
                  baseColor: gold,
                  highlightColor: Colors.white,
                  period: const Duration(seconds: 3),
                  child: Image.asset(
                    "assets/Merveille_Logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    /// Input Field
    Widget _goldField(String hint, {bool isPassword = false, required TextEditingController controller}) {
      return TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38),
          filled: true,
          fillColor: cardBlack,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: gold),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white24),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
    }

    /// Luxury Gold Button
    Widget _luxuryGoldButton(String text, VoidCallback onPressed) {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            gradient: const LinearGradient(
              colors: [Color(0xFFFFF3B0), Color(0xFFD4AF37), Color(0xFFB8902E)],
            ),
            boxShadow: const [
              BoxShadow(color: Colors.black54, offset: Offset(4, 6), blurRadius: 10),
            ],
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.transparent,
            highlightColor: Colors.white70,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  /// Floating Particles
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
    bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  }

  /// Liquid Gold Sweep
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

      canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2 - 8, paint);
    }

    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  }