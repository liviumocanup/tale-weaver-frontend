import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

class OneCard extends StatelessWidget {
  final String titleText;
  final String cardTitleText;

  const OneCard({
    super.key,
    required this.titleText,
    required this.cardTitleText,
  });

  @override
  Widget build(BuildContext context) {
    Widget titleSection =
        Text(titleText, style: const TextStyle(color: cBlackColor));

    Widget cardSection = Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          // Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                "assets/images/cottage.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blur effect
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 150 * 0.3,
            // 30% of the image height
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20.0)),
              child: Container(
                color: cBlackColor.withOpacity(0.2),
              ),
            ),
          ),
          // Text
          Positioned(
            left: 10,
            right: 10,
            bottom: 150 * 0.15, // Center in the blurred area
            child: Text(
              cardTitleText,
              style: const TextStyle(
                color: cWhiteColor,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [titleSection, const SizedBox(height: 10), cardSection],
    );
  }
}
