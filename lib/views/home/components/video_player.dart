// import 'package:flutter/cupertino.dart';
// import 'package:video_player/video_player.dart';
//
// class NetworkVideoPlayer extends StatefulWidget {
//   final String videoUrl;
//
//   const NetworkVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   _NetworkVideoPlayerState createState() => _NetworkVideoPlayerState();
// }
//
// class _NetworkVideoPlayerState extends State<NetworkVideoPlayer> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(
//       Uri.parse(widget.videoUrl),
//       videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
//     );
//
//     _controller.addListener(() {
//       setState(() {});
//     });
//     _controller.setLooping(true);
//     _controller.initialize().then((_) => setState(() {}));
//     _controller.play();
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
//     return _controller.value.isInitialized
//         ? AspectRatio(
//       aspectRatio: _controller.value.aspectRatio,
//       child: VideoPlayer(_controller),
//     )
//         : const CupertinoActivityIndicator();
//   }
// }
