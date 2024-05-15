import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tale_weaver/router/app_router.gr.dart';
import 'package:tale_weaver/shared/auth/navigation_bar.dart';
import 'package:tale_weaver/shared/auth/rounded_button.dart';

@RoutePage(name: 'AccountRoute')
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  Future<void> signOutCurrentUser() async {
    final result = await Amplify.Auth.signOut();
    if (result is CognitoCompleteSignOut) {
      safePrint('Sign out completed successfully');
    } else if (result is CognitoFailedSignOut) {
      safePrint('Error signing user out: ${result.exception.message}');
    }
  }

  void pushPage(BuildContext context) {
    // TODO: Wait for the delay and replace it with a loading icon
    signOutCurrentUser();
    context.router.replaceAll([const WelcomeRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    Widget logOutButton =
        // TODO: return either rounded button or loading icon if tapped
        RoundedButton(text: "Log Out", press: () => pushPage(context));

    Widget avatar = const CircleAvatar(
        radius: 50,
        backgroundImage:
            NetworkImage('https://source.unsplash.com/50x50/?portrait'));

    return CupertinoPageScaffold(
      navigationBar: TopNavigationBar(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [avatar, const SizedBox(height: 30), logOutButton],
        ),
      ),
    );
  }
}
