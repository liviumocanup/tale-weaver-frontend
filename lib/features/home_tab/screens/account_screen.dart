import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/router/app_router.gr.dart';
import 'package:tale_weaver/shared/widgets/app_title.dart';
import 'package:tale_weaver/shared/widgets/rounded_button.dart';
import 'package:tale_weaver/utils/logger.dart';

@RoutePage(name: 'AccountRoute')
class AccountScreen extends StatelessWidget {
  static const String loadingGif =
      'assets/gifs/cupertino_activity_indicator.gif';
  static const String profileImage =
      'https://source.unsplash.com/50x50/?portrait';

  const AccountScreen({super.key});

  Future<void> signOutCurrentUser() async {
    final result = await Amplify.Auth.signOut();
    if (result is CognitoCompleteSignOut) {
      AppLogger.info('Sign out completed successfully');
    } else if (result is CognitoFailedSignOut) {
      AppLogger.error('Error signing user out: ${result.exception.message}');
    }
  }

  void pushPage(BuildContext context) {
    // TODO: Wait for the delay and replace it with a loading icon
    signOutCurrentUser();
    context.router.replaceAll([const WelcomeRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    Widget logOutButton = RoundedButton(
      text: logOutString,
      press: () => pushPage(context),
    );

    Widget avatar = const CircleAvatar(
      backgroundColor: cGrayColor,
      radius: 51,
      // TODO: fetch actual profile image
      child: CircleAvatar(
          backgroundColor: cWhiteColor,
          radius: 50,
          child: ClipOval(
            child: FadeInImage(
              placeholder: AssetImage(loadingGif),
              image: NetworkImage(profileImage),
              width: 100,
              height: 100,
              placeholderFit: BoxFit.cover,
              fit: BoxFit.fill,
              fadeInDuration: Duration(milliseconds: 300),
            ),
          )),
    );

    return CupertinoPageScaffold(
      backgroundColor: cGrayBackground,
      navigationBar: const CupertinoNavigationBar(
        middle: AppTitle(),
        backgroundColor: cGrayBackground,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [avatar, const SizedBox(height: 30), logOutButton],
        ),
      ),
    );
  }
}
