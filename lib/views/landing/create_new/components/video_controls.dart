import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:video_player/video_player.dart';

class VideoControls extends StatefulWidget {
  final VideoPlayerController controller;
  final bool isFullscreen;
  final VoidCallback onToggleFullscreen;

  const VideoControls({
    Key? key,
    required this.controller,
    required this.isFullscreen,
    required this.onToggleFullscreen,
  }) : super(key: key);

  @override
  State<VideoControls> createState() => _VideoControlsState();
}

class _VideoControlsState extends State<VideoControls> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final position = widget.controller.value.position;
    final duration = widget.controller.value.duration;

    Future<void> pause() => widget.controller.pause();
    Future<void> play() => widget.controller.play();

    Widget rewindBtn = CupertinoButton(
      child: const Icon(
        size: 30.0,
        color: cAlwaysWhiteColor,
        CupertinoIcons.gobackward_10,
      ),
      onPressed: () =>
          widget.controller.seekTo(position - const Duration(seconds: 10)),
    );

    Widget playPauseBtn = CupertinoButton(
      child: Icon(
        size: 45.0,
        color: cAlwaysWhiteColor,
        widget.controller.value.isPlaying
            ? CupertinoIcons.pause_fill
            : CupertinoIcons.play_fill,
      ),
      onPressed: () {
        setState(() {
          widget.controller.value.isPlaying ? pause() : play();
        });
      },
    );

    Widget forwardBtn = CupertinoButton(
        child: const Icon(
          size: 30.0,
          color: cAlwaysWhiteColor,
          CupertinoIcons.goforward_10,
        ),
        onPressed: () =>
            widget.controller.seekTo(position + const Duration(seconds: 10)));

    Widget fullscreenBtn = CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: widget.onToggleFullscreen,
      child: Icon(
          color: cAlwaysWhiteColor,
          widget.isFullscreen
              ? CupertinoIcons.fullscreen_exit
              : CupertinoIcons.fullscreen),
    );

    Widget progressText = RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: formatDuration(position),
            style: const TextStyle(
                color: cAlwaysWhiteColor), // First duration in white
          ),
          TextSpan(
            text: ' / ${formatDuration(duration)}',
            style:
                const TextStyle(color: cGrayColor), // Style for the separator
          ),
        ],
      ),
    );

    return Positioned.fill(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: rewindBtn,
                  ),
                  playPauseBtn,
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: forwardBtn,
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                VideoProgressIndicator(widget.controller, allowScrubbing: true),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    progressText,
                    fullscreenBtn,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    if (duration.inHours == 0) {
      return "$minutes:$seconds";
    } else {
      return "$hours:$minutes:$seconds";
    }
  }
}
