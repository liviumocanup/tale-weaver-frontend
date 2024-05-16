import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/features/home_tab/widgets/explore_more/explore_more_section.dart';
import 'package:tale_weaver/features/home_tab/widgets/library/library_section.dart';
import 'package:tale_weaver/features/home_tab/widgets/story_of_the_day/story_of_the_day_section.dart';
import 'package:tale_weaver/features/home_tab/widgets/subscription/subscription_section.dart';
import 'package:tale_weaver/features/home_tab/widgets/collapsing_app_bar.dart';
import '../widgets/welcome_back.dart';

class HomeTabPage extends StatelessWidget {
  final String user;

  const HomeTabPage({super.key, required this.user});

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

    Widget storyOfTheDay = StoryOfTheDaySection(
      cardHeight: cardHeight,
      blurCoverage: blurCoverage,
    );

    Widget library = LibrarySection(
      cardHeight: cardHeight,
      cardWidth: cardWidth,
      smallCardHeight: smallCardHeight,
      smallBlurCoverage: smallBlurCoverage,
    );

    Widget subscription = SubscriptionSection(cardHeight: cardHeight);

    Widget exploreMore = ExploreMoreSection(
      cardHeight: cardHeight,
      cardWidth: cardWidth,
      smallCardHeight: smallCardHeight,
      smallBlurCoverage: smallBlurCoverage,
    );

    return CustomScrollView(
      slivers: [
        const CollapsingAppBar(),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            switch (index) {
              case 0:
                return WelcomeBackGreeting(size: size, userName: user);
              case 2:
                return library;
              case 3:
                return subscription;
              case 4:
                return exploreMore;
              case 1:
              default:
                return storyOfTheDay;
            }
          }, childCount: 5),
        ),
      ],
    );
  }
}
