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
      'Welcome to,',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );

    Widget loginButton = RoundedButton(
      text: "Log in",
      press: () => pushPage(context, const LoginRoute()),
    );

    Widget signUpButton = RoundedButton(
      text: "Sign Up",
      press: () => pushPage(context, const SignUpRoute()),
      color: kPrimaryLightColor,
      textColor: CupertinoColors.black,
    );

    return CupertinoPageScaffold(
      child: Background(
        child: Container(
          padding: EdgeInsets.only(top: size.height * 0.08),
          child: ListView(
            children: [
              Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
