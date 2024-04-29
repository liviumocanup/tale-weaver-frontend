import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

class CardSection extends StatelessWidget {
  final String sectionName;
  final List<Widget> cards;
  final double height;
  final EdgeInsets padding;

  const CardSection({
    super.key,
    required this.sectionName,
    required this.cards,
    required this.height,

    this.padding = const EdgeInsets.only(left: 15, right: 15, top: 25),
  });

  @override
  Widget build(BuildContext context) {
    Widget sectionText = Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(sectionName,
            style: const TextStyle(
              color: cGrayColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            )));

    Widget cardSection = cards.length == 1
        ? cards[0]
        : SizedBox(
            height: height,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) {
                // Add padding between items here
                return const SizedBox(width: 10);
              },
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return cards[index];
              },
            ),
          );

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [sectionText, cardSection],
      ),
    );
  }
}
