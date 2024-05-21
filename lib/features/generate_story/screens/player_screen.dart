import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/story/domain/models/story.dart';
import 'package:tale_weaver/shared/widgets/app_title.dart';
import 'package:tale_weaver/utils/logger.dart';
import 'package:video_player/video_player.dart';

import '../providers/fullscreen_state.dart';
import 'video_player_screen.dart';

class PlayerScreen extends StatefulWidget {
  final Uri videoUrl;
  final Story story;

  const PlayerScreen({super.key, required this.videoUrl, required this.story});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool _isLoading = true;
  bool _isError = false;
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
      setState(() {
        _isLoading = false;
        _isError = true;
      });
      AppLogger.error('Error initializing video player: $e');
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(cLoadingVideoInfo,
                      style: TextStyle(
                        color: cGrayColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 10),
                  CupertinoActivityIndicator(radius: 15, color: cBlackColor),
                ],
              ),
            ),
          )
        : _isError
            ? const CupertinoPageScaffold(
                backgroundColor: cGrayBackground,
                navigationBar: CupertinoNavigationBar(
                  backgroundColor: cGrayBackground,
                  middle: AppTitle(),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.xmark_circle_fill,
                          color: cGrayColor, size: 50),
                      SizedBox(height: 20),
                      Text(cErrorCreatingStory,
                          style: TextStyle(
                            color: cGrayColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              )
            : ChangeNotifierProvider<FullscreenState>(
                create: (_) => FullscreenState(),
                child: VideoPlayerScreen(
                    controller: _controller, story: widget.story),
              );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
