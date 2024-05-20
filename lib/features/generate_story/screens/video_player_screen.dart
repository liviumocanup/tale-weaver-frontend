import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/create_new/widgets/video_controls.dart';
import 'package:tale_weaver/features/generate_story/domain/models/subtitle.dart';
import 'package:tale_weaver/features/story/domain/models/story.dart';
import 'package:tale_weaver/features/story/domain/models/video_segment.dart';
import 'package:video_player/video_player.dart';

import '../providers/fullscreen_state.dart';
import '../providers/orientation_manager.dart';

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

      if (_currentSubtitle != '') {
        setState(() {
          _currentSubtitle = '';
        });
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

    Widget title = const Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Title',
              style: TextStyle(
                  color: cBlackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(
            'Very cool widget title',
            style: TextStyle(color: cBlackColor, fontSize: 16),
          ),
        ],
      ),
    );

    Widget transcript = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Transcript',
              style: TextStyle(
                  color: cBlackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: size.height * 0.3),
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
