import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/views/landing/home/components/one_card_section.dart';
import 'components/welcome_back.dart';

class HomeTabPage extends StatelessWidget {
  const HomeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            welcomeBackSection(size),
            const SizedBox(height: 15),
            const OneCardSection(
                sectionName: storyOfTheDay,
                cardTitleText: placeholderStoryTitleString),
            const SizedBox(height: 25),
            const OneCardSection(
                sectionName: myLibrary,
                cardTitleText: placeholderCardTitleString),
            const SizedBox(height: 25),
            const OneCardSection(
                sectionName: subscriptionSummary,
                cardTitleText: placeholderCardTitleString),
            const SizedBox(height: 25),
            const OneCardSection(
                sectionName: exploreMore,
                cardTitleText: placeholderStoryTitleString)
          ],
        ),
      ),
    );
  }
}
