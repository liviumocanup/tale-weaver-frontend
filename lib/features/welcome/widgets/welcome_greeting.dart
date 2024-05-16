import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

class WelcomeGreeting extends StatelessWidget {
  const WelcomeGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      welcomeString,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: cBlackColor,
      ),
    );
  }
}
