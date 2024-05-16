import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/home_tab/widgets/card_section.dart';

import '../small_card.dart';

class LibrarySection extends StatelessWidget {
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
  Widget build(BuildContext context) {
    // TODO: The number will not be known
    Widget smallCard1 = SmallCard(
      title: story1Title,
      location: story1Location,
      length: story1Length,
      imageAsset: story1ImageAsset,
      height: smallCardHeight,
      blurCoverage: smallBlurCoverage,
      width: cardWidth,
    );

    Widget smallCard2 = SmallCard(
      title: story2Title,
      location: story2Location,
      length: story2Length,
      imageAsset: story2ImageAsset,
      height: smallCardHeight,
      blurCoverage: smallBlurCoverage,
      width: cardWidth,
    );

    Widget smallCard3 = SmallCard(
      title: story3Title,
      location: story3Location,
      length: story3Length,
      imageAsset: story3ImageAsset,
      height: smallCardHeight,
      blurCoverage: smallBlurCoverage,
      width: cardWidth,
    );

    return CardSection(
      sectionName: myLibrary,
      cards: [smallCard1, smallCard2, smallCard3],
      height: cardHeight,
      padding: const EdgeInsets.only(left: 15, top: 25),
    );
  }
}
