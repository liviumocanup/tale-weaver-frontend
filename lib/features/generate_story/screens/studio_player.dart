import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/story/domain/models/story.dart';
import 'package:tale_weaver/features/story/domain/repositories/story_repository.dart';
import 'package:tale_weaver/shared/widgets/app_title.dart';
import 'package:tale_weaver/utils/auth_util.dart';
import 'package:tale_weaver/utils/logger.dart';
import 'package:tale_weaver/utils/s3_util.dart';

import '../domain/models/story_creation_dto.dart';
import 'player_screen.dart';

@RoutePage(name: 'StudioPlayerRoute')
class StudioPlayer extends StatefulWidget {
  final String description;
  final String voiceId;

  const StudioPlayer({
    super.key,
    required this.description,
    required this.voiceId,
  });

  @override
  State<StudioPlayer> createState() => _StudioPlayerState();
}

class _StudioPlayerState extends State<StudioPlayer> {
  bool _isLoading = true;
  bool _isError = false;
  late Story _story;
  late Uri _videoUrl;

  @override
  void initState() {
    super.initState();
    _generateStory();
  }

  Future<void> _generateStory() async {
    try {
      String token = await AuthUtil.getBearerToken();

      StoryCreationDto storyCreation = StoryCreationDto(
        input: widget.description,
        voiceId: widget.voiceId,
        wordsPerStory: cWordsPerStory,
      );

      Story story = await StoryRepository().createStory(storyCreation, token);
      Uri uri = await S3Util.fetchResourceUrl(story.videoStorageKey);

      setState(() {
        _story = story;
        _videoUrl = uri;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _isError = true;
      });
      AppLogger.error('Failed to load story or image: $e');
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
                  Text(cCreatingStoryInfo,
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
            : PlayerScreen(videoUrl: _videoUrl, story: _story);
  }
}
