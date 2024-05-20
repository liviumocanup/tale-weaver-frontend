import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/generate_story/screens/player_screen.dart';
import 'package:tale_weaver/features/story/domain/models/story.dart';
import 'package:tale_weaver/features/story/domain/repositories/story_repository.dart';
import 'package:tale_weaver/shared/widgets/app_title.dart';
import 'package:tale_weaver/utils/auth_util.dart';
import 'package:tale_weaver/utils/s3_util.dart';

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
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _loadStory();
  }

  Future<void> _loadStory() async {
    try {
      print('Loading story with id: ${widget.id}');
      if (widget.id == '-1') {
        setState(() {
          _isLoading = false;
          _isError = true;
        });
        return;
      }
      String token = await AuthUtil.getBearerToken();
      Story story = await StoryRepository().fetchStoryById(widget.id, token);

      Uri uri = await S3Util.fetchResourceUrl(story.videoStorageKey);

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Getting the story...',
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
                backgroundColor: CupertinoColors.systemGroupedBackground,
                navigationBar: CupertinoNavigationBar(
                  backgroundColor: CupertinoColors.systemGroupedBackground,
                  middle: AppTitle(),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.xmark_circle_fill,
                          color: cGrayColor, size: 50),
                      SizedBox(height: 20),
                      Text('Failed to load the story',
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
