import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

class WelcomeBackGreeting extends StatelessWidget {
  final Size size;
  final String userName;

  const WelcomeBackGreeting({
    super.key,
    required this.size,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        '$welcomeBackString $userName 👋',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: cBlackColor,
        ),
      ),
    );
  }
}
