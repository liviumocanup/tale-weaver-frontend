import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/router/app_router.gr.dart';

void pushPage(BuildContext context) {
  context.router.push(const ForgotPasswordRoute());
}

Widget forgotPasswordSection(BuildContext context) => Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: CupertinoButton(
        onPressed: () => pushPage(context),
        child: const Text(
          forgotPasswordString,
          style: TextStyle(
            color: cPrimaryColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
