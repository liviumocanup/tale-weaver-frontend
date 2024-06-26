import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/story/domain/models/story.dart';
import 'package:tale_weaver/features/story/domain/models/video_segment.dart';
import 'package:tale_weaver/features/story/domain/repositories/story_repository.dart';
import 'package:tale_weaver/utils/auth_util.dart';
import 'package:video_player/video_player.dart';

import '../domain/models/subtitle.dart';
import '../providers/fullscreen_state.dart';
import '../providers/orientation_manager.dart';
import '../widgets/video_controls.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoPlayerController controller;
  final Story story;

  const VideoPlayerScreen({
    super.key,
    required this.controller,
    required this.story,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final OrientationManager _orientationManager = OrientationManager();
  bool _isControlsVisible = false;
  late Timer _timer;
  late List<VideoSegment> _subtitles;
  final List<Subtitle> _sortedSubtitles = [];
  String _currentSubtitle = '';

  @override
  void initState() {
    super.initState();
    _subtitles = widget.story.videoSegments;
    _prepareSubtitles();
    _startTimer();
  }

  void _prepareSubtitles() {
    _subtitles.sort((a, b) => a.ordinal.compareTo(b.ordinal));

    int cumulativeStart = 0;
    for (var subtitle in _subtitles) {
      _sortedSubtitles.add(Subtitle(
        text: subtitle.text,
        start: cumulativeStart,
        duration: subtitle.duration,
      ));
      cumulativeStart += subtitle.duration;
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 0), (timer) {
      final currentPosition = widget.controller.value.position.inSeconds;

      for (var subtitle in _sortedSubtitles) {
        int start = subtitle.start;
        int end = start + subtitle.duration;

        if (currentPosition >= start && currentPosition < end) {
          if (_currentSubtitle != subtitle.text) {
            setState(() {
              _currentSubtitle = subtitle.text;
            });
          }
          return;
        }
      }
    });
  }

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
      onToggleControls: () => setState(() {
        _isControlsVisible = !_isControlsVisible;
      }),
      onMinimize: () => setState(() {
        isFullscreen ? exitFullscreen() : Navigator.of(context).pop();
      }),
    );

    Future<void> saveTitle(String newValue) async {
      setState(() {
        widget.story.title = newValue;
      });
      String token = await AuthUtil.getBearerToken();
      StoryRepository().updateStory(widget.story.id, widget.story.title, token);
    }

    void editTitle() {
      TextEditingController titleController =
          TextEditingController(text: widget.story.title);

      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text(cEditTitleString),
            content: CupertinoTextField(
              controller: titleController,
              onSubmitted: (newValue) {
                saveTitle(newValue);
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text(cSaveString),
                onPressed: () {
                  saveTitle(titleController.text);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    Widget title = Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            cTitleString,
            style: TextStyle(
              color: cBlackColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.story.title,
                  style: const TextStyle(color: cBlackColor, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  editTitle();
                },
                child: const Icon(
                  CupertinoIcons.pencil,
                  color: cBlackColor,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    Widget transcript = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(cTranscriptString,
              style: TextStyle(
                  color: cBlackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: size.height * 0.205),
            child: Container(
              decoration: BoxDecoration(
                color: cBlackColor.withOpacity(0.03),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: cGrayColor.withOpacity(0.1)),
              ),
              child: CupertinoScrollbar(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      _currentSubtitle,
                      style: const TextStyle(color: cBlackColor, fontSize: 15),
                      softWrap: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return CupertinoPageScaffold(
      backgroundColor: isFullscreen ? cAlwaysBlackColor : cGrayBackground,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: ListView(
          children: [
            SizedBox(
              width: size.width,
              height: isFullscreen ? size.height : null,
              child: GestureDetector(
                onTap: () {
                  if (widget.controller.value.isInitialized) {
                    setState(() {
                      _isControlsVisible = !_isControlsVisible;
                    });
                  }
                },
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
            ),
            isFullscreen ? Container() : title,
            isFullscreen ? Container() : transcript,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _orientationManager.restoreDefaultOrientation();
    super.dispose();
  }
}
