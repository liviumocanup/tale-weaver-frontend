import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/home_tab/widgets/card_section.dart';
import 'package:tale_weaver/features/story/domain/models/story_preview.dart';
import 'package:tale_weaver/features/story/domain/repositories/story_repository.dart';
import 'package:tale_weaver/utils/auth_util.dart';
import 'package:tale_weaver/utils/fetch_thumbnails.dart';
import 'package:tale_weaver/utils/mapper.dart';

class LibrarySection extends StatefulWidget {
  final double cardHeight;
  final double cardWidth;
  final double smallCardHeight;
  final double smallBlurCoverage;

  const LibrarySection({
    super.key,
    required this.cardHeight,
    required this.cardWidth,
    required this.smallCardHeight,
    required this.smallBlurCoverage,
  });

  @override
  State<LibrarySection> createState() => _LibrarySectionState();
}

class _LibrarySectionState extends State<LibrarySection> {
  bool _isLoading = true;
  List<Widget> stories = [];

  @override
  void initState() {
    super.initState();
    _loadStories();
  }

  Future<void> _loadStories() async {
    try {
      String token = await AuthUtil.getBearerToken();
      List<StoryPreview> stories = await StoryRepository().fetchStories(token);

      await fetchThumbnailUrls(stories);

      List<Widget> cards = mapStoryPreviewsToSmallCards(
        stories,
        widget.smallCardHeight,
        widget.smallBlurCoverage,
        widget.cardWidth,
      );

      setState(() {
        this.stories = cards;
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to load story or image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CupertinoActivityIndicator(radius: 15, color: cBlackColor)
        : CardSection(
            sectionName: myLibrary,
            cards: stories,
            height: widget.cardHeight,
            padding: const EdgeInsets.only(left: 15, top: 25),
          );
  }
}
