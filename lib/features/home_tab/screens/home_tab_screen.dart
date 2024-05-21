import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/story/domain/models/story_preview.dart';
import 'package:tale_weaver/features/story/domain/repositories/story_repository.dart';
import 'package:tale_weaver/utils/auth_util.dart';
import 'package:tale_weaver/utils/logger.dart';
import 'package:tale_weaver/utils/mapper.dart';
import 'package:tale_weaver/utils/s3_util.dart';

import '../widgets/collapsing_app_bar.dart';
import '../widgets/explore_more/explore_more_section.dart';
import '../widgets/library/library_section.dart';
import '../widgets/story_of_the_day/story_of_the_day_section.dart';
import '../widgets/subscription/subscription_section.dart';
import '../widgets/welcome_back.dart';

class HomeTabPage extends StatefulWidget {
  final String user;
  final double cardWidth;
  final double smallCardHeight;
  final double smallBlurCoverage;

  const HomeTabPage({
    super.key,
    required this.user,
    required this.cardWidth,
    required this.smallCardHeight,
    required this.smallBlurCoverage,
  });

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  List<Widget> _stories = [];
  bool _isLoading = true;
  bool _isError = false;

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

      await S3Util.fetchThumbnailUrls(stories);

      List<Widget> cards = mapStoryPreviewsToSmallCards(
        stories,
        widget.smallCardHeight,
        widget.smallBlurCoverage,
        widget.cardWidth,
      );

      setState(() {
        _stories = cards;
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
    Size size = MediaQuery.of(context).size;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final double blurCoverage = isLandscape ? 0.4 : 0.45;
    final double cardHeight = isLandscape ? 150 : 200;

    Widget storyOfTheDay = StoryOfTheDaySection(
      cardHeight: cardHeight,
      blurCoverage: blurCoverage,
    );

    Widget library = LibrarySection(
      cards: _stories,
      cardHeight: cardHeight,
      cardWidth: widget.cardWidth,
      smallCardHeight: widget.smallCardHeight,
      smallBlurCoverage: widget.smallBlurCoverage,
    );

    Widget subscription = SubscriptionSection(cardHeight: cardHeight);

    Widget exploreMore = ExploreMoreSection(
      cardHeight: cardHeight,
      cardWidth: widget.cardWidth,
      smallCardHeight: widget.smallCardHeight,
      smallBlurCoverage: widget.smallBlurCoverage,
    );

    return CupertinoPageScaffold(
      backgroundColor: cGrayBackground,
      child: CustomScrollView(
        slivers: [
          const CollapsingAppBar(),
          CupertinoSliverRefreshControl(
            onRefresh: _loadStories,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              switch (index) {
                case 0:
                  return WelcomeBackGreeting(size: size, userName: widget.user);
                case 2:
                  return _isLoading
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: widget.cardWidth / 2 - 10,
                              bottom: widget.cardWidth / 2 - 45),
                          child: const Column(children: [
                            Text(cLoadingLibraryInfo,
                                style: TextStyle(
                                  color: cGrayColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(height: 10),
                            CupertinoActivityIndicator(
                                radius: 15, color: cBlackColor),
                          ]),
                        )
                      : _isError
                          ? Padding(
                              padding: EdgeInsets.only(
                                  top: widget.cardWidth / 2 - 10,
                                  bottom: widget.cardWidth / 2 - 45),
                              child: const Column(children: [
                                Text(cLibraryLoadError,
                                    style: TextStyle(
                                      color: cGrayColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(height: 10),
                                Icon(CupertinoIcons.xmark_circle_fill,
                                    color: cGrayColor, size: 40),
                              ]),
                            )
                          : library;
                case 3:
                  return subscription;
                case 4:
                  return exploreMore;
                case 1:
                default:
                  return storyOfTheDay;
              }
            }, childCount: 5),
          ),
        ],
      ),
    );
  }
}
