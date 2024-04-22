import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/router/app_router.gr.dart';
import 'package:tale_weaver/shared/auth/navigation_bar.dart';
import 'package:tale_weaver/shared/auth/oauth/already_have_account.dart';
import 'package:tale_weaver/shared/auth/oauth/continue_with_section.dart';
import 'package:tale_weaver/shared/auth/oauth/divider_section.dart';
import 'package:tale_weaver/views/auth/login/components/login_form.dart';

@RoutePage(name: 'LoginRoute')
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      navigationBar: TopNavigationBar(),
      child: ListView(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: size.height * 0.05)),
              LoginForm(size: size),
              dividerSection(size),
              continueWihSection(size),
              const AlreadyHaveAnAccount(
                  isAnotherAccount: false, newPageRoute: SignUpRoute()),
            ],
          ),
        ],
      ),
    );
  }
}
