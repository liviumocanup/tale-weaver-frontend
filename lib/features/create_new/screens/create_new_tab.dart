import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/shared/widgets/rounded_button.dart';
import 'package:tale_weaver/features/create_new/domain/repository/aws_sign.dart';
import 'package:video_player/video_player.dart';

import '../domain/repository/send_request.dart';
import '../../generate_story/providers/fullscreen_state.dart';
import '../../generate_story/providers/orientation_manager.dart';
import '../widgets/video_controls.dart';

class CreateNewStoryTabPage extends StatefulWidget {
  final String description;

  const CreateNewStoryTabPage({
    super.key,
    required this.description,
  });

  @override
  State<CreateNewStoryTabPage> createState() => _CreateNewStoryTabPageState();
}

class _CreateNewStoryTabPageState extends State<CreateNewStoryTabPage> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;
  bool _isControlsVisible = false;
  late OrientationManager _orientationManager;
  double? _startVerticalDragPosition;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
    _orientationManager = OrientationManager();
  }

  Future<String> _getSignedUrl() async {
    try {
      await credentialsAws();

      var psUrl = await generateVideo(widget.description, 10);
      print(psUrl);
      return psUrl;
    } catch (e) {
      print('Failed to generate presigned URL: $e');
      return "";
    }
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      var url = await _getSignedUrl();
      _controller = VideoPlayerController.networkUrl(Uri.parse(url.toString()))
        ..initialize().then((_) {
          _isVideoInitialized = true;
          _controller.play();
          setState(() {});
        });
    } catch (e) {
      print('Error initializing video player: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var fullscreenState = Provider.of<FullscreenState>(context);
    bool isVideoInitialized =
        _isVideoInitialized ? _controller.value.isInitialized : false;
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

    Widget titleInput = const CupertinoButton(
      onPressed: null,
      child: Text('Title', style: TextStyle(color: cBlackColor)),
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
        if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
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
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            VideoPlayer(_controller),
                            if (_isControlsVisible) blurBackground,
                            if (_isControlsVisible)
                              VideoControls(
                                controller: _controller,
                                isFullscreen: isFullscreen,
                                onToggleFullscreen: () => setState(() {
                                  isFullscreen
                                      ? exitFullscreen()
                                      : enterFullscreen();
                                }),
                              ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      VideoPlayer(_controller),
                                      if (_isControlsVisible) blurBackground,
                                      if (_isControlsVisible)
                                        VideoControls(
                                          controller: _controller,
                                          isFullscreen: isFullscreen,
                                          onToggleFullscreen: () =>
                                              setState(() {
                                            isFullscreen
                                                ? exitFullscreen()
                                                : enterFullscreen();
                                          }),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
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
