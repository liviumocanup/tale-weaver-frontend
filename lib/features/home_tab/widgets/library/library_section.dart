import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/home_tab/widgets/card_section.dart';

class LibrarySection extends StatelessWidget {
  final List<Widget> cards;
  final double cardHeight;
  final double cardWidth;
  final double smallCardHeight;
  final double smallBlurCoverage;

  const LibrarySection({
    super.key,
    required this.cards,
    required this.cardHeight,
    required this.cardWidth,
    required this.smallCardHeight,
    required this.smallBlurCoverage,
  });

  @override
  Widget build(BuildContext context) {
    return CardSection(
      sectionName: myLibrary,
      cards: cards,
      height: cardHeight,
      padding: const EdgeInsets.only(left: 15, top: 25),
    );
  }
}
