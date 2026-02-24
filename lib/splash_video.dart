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
//       if (_controller.value.position >= _controller.value.duration &&
//           !_controller.value.isPlaying) {
//         Navigator.pushReplacementNamed(context, 'login');
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//           aspectRatio: _controller.value.aspectRatio,
//           child: VideoPlayer(_controller),
//         )
//             : const CircularProgressIndicator(color: Colors.white),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashVideoScreen extends StatefulWidget {
  const SplashVideoScreen({Key? key}) : super(key: key);

  @override
  State<SplashVideoScreen> createState() => _SplashVideoScreenState();
}

class _SplashVideoScreenState extends State<SplashVideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/splash.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration &&
          !_controller.value.isPlaying) {
        Navigator.pushReplacementNamed(context, 'login');
      }
    });
  }

  @override
  void dispose() {
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
            fit: BoxFit.cover, // 🔥 FULL SCREEN
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
