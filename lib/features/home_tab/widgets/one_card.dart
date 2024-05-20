import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/welcome/widgets/push_page_func.dart';
import 'package:tale_weaver/router/app_router.gr.dart';

class OneCard extends StatelessWidget {
  final String id;
  final bool isAsset;
  final String imageAsset;
  final double blurCoverage;
  final double cardHeight;
  final double? cardWidth;
  final double cardBorderRadius;
  final double blurOpacity;
  final Widget storyCardDescription;

  const OneCard({
    super.key,
    required this.id,
    required this.isAsset,
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
    Widget image = isAsset
        ? Image.asset(
            imageAsset,
            fit: BoxFit.cover,
          )
        : Image.network(
            imageAsset,
            fit: BoxFit.cover,
          );

    Widget cardImage = Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cardBorderRadius),
        child: image,
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
          color: cAlwaysBlackColor.withOpacity(blurOpacity),
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
      child: GestureDetector(
        onTap: () {
          pushPage(context, StoryViewRoute(id: id));
        },
        child: Stack(
          children: [
            cardImage,
            cardBlurredSection,
          ],
        ),
      ),
    );
  }
}
