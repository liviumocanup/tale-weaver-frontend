import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tale_weaver/constants.dart';
import 'package:video_player/video_player.dart';

import 'components/fullscreen_state.dart';
import 'components/orientation_manager.dart';
import 'components/video_controls.dart';

class CreateNewStoryTabPage extends StatefulWidget {
  final String link;

  const CreateNewStoryTabPage({
    super.key,
    required this.link,
  });

  @override
  State<CreateNewStoryTabPage> createState() => _CreateNewStoryTabPageState();
}

class _CreateNewStoryTabPageState extends State<CreateNewStoryTabPage> {
  late VideoPlayerController _controller;
  bool _isControlsVisible = false;
  late OrientationManager _orientationManager;
  double? _startVerticalDragPosition;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
    _orientationManager = OrientationManager();
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.link))
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    var fullscreenState = Provider.of<FullscreenState>(context);
    bool isVideoInitialized = _controller.value.isInitialized;
    bool isFullscreen = fullscreenState.isFullscreen;

    Widget loadingIndicator = const CupertinoActivityIndicator(
      radius: 20.0,
      color: cBlackColor,
    );

    Widget blurBackground = Container(
      color: cAlwaysBlackColor.withOpacity(0.4),
    );

    void exitFullscreen() {
      _orientationManager.restoreDefaultOrientation();
      fullscreenState.exitFullscreen();
    }

    void enterFullscreen() {
      _orientationManager.enableLandscape();
      fullscreenState.enterFullscreen();
    }

    Widget videoControls = VideoControls(
      controller: _controller,
      isFullscreen: isFullscreen,
      onToggleFullscreen: () => setState(() {
        isFullscreen ? exitFullscreen() : enterFullscreen();
      }),
    );

    return CupertinoPageScaffold(
      backgroundColor: isFullscreen ? cAlwaysBlackColor : null,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (isVideoInitialized) {
              setState(() {
                _isControlsVisible = !_isControlsVisible;
              });
            }
          },
          onVerticalDragStart: (details) {
            _startVerticalDragPosition = details.globalPosition.dy;
          },
          onVerticalDragEnd: (details) {
            if (_startVerticalDragPosition != null && isFullscreen) {
              double dragStartPosition = _startVerticalDragPosition!;
              double screenHeight = MediaQuery.of(context).size.height;
              if (dragStartPosition / screenHeight < 0.1) {
                return;
              }
              if (details.primaryVelocity != null &&
                  details.primaryVelocity! > 0) {
                exitFullscreen();
              }
            }
          },
          child: Center(
            child: isVideoInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        VideoPlayer(_controller),
                        if (_isControlsVisible) blurBackground,
                        if (_isControlsVisible) videoControls,
                      ],
                    ),
                  )
                : loadingIndicator,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _orientationManager.restoreDefaultOrientation();
    super.dispose();
  }
}
