import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/generate_story/providers/fullscreen_state.dart';
import 'package:tale_weaver/features/generate_story/screens/video_player_screen.dart';
import 'package:tale_weaver/features/story/domain/models/story.dart';
import 'package:tale_weaver/shared/widgets/app_title.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends StatefulWidget {
  final Uri videoUrl;
  final Story story;

  const PlayerScreen({super.key, required this.videoUrl, required this.story});

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

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CupertinoPageScaffold(
            backgroundColor: cGrayBackground,
            navigationBar: CupertinoNavigationBar(
              backgroundColor: cGrayBackground,
              middle: AppTitle(),
            ),
            child: Center(
              child: CupertinoActivityIndicator(radius: 15, color: cBlackColor),
            ),
          )
        : ChangeNotifierProvider<FullscreenState>(
            create: (_) => FullscreenState(),
            child:
                VideoPlayerScreen(controller: _controller, story: widget.story),
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
