import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/home_tab/widgets/card_section.dart';

import 'story_of_the_day_card.dart';

class StoryOfTheDaySection extends StatelessWidget {
  final double cardHeight;
  final double blurCoverage;

  const StoryOfTheDaySection({
    super.key,
    required this.cardHeight,
    required this.blurCoverage,
  });

  @override
  Widget build(BuildContext context) {
    Widget storyOfTheDayCard = StoryOfTheDayCard(
      title: sotdTitlePh,
      location: sotdLocationPh,
      description: sotdDescriptionPh,
      length: sotdLengthPh,
      imageAsset: sotdImageAssetPh,
      height: cardHeight,
      blurCoverage: blurCoverage,
    );

    return CardSection(
      sectionName: storyOfTheDay,
      cards: [storyOfTheDayCard],
      height: cardHeight,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
    );
  }
}
