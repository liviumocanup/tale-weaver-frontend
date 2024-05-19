import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/generate_story/domain/models/story_creation_dto.dart';
import 'package:tale_weaver/features/generate_story/screens/player_screen.dart';
import 'package:tale_weaver/features/story/domain/models/story.dart';
import 'package:tale_weaver/features/story/domain/repositories/story_repository.dart';
import 'package:tale_weaver/shared/widgets/app_title.dart';
import 'package:tale_weaver/utils/auth_util.dart';
import 'package:tale_weaver/utils/s3_util.dart';

@RoutePage(name: 'StudioPlayerRoute')
class StudioPlayer extends StatefulWidget {
  final String description;

  const StudioPlayer({super.key, required this.description});

  @override
  State<StudioPlayer> createState() => _StudioPlayerState();
}

class _StudioPlayerState extends State<StudioPlayer> {
  bool _isLoading = true;
  late Uri _videoUrl;

  @override
  void initState() {
    super.initState();
    _generateStory();
  }

  Future<void> _generateStory() async {
    try {
      String token = await AuthUtil.getBearerToken();

      // TODO: Change to actual voiceId
      StoryCreationDto storyCreation = StoryCreationDto(
        input: widget.description,
        voiceId: '2EiwWnXFnvU5JabPnv8n',
        wordsPerStory: 10,
      );

      Story story = await StoryRepository().createStory(storyCreation, token);
      Uri uri = await S3Util.fetchResourceUrl(story.videoStorageKey);

      setState(() {
        _videoUrl = uri;
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to load story or image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CupertinoPageScaffold(
            backgroundColor: CupertinoColors.systemGroupedBackground,
            navigationBar: CupertinoNavigationBar(
              previousPageTitle: csTitleString,
              middle: AppTitle(),
            ),
            child: Center(child: CupertinoActivityIndicator()),
          )
        : PlayerScreen(videoUrl: _videoUrl);
  }
}
