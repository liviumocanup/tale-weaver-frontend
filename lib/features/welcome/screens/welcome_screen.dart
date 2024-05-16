import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/shared/widgets/app_title.dart';

import '../widgets/background.dart';
import '../widgets/welcome_greeting.dart';
import '../widgets/log_in_button.dart';
import '../widgets/sign_up_button.dart';

//TODO: if user logged in, don't show this screen
@RoutePage(name: 'WelcomeRoute')
class WelcomeScreen extends StatelessWidget {
  static const String mainPictureAssetPath = 'assets/images/dandelion-lute.png';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget mainPicture = Image.asset(
      mainPictureAssetPath,
      height: size.height * 0.3,
    );

    return CupertinoPageScaffold(
      child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const WelcomeGreeting(),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const AppTitle(),
            mainPicture,
            const LogInButton(),
            const SignUpButton(),
          ],
        ),
      ),
    );
  }
}
