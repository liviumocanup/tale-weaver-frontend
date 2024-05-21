import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/features/home_tab/widgets/small_card.dart';
import 'package:tale_weaver/features/story/domain/models/story_preview.dart';

List<Widget> mapStoryPreviewsToSmallCards(
  List<StoryPreview> storyPreviews,
  double smallCardHeight,
  double smallBlurCoverage,
  double cardWidth,
) {
  return storyPreviews.map((story) {
    return SmallCard(
      id: story.id,
      title: story.title,
      imageAsset: story.thumbnailUrl,
      height: smallCardHeight,
      blurCoverage: smallBlurCoverage,
      width: cardWidth,
      location: story.timeAgo,
      length: '',
    );
  }).toList();
}
