import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class CreateNewTabPage extends StatefulWidget {
  const CreateNewTabPage({super.key});

  @override
  _CreateNewTabPageState createState() => _CreateNewTabPageState();
}

class _CreateNewTabPageState extends State<CreateNewTabPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with a local video asset
    _controller = VideoPlayerController.asset('assets/videos/pluh.mp4')
      ..initialize().then((_) {
        setState(() {}); // When the video is loaded, rebuild the widget
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.03, left: size.width * 0.05, right: size.width * 0.05),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_controller.value.isInitialized) // Check if the video is loaded
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                CupertinoButton(
                  child: Text(_controller.value.isPlaying ? 'Pause' : 'Play'),
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Dispose the controller when the widget is disposed
  }
}
