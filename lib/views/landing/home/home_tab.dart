import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/shared/auth/title_section.dart';
import 'components/one_card.dart';
import 'components/welcome_back.dart';

class HomeTabPage extends StatelessWidget {
  const HomeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: titleSection(),
        backgroundColor: cWhiteColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.03,
            left: size.width * 0.05,
            right: size.width * 0.05),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                welcomeBackSection(size),
                const SizedBox(height: 30),
                const OneCard(
                    titleText: storyOfTheDay,
                    cardTitleText: placeholderStoryTitleString),
                const SizedBox(height: 30),
                const OneCard(
                    titleText: myLibrary,
                    cardTitleText: placeholderCardTitleString),
                const SizedBox(height: 30),
                const OneCard(
                    titleText: subscriptionSummary,
                    cardTitleText: placeholderCardTitleString),
                const SizedBox(height: 30),
                const OneCard(
                    titleText: exploreMore,
                    cardTitleText: placeholderStoryTitleString)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
