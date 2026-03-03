// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class SplashVideoScreen extends StatefulWidget {
//   const SplashVideoScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashVideoScreen> createState() => _SplashVideoScreenState();
// }
//
// class _SplashVideoScreenState extends State<SplashVideoScreen> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = VideoPlayerController.asset('assets/splash.mp4')
//       ..initialize().then((_) {
//         setState(() {});
//         _controller.play();
//       });
//
//     _controller.addListener(() {
//       if (_controller.value.position >= _controller.value.duration) {
//         final user = FirebaseAuth.instance.currentUser;
//
//         Navigator.pushReplacementNamed(
//           context,
//           user == null ? 'login' : 'dashboard',
//         );
//       }
//     });
//
//   //   _controller.addListener(() {
//   //     if (_controller.value.position >= _controller.value.duration &&
//   //         !_controller.value.isPlaying) {
//   //       Navigator.pushReplacementNamed(context, 'login');
//   //     }
//   //   });
//   // }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       body: Center(
// //         child: _controller.value.isInitialized
// //             ? AspectRatio(
// //           aspectRatio: _controller.value.aspectRatio,
// //           child: VideoPlayer(_controller),
// //         )
// //             : const CircularProgressIndicator(color: Colors.white),
// //       ),
// //     );
// //   }
// // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: _controller.value.isInitialized
//           ? Stack(
//         fit: StackFit.expand,
//         children: [
//           FittedBox(
//             fit: BoxFit.cover, // 🔥 FULL SCREEN
//             child: SizedBox(
//               width: _controller.value.size.width,
//               height: _controller.value.size.height,
//               child: VideoPlayer(_controller),
//             ),
//           ),
//         ],
//       )
//           : const Center(
//         child: CircularProgressIndicator(color: Colors.white),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_gate.dart';

class SplashVideoScreen extends StatefulWidget {
  const SplashVideoScreen({super.key});

  @override
  State<SplashVideoScreen> createState() => _SplashVideoScreenState();
}

class _SplashVideoScreenState extends State<SplashVideoScreen> {
  late VideoPlayerController _controller;
  bool _navigated = false; // 🔒 NAVIGATION GUARD

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/splash.mp4')
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() {});
        _controller.play();
      });

    _controller.addListener(_videoListener);
  }

  void _videoListener() {
    if (!_controller.value.isInitialized) return;

    if (_controller.value.position >= _controller.value.duration &&
        !_navigated) {
      _navigated = true;

      /// 🚀 SAFE NAVIGATION AFTER FRAME
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        final user = FirebaseAuth.instance.currentUser;

        // Navigator.pushReplacementNamed(
        //   context,
        //   user == null ? 'login' : 'dashboard',
        // );
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (_) => const AuthGate()),
      //   );
        Navigator.pushReplacementNamed(context, 'auth');
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller.value.isInitialized
          ? Stack(
        fit: StackFit.expand,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          ),
        ],
      )
          : const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}