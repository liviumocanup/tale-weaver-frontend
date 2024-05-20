import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/home_tab/widgets/one_card.dart';

class SmallCard extends StatelessWidget {
  final String id;
  final bool isAsset;
  final String title;
  final String location;
  final String length;
  final String imageAsset;
  final double borderRadius;
  final double blurCoverage;
  final double height;
  final double width;

  const SmallCard({
    super.key,
    required this.id,
    required this.title,
    required this.location,
    required this.length,
    required this.imageAsset,
    required this.height,
    required this.width,
    this.borderRadius = 20,
    this.blurCoverage = 0.3,
    this.isAsset = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget titleText = Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Text(
          title,
          style: const TextStyle(
            color: cAlwaysWhiteColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: cAlwaysBlackColor,
                offset: Offset(0, 0),
                blurRadius: 15,
              ),
            ],
          ),
          softWrap: true,
        ),
      ),
    );

    Widget locationText = Text(
      location,
      style: const TextStyle(
        color: cAlwaysWhiteColor,
        fontSize: 12,
        fontStyle: FontStyle.italic,
        shadows: [
          Shadow(
            color: cAlwaysBlackColor,
            offset: Offset(0, 0),
            blurRadius: 15,
          ),
        ],
      ),
    );

    Widget lengthText = Text(
      length,
      style: const TextStyle(
        color: cAlwaysWhiteColor,
        fontSize: 11,
        shadows: [
          Shadow(
            color: cAlwaysBlackColor,
            offset: Offset(0, 0),
            blurRadius: 15,
          ),
        ],
      ),
    );

    Widget locationAndLength = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [locationText, lengthText],
    );

    Widget titleAndLocation = Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [titleText, locationAndLength],
        ));

    return OneCard(
      id: id,
      isAsset: isAsset,
      imageAsset: imageAsset,
      blurCoverage: blurCoverage,
      cardHeight: height,
      cardBorderRadius: borderRadius,
      cardWidth: width,
      storyCardDescription: titleAndLocation,
    );
  }
}
