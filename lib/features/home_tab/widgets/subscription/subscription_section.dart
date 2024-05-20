import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

import '../card_section.dart';
import 'subscription_card.dart';

class SubscriptionSection extends StatelessWidget {
  final double cardHeight;

  const SubscriptionSection({super.key, required this.cardHeight});

  @override
  Widget build(BuildContext context) {
    Widget subscriptionCard = SubscriptionCard(
      title: subscriptionTitlePh,
      time: subscriptionTimePh,
      imageAsset: subscriptionImageAsset,
      height: cardHeight,
    );

    return CardSection(
      sectionName: subscriptionSummary,
      cards: [subscriptionCard],
      height: cardHeight,
    );
  }
}
