import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/views/landing/home/components/one_card.dart';

class StoryOfTheDayCard extends StatelessWidget {
  final String title;
  final String location;
  final String description;
  final String length;
  final String imageAsset;
  final double borderRadius;
  final double blurCoverage;
  final double height;

  const StoryOfTheDayCard({
    super.key,
    required this.title,
    required this.location,
    required this.description,
    required this.length,
    required this.imageAsset,
    required this.height,
    this.borderRadius = 20,
    this.blurCoverage = 0.45,
  });

  @override
  Widget build(BuildContext context) {
    Widget titleText = Text(
      title,
      style: const TextStyle(
        color: cWhiteColor,
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    );

    Widget locationText = Text(
      location,
      style: const TextStyle(
        color: cWhiteColor,
        fontSize: 13,
        fontStyle: FontStyle.italic,
      ),
    );

    Widget descriptionText = Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Text(
          description,
          style: const TextStyle(
            height: 1.1,
            color: cWhiteColor,
            fontSize: 9,
          ),
          softWrap: true,
        ),
      ),
    );

    Widget lengthText = Text(
      length,
      style: const TextStyle(
        color: cWhiteColor,
        fontSize: 12,
      ),
    );

    Widget titleAndLocation = Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [titleText, locationText],
        ));

    Widget descriptionAndLength = Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [descriptionText, lengthText],
        ));

    return OneCard(
      imageAsset: imageAsset,
      blurCoverage: blurCoverage,
      cardHeight: height,
      cardBorderRadius: borderRadius,
      cardWidth: null,
      storyCardDescription: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [titleAndLocation, descriptionAndLength],
      ),
    );
  }
}
