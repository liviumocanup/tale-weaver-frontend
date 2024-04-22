import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
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

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.link))
      ..initialize().then((_) {
        setState(() {});
      });
    _orientationManager = OrientationManager();
  }

  @override
  Widget build(BuildContext context) {
    var fullscreenState = Provider.of<FullscreenState>(context);

    return CupertinoPageScaffold(
      navigationBar: fullscreenState.isFullscreen
          ? null
          : const CupertinoNavigationBar(middle: Text('Video Example')),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => setState(() {
            _isControlsVisible = !_isControlsVisible;
          }),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : const CupertinoActivityIndicator(radius: 20.0),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: _isControlsVisible
                      ? VideoControls(
                          controller: _controller,
                          isFullscreen: fullscreenState.isFullscreen,
                          onToggleFullscreen: _toggleFullscreen,
                        )
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleFullscreen() {
    var fullscreenState = Provider.of<FullscreenState>(context, listen: false);
    setState(() {
      if (fullscreenState.isFullscreen) {
        _orientationManager.restoreDefaultOrientation();
        fullscreenState.exitFullscreen();
      } else {
        _orientationManager.enableLandscape();
        fullscreenState.enterFullscreen();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _orientationManager.restoreDefaultOrientation();
    super.dispose();
  }
}
