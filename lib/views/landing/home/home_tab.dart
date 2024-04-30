import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/views/landing/home/components/card_section.dart';
import 'package:tale_weaver/views/landing/home/components/small_card.dart';
import 'package:tale_weaver/views/landing/home/components/story_of_the_day_card.dart';
import 'package:tale_weaver/views/landing/home/components/subscription_card.dart';
import 'components/welcome_back.dart';

class HomeTabPage extends StatelessWidget {
  final String user;

  const HomeTabPage({super.key, this.user = 'Liviu'});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final double blurCoverage = isLandscape ? 0.4 : 0.45;
    final double smallBlurCoverage = isLandscape ? 0.4 : 0.4;
    final double cardHeight = isLandscape ? 150 : 200;
    final double smallCardHeight = isLandscape ? 150 : 170;
    final double cardWidth =
        isLandscape ? size.width * 0.35 : size.width * 0.45;

    Widget storyOfTheDayCard = StoryOfTheDayCard(
      title: sotdTitlePh,
      location: sotdLocationPh,
      description: sotdDescriptionPh,
      length: sotdLengthPh,
      imageAsset: sotdImageAssetPh,
      height: cardHeight,
      blurCoverage: blurCoverage,
    );

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

    Widget subscriptionCard = SubscriptionCard(
      title: subscriptionTitlePh,
      time: subscriptionTimePh,
      imageAsset: subscriptionImageAsset,
      height: cardHeight,
    );

    Widget exploreCard1 = SmallCard(
      title: explore1Title,
      location: explore1Location,
      length: explore1Length,
      imageAsset: explore1ImageAsset,
      height: smallCardHeight,
      blurCoverage: smallBlurCoverage,
      width: cardWidth,
    );

    Widget exploreCard2 = SmallCard(
      title: explore2Title,
      location: explore2Location,
      length: explore2Length,
      imageAsset: explore2ImageAsset,
      height: smallCardHeight,
      blurCoverage: smallBlurCoverage,
      width: cardWidth,
    );

    Widget exploreCard3 = SmallCard(
      title: explore3Title,
      location: explore3Location,
      length: explore3Length,
      imageAsset: explore3ImageAsset,
      height: smallCardHeight,
      blurCoverage: smallBlurCoverage,
      width: cardWidth,
    );

    Widget storyOfTheDaySection = CardSection(
      sectionName: storyOfTheDay,
      cards: [storyOfTheDayCard],
      height: cardHeight,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
    );

    Widget myLibrarySection = CardSection(
      sectionName: myLibrary,
      cards: [smallCard1, smallCard2, smallCard3],
      height: cardHeight,
      padding: const EdgeInsets.only(left: 15, top: 25),
    );

    Widget subscriptionSection = CardSection(
      sectionName: subscriptionSummary,
      cards: [subscriptionCard],
      height: cardHeight,
    );

    Widget exploreSection = CardSection(
      sectionName: exploreMore,
      cards: [exploreCard1, exploreCard2, exploreCard3],
      height: cardHeight,
    );

    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          welcomeBackSection(size, user: user),
          // const SizedBox(height: 15),
          storyOfTheDaySection,
          // const SizedBox(height: 25),
          myLibrarySection,
          // const SizedBox(height: 25),
          subscriptionSection,
          // const SizedBox(height: 25),
          exploreSection
        ],
      ),
    );
  }
}
