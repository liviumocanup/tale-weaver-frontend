import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/generate_story/screens/player_screen.dart';
import 'package:tale_weaver/features/story/domain/models/story.dart';
import 'package:tale_weaver/features/story/domain/repositories/story_repository.dart';
import 'package:tale_weaver/shared/widgets/app_title.dart';
import 'package:tale_weaver/utils/auth_util.dart';

@RoutePage(name: 'StoryViewRoute')
class StoryViewScreen extends StatefulWidget {
  final String id;

  const StoryViewScreen({super.key, required this.id});

  @override
  State<StoryViewScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryViewScreen> {
  bool _isLoading = true;
  late Uri _videoUrl;
  late Story _story;

  @override
  void initState() {
    super.initState();
    _loadStory();
  }

  Future<void> _loadStory() async {
    try {
      String token = await AuthUtil.getBearerToken();
      Story story = await StoryRepository().fetchStoryById(widget.id, token);
      //
      // Uri uri = await S3Util.fetchResourceUrl(story.videoStorageKey);
      Uri uri = Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

      setState(() {
        _videoUrl = uri;
        _story = story;
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to load story: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CupertinoPageScaffold(
            backgroundColor: CupertinoColors.systemGroupedBackground,
            navigationBar: CupertinoNavigationBar(
              backgroundColor: CupertinoColors.systemGroupedBackground,
              middle: AppTitle(),
            ),
            child: Center(
                child:
                    CupertinoActivityIndicator(radius: 15, color: cBlackColor)),
          )
        : PlayerScreen(videoUrl: _videoUrl, story: _story);
  }
}
