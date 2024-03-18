import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/router/app_router.gr.dart';
import 'package:tale_weaver/shared/auth/oauth/already_have_account.dart';
import 'package:tale_weaver/shared/auth/oauth/continue_with_section.dart';
import 'package:tale_weaver/shared/auth/oauth/divider_section.dart';
import 'package:tale_weaver/shared/auth/title_section.dart';
import 'package:tale_weaver/views/auth/sign_up/components/registration_form.dart';

@RoutePage(name: 'SignUpRoute')
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: titleSection(),
        backgroundColor: CupertinoColors.white,
      ),
      child: ListView(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: size.height * 0.05)),
              RegistrationForm(size: size),
              dividerSection(size),
              continueWihSection(size),
              AlreadyHaveAnAccount(newPageRoute: LoginRoute()),
            ],
          ),
        ],
      ),
    );
  }
}
