import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

import '../one_card.dart';

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String time;
  final String imageAsset;
  final double borderRadius;
  final double blurCoverage;
  final double height;

  const SubscriptionCard({
    super.key,
    required this.title,
    required this.time,
    required this.imageAsset,
    required this.height,
    this.borderRadius = 20,
    this.blurCoverage = 1,
  });

  @override
  Widget build(BuildContext context) {
    Widget titleText = Text(
      title,
      style: const TextStyle(
        color: cAlwaysBlackColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: cAlwaysWhiteColor,
            offset: Offset(0, 0),
            blurRadius: 15,
          ),
        ],
      ),
    );

    Widget timeText = Text(
      time,
      style: const TextStyle(
        color: cAlwaysBlackColor,
        fontSize: 11,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: cAlwaysWhiteColor,
            offset: Offset(0, 0),
            blurRadius: 15,
          ),
        ],
      ),
    );

    return OneCard(
      id: '-1',
      isAsset: true,
      imageAsset: imageAsset,
      blurCoverage: blurCoverage,
      blurOpacity: 0,
      cardHeight: height,
      cardBorderRadius: borderRadius,
      cardWidth: null,
      storyCardDescription: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [titleText, timeText],
      ),
    );
  }
}
