import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/router/app_router.gr.dart';
import 'package:tale_weaver/services/auth/facebook_auth_service.dart';
import 'package:tale_weaver/shared/auth/oauth/already_have_account.dart';
import 'package:tale_weaver/shared/auth/oauth/continue_with_section.dart';
import 'package:tale_weaver/shared/auth/oauth/divider_section.dart';
import 'package:tale_weaver/shared/auth/title_section.dart';
import 'package:tale_weaver/views/auth/sign_up/components/registration_form.dart';

@RoutePage(name: 'SignUpRoute')
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _facebookAuthService = FacebookAuthService();

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
              continueWihSection(size, () async {
                final token = await _facebookAuthService.loginWithFacebook();
                if (token != null) {
                  // Handle successful Facebook login here
                  print("Suc");
                } else {
                  // Handle failed login or cancellation here
                }
              }),
              AlreadyHaveAnAccount(newPageRoute: LoginRoute()),
            ],
          ),
        ],
      ),
    );
  }
}
