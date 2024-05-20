import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/story/domain/models/story_preview.dart';
import 'package:tale_weaver/features/story/domain/repositories/story_repository.dart';
import 'package:tale_weaver/features/welcome/widgets/push_page_func.dart';
import 'package:tale_weaver/router/app_router.gr.dart';
import 'package:tale_weaver/utils/auth_util.dart';
import 'package:tale_weaver/utils/fetch_thumbnails.dart';
import 'package:tale_weaver/utils/s3_util.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool _isLoading = true;
  List<StoryPreview> stories = [];
  late String _videoUrl;

  @override
  void initState() {
    super.initState();
    _loadStories();
  }

  Future<void> _loadStories() async {
    try {
      setState(() {
        _isLoading = true;
      });
      String token = await AuthUtil.getBearerToken();
      List<StoryPreview> stories = await StoryRepository().fetchStories(token);

      await fetchThumbnailUrls(stories);

      setState(() {
        this.stories = stories;
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to load story or image: $e');
    }
  }

  Future<void> _fetchStoryUrl(String storyId) async {
    try {
      String token = await AuthUtil.getBearerToken();
      var story = await StoryRepository().fetchStoryById(storyId, token);

      Uri uri = await S3Util.fetchResourceUrl(story.videoStorageKey);

      setState(() {
        _videoUrl = uri.toString();
      });
    } catch (e) {
      print('Failed to fetch story url: $e');
    }
  }

  Future<void> _deleteStory(String storyId) async {
    try {
      String token = await AuthUtil.getBearerToken();
      await StoryRepository().deleteStory(storyId, token);

      _loadStories();
    } catch (e) {
      print('Failed to load story or image: $e');
    }
  }

  void _showConfirmationDialog(BuildContext context, storyId) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Delete this Story?'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text('Delete'),
              onPressed: () {
                Navigator.pop(context);
                _deleteStory(storyId);
              },
            ),
          ],
        );
      },
    );
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: cBlackColor,
      textColor: cWhiteColor,
      fontSize: 16.0,
    );
  }

  void _showActionSheet(BuildContext context, String storyId) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: const Row(
              children: [
                SizedBox(width: 10),
                Icon(CupertinoIcons.share),
                SizedBox(width: 30),
                Text('Share'),
              ],
            ),
            onPressed: () async {
              await _fetchStoryUrl(storyId);
              await Clipboard.setData(ClipboardData(text: _videoUrl));
              Navigator.pop(context);
              _showToast('Story URL copied to clipboard');
            },
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            child: const Row(
              children: [
                SizedBox(width: 10),
                Icon(CupertinoIcons.delete),
                SizedBox(width: 30),
                Text('Remove'),
              ],
            ),
            onPressed: () {
              Navigator.pop(context);
              _showConfirmationDialog(context, storyId);
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: cGrayBackground,
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            backgroundColor: cGrayBackground,
            largeTitle: Text('Your Stories'),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(CupertinoIcons.search, size: 27),
              SizedBox(width: 12),
              Icon(CupertinoIcons.gear, size: 27),
            ]),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: _loadStories,
          ),
          _isLoading
              ? const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Your Library is loading...',
                            style: TextStyle(
                              color: cGrayColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 10),
                        CupertinoActivityIndicator(
                            radius: 15, color: cBlackColor),
                      ],
                    ),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return GestureDetector(
                      onTap: () {
                        pushPage(
                            context, StoryViewRoute(id: stories[index].id));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 18),
                                  height: 100,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          stories[index].thumbnailUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, top: 5),
                                        child: Text(stories[index].title)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12, top: 8),
                                      child: Text(stories[index].timeAgo,
                                          style: const TextStyle(
                                              color: cGrayColor, fontSize: 14)),
                                    ),
                                    // const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          child: const Icon(
                                            CupertinoIcons.hand_thumbsup,
                                            color: cGrayColor,
                                            size: 18,
                                          ),
                                          onPressed: () {},
                                        ),
                                        const Text("0",
                                            style: TextStyle(
                                                color: cGrayColor,
                                                fontSize: 14)),
                                        CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          child: const Icon(
                                            CupertinoIcons.chat_bubble_2,
                                            color: cGrayColor,
                                            size: 20,
                                          ),
                                          onPressed: () {},
                                        ),
                                        const Text("0",
                                            style: TextStyle(
                                                color: cGrayColor,
                                                fontSize: 14)),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                CupertinoIcons.ellipsis_vertical,
                                color: cBlackColor,
                                size: 18,
                              ),
                              onPressed: () {
                                _showActionSheet(context, stories[index].id);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }, childCount: stories.length),
                ),
        ],
      ),
    );
  }
}
