// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
// import 'package:tale_weaver/constants.dart';
// import 'package:tale_weaver/views/landing/create_new/components/fullscreen_state.dart';
// import 'package:tale_weaver/views/landing/create_new/components/orientation_manager.dart';
// import 'package:tale_weaver/views/landing/create_new/components/video_controls.dart';
// import 'package:video_player/video_player.dart';
//
// class CustomVideoPlayer extends StatefulWidget {
//   final String link;
//
//   const CustomVideoPlayer({
//     super.key,
//     required this.link,
//   });
//
//   @override
//   State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
// }
//
// class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
//   late VideoPlayerController _controller;
//   late OrientationManager _orientationManager;
//   bool _isControlsVisible = false;
//   double? _startVerticalDragPosition;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayer();
//     _orientationManager = OrientationManager();
//   }
//
//   void _initializeVideoPlayer() {
//     _controller = VideoPlayerController.networkUrl(Uri.parse(widget.link))
//       ..initialize().then((_) {
//         _controller.play();
//         setState(() {});
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var fullscreenState = Provider.of<FullscreenState>(context);
//     bool isVideoInitialized = _controller.value.isInitialized;
//     bool isFullscreen = fullscreenState.isFullscreen;
//
//     void exitFullscreen() {
//       _orientationManager.restoreDefaultOrientation();
//       fullscreenState.exitFullscreen();
//     }
//
//     void enterFullscreen() {
//       _orientationManager.enableLandscape();
//       fullscreenState.enterFullscreen();
//     }
//
//     Widget blurBackground = Container(
//       color: cAlwaysBlackColor.withOpacity(0.4),
//     );
//
//     Widget videoControls = VideoControls(
//       controller: _controller,
//       isFullscreen: isFullscreen,
//       onToggleFullscreen: () => setState(() {
//         isFullscreen ? exitFullscreen() : enterFullscreen();
//       }),
//     );
//
//     void handleVerticalDragStart(DragStartDetails details) {
//       _startVerticalDragPosition = details.globalPosition.dy;
//     }
//
//     void handleVerticalDragEnd(DragEndDetails details) {
//       if (_startVerticalDragPosition != null) {
//         double dragStartPosition = _startVerticalDragPosition!;
//         double screenHeight = MediaQuery.of(context).size.height;
//         if (dragStartPosition / screenHeight < 0.1) {
//           return;
//         }
//         if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
//           exitFullscreen();
//         }
//       }
//     }
//
//     Widget videoPlayer = AspectRatio(
//       aspectRatio: _controller.value.aspectRatio,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           VideoPlayer(_controller),
//           if (_isControlsVisible) blurBackground,
//           if (_isControlsVisible) videoControls,
//         ],
//       ),
//     );
//
//     return CupertinoPageScaffold(
//       backgroundColor: isFullscreen ? cAlwaysBlackColor : null,
//       child: SafeArea(
//         child: GestureDetector(
//           onTap: () {
//             if (isVideoInitialized) {
//               setState(() {
//                 _isControlsVisible = !_isControlsVisible;
//               });
//             }
//           },
//           onVerticalDragStart: isFullscreen ? handleVerticalDragStart : null,
//           onVerticalDragEnd: isFullscreen ? handleVerticalDragEnd : null,
//           child: Center(
//             child: videoPlayer,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _orientationManager.restoreDefaultOrientation();
//     super.dispose();
//   }
// }
