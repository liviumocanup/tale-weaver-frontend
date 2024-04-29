import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

class OneCard extends StatelessWidget {
  final String imageAsset;
  final double blurCoverage;
  final double cardHeight;
  final double? cardWidth;
  final double cardBorderRadius;
  final double blurOpacity;
  final Widget storyCardDescription;

  const OneCard({
    super.key,
    required this.imageAsset,
    required this.blurCoverage,
    required this.cardHeight,
    required this.cardWidth,
    required this.cardBorderRadius,
    required this.storyCardDescription,
    this.blurOpacity = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    Widget cardImage = Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cardBorderRadius),
        child: Image.asset(
          imageAsset,
          fit: BoxFit.cover,
        ),
      ),
    );

    Widget cardBlurredSection = Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: cardHeight * blurCoverage,
      child: ClipRRect(
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(cardBorderRadius)),
        child: Container(
          color: cBlackColor.withOpacity(blurOpacity),
          child: storyCardDescription,
        ),
      ),
    );

    return Container(
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
      child: Stack(
        children: [
          cardImage,
          cardBlurredSection,
        ],
      ),
    );
  }
}
