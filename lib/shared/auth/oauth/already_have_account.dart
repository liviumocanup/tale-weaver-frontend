import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final bool isAnotherAccount;
  final PageRouteInfo newPageRoute;

  const AlreadyHaveAnAccount({
    super.key,
    this.isAnotherAccount = true,
    required this.newPageRoute,
  });

  void pushPage(BuildContext context) {
    context.router.replace(newPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    String text, action;

    if (isAnotherAccount) {
      text = alreadyHaveAccountString;
      action = '$logInString.';
    } else {
      text = haveNoAccountString;
      action = '$signUpString.';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: const TextStyle(color: cBlackColor)),
        CupertinoButton(
          onPressed: () => pushPage(context),
          child: Text(
            action,
            style: const TextStyle(
              color: cPrimaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
