import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/create_new/widgets/video_controls.dart';
import 'package:tale_weaver/shared/widgets/app_title.dart';
import 'package:video_player/video_player.dart';

import '../providers/fullscreen_state.dart';
import '../providers/orientation_manager.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoPlayerController controller;

  const VideoPlayerScreen({super.key, required this.controller});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final OrientationManager _orientationManager = OrientationManager();
  bool _isControlsVisible = false;

  Widget transcript = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Transcript',
          style: TextStyle(color: cBlackColor, fontSize: 20)),
      const SizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
          color: cBlackColor.withOpacity(0.03),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Unnerved, Sarah and Jake hurried towards the looming windmill on the edge of town. '
                'Its massive blades creaked ominously, a stark contrast to the serenity of the surrounding countryside.'
                'They knew they had to reach it before nightfall, ...',
            style: TextStyle(color: cBlackColor),
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    var fullscreenState = Provider.of<FullscreenState>(context);
    bool isFullscreen = fullscreenState.isFullscreen;
    Size size = MediaQuery.of(context).size;

    void exitFullscreen() {
      _orientationManager.restoreDefaultOrientation();
      fullscreenState.exitFullscreen();
    }

    void enterFullscreen() {
      _orientationManager.enableLandscape();
      fullscreenState.enterFullscreen();
    }

    Widget blurBackground = Container(
      color: cAlwaysBlackColor.withOpacity(0.4),
    );

    Widget videoControls = VideoControls(
      controller: widget.controller,
      isFullscreen: isFullscreen,
      onToggleFullscreen: () => setState(() {
        isFullscreen ? exitFullscreen() : enterFullscreen();
      }),
    );

    return CupertinoPageScaffold(
      backgroundColor: isFullscreen
          ? cAlwaysBlackColor
          : CupertinoColors.systemGroupedBackground,
      navigationBar: isFullscreen
          ? null
          : const CupertinoNavigationBar(
              previousPageTitle: csTitleString,
              middle: AppTitle(),
            ),
      child: GestureDetector(
        onTap: () {
          if (widget.controller.value.isInitialized) {
            setState(() {
              _isControlsVisible = !_isControlsVisible;
            });
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width,
                height: isFullscreen ? size.height : null,
                child: AspectRatio(
                  aspectRatio: widget.controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      VideoPlayer(widget.controller),
                      if (_isControlsVisible) blurBackground,
                      if (_isControlsVisible) videoControls,
                    ],
                  ),
                ),
              ),
              isFullscreen ? Container() : transcript,
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _orientationManager.restoreDefaultOrientation();
    super.dispose();
  }
}
