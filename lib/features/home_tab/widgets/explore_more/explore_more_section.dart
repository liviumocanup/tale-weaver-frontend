import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

import '../card_section.dart';
import '../small_card.dart';

class ExploreMoreSection extends StatelessWidget {
  // TODO: The number will not be known
  final double cardHeight;
  final double cardWidth;
  final double smallCardHeight;
  final double smallBlurCoverage;

  const ExploreMoreSection({
    super.key,
    required this.cardHeight,
    required this.cardWidth,
    required this.smallCardHeight,
    required this.smallBlurCoverage,
  });

  @override
  Widget build(BuildContext context) {
    Widget exploreCard1 = SmallCard(
      id: '-1',
      isAsset: true,
      title: explore1Title,
      location: explore1Location,
      length: explore1Length,
      imageAsset: explore1ImageAsset,
      height: smallCardHeight,
      blurCoverage: smallBlurCoverage,
      width: cardWidth,
    );

    Widget exploreCard2 = SmallCard(
      id: '-1',
      isAsset: true,
      title: explore2Title,
      location: explore2Location,
      length: explore2Length,
      imageAsset: explore2ImageAsset,
      height: smallCardHeight,
      blurCoverage: smallBlurCoverage,
      width: cardWidth,
    );

    Widget exploreCard3 = SmallCard(
      id: '-1',
      isAsset: true,
      title: explore3Title,
      location: explore3Location,
      length: explore3Length,
      imageAsset: explore3ImageAsset,
      height: smallCardHeight,
      blurCoverage: smallBlurCoverage,
      width: cardWidth,
    );

    return CardSection(
      sectionName: exploreMore,
      cards: [exploreCard1, exploreCard2, exploreCard3],
      height: cardHeight,
    );
  }
}
