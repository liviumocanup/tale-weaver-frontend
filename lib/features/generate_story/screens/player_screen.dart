import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/generate_story/providers/fullscreen_state.dart';
import 'package:tale_weaver/features/generate_story/screens/video_player_screen.dart';
import 'package:tale_weaver/shared/widgets/app_title.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends StatefulWidget {
  final Uri videoUrl;

  const PlayerScreen({super.key, required this.videoUrl});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool _isLoading = true;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    try {
      _controller = VideoPlayerController.networkUrl(widget.videoUrl)
        ..initialize().then((_) {
          _isLoading = false;
          _controller.play();
          setState(() {});
        });
    } catch (e) {
      print('Error initializing video player: $e');
    }
  }

  Widget background(Widget child) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: csTitleString,
        middle: AppTitle(),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? background(const Center(child: CupertinoActivityIndicator()))
        : ChangeNotifierProvider<FullscreenState>(
            create: (_) => FullscreenState(),
            child: VideoPlayerScreen(controller: _controller),
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
