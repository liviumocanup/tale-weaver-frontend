import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/router/app_router.gr.dart';
import 'package:tale_weaver/shared/auth/rounded_button.dart';
import 'package:tale_weaver/shared/auth/title_section.dart';
import 'package:tale_weaver/views/auth/welcome/components/background.dart';

@RoutePage(name: 'WelcomeRoute')
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void pushPage(BuildContext context, PageRouteInfo newPageRoute) {
    context.router.push(newPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget welcomeTextSection = const Text(
      welcomeString,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: cBlackColor,
      ),
    );

    Widget loginButton = RoundedButton(
      text: logInString,
      press: () => pushPage(context, const LoginRoute()),
    );

    Widget signUpButton = RoundedButton(
      text: signUpString,
      press: () => pushPage(context, const SignUpRoute()),
      color: cPrimaryLightColor,
      textColor: cBlackColor,
    );

    return CupertinoPageScaffold(
      child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            welcomeTextSection,
            const Padding(padding: EdgeInsets.only(top: 10)),
            titleSection(),
            Image.asset(
              'assets/images/dandelion-lute.png',
              height: size.height * 0.3,
            ),
            loginButton,
            signUpButton,
          ],
        ),
      ),
    );
  }
}
