import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/views/landing/home/components/one_card.dart';

class SmallCard extends StatelessWidget {
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
    required this.title,
    required this.location,
    required this.length,
    required this.imageAsset,
    required this.height,
    required this.width,
    this.borderRadius = 20,
    this.blurCoverage = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    // Widget titleText = Text(
    //   title,
    //   style: const TextStyle(
    //     color: cWhiteColor,
    //     fontSize: 13,
    //     fontWeight: FontWeight.bold,
    //   ),
    // );

    Widget titleText = Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Text(
          title,
          style: const TextStyle(
            color: cWhiteColor,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
          softWrap: true,
        ),
      ),
    );

    Widget locationText = Text(
      location,
      style: const TextStyle(
        color: cWhiteColor,
        fontSize: 12,
        fontStyle: FontStyle.italic,
      ),
    );

    Widget lengthText = Text(
      length,
      style: const TextStyle(
        color: cWhiteColor,
        fontSize: 11,
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
      imageAsset: imageAsset,
      blurCoverage: blurCoverage,
      cardHeight: height,
      cardBorderRadius: borderRadius,
      cardWidth: width,
      storyCardDescription: titleAndLocation,
    );
  }
}
