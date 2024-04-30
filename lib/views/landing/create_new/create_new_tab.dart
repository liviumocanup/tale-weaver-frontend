import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/shared/auth/rounded_button.dart';
import 'package:tale_weaver/shared/auth/rounded_input.dart';
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
      onToggleFullscreen: () =>
          setState(() {
            isFullscreen ? exitFullscreen() : enterFullscreen();
          }),
    );

    Widget videoPlayer = AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        alignment: Alignment.center,
        children: [
          VideoPlayer(_controller),
          if (_isControlsVisible) blurBackground,
          if (_isControlsVisible) videoControls,
        ],
      ),
    );

    Widget roundedVideoPlayer = ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: videoPlayer,
    );

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

    Widget titleInput = const RoundedInput(
      text: 'Title',
      radius: 5,
    );

    Widget doneBtn = RoundedButton(
      text: 'Done',
      press: () {},
      color: CupertinoColors.activeGreen,
      width: 125,
    );

    Widget regenerateBtn = CupertinoButton(
      child: const Row(
        children: [
          Icon(CupertinoIcons.refresh, color: cBlackColor),
          SizedBox(width: 5),
          Text('Regenerate', style: TextStyle(color: cBlackColor)),
        ],
      ),
      onPressed: () {},
    );

    void handleVerticalDragEnd(DragEndDetails details) {
      if (_startVerticalDragPosition != null) {
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
    }

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
          onVerticalDragStart: isFullscreen ? _handleVerticalDragStart : null,
          onVerticalDragEnd: isFullscreen ? handleVerticalDragEnd : null,
          child: Center(
            child: isVideoInitialized
                ? isFullscreen
                ? videoPlayer
                : Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25, vertical: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      roundedVideoPlayer,
                      const SizedBox(height: 40),
                      transcript,
                      const SizedBox(height: 20),
                      titleInput,
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          doneBtn,
                          regenerateBtn,
                        ],
                      ),
                    ]))
                : loadingIndicator,
          ),
        ),
      ),
    );
  }

  void _handleVerticalDragStart(DragStartDetails details) {
    _startVerticalDragPosition = details.globalPosition.dy;
  }

  @override
  void dispose() {
    _controller.dispose();
    _orientationManager.restoreDefaultOrientation();
    super.dispose();
  }
}
