import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';

class AlreadyHaveAnAccount extends StatelessWidget{
  final bool isAnotherAccount;
  final Widget newPage;

  const AlreadyHaveAnAccount({
    super.key,
    this.isAnotherAccount = true,
    required this.newPage,
  });

  void pushPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => newPage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String text, action;

    if(isAnotherAccount){
      text = "Already have an account?";
      action = "Log In.";
    } else {
      text = "Don't have an account yet?";
      action = "Sign Up.";
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
          onPressed: () => pushPage(context),
          child: Text(
            action,
            style: const TextStyle(
              color: kPrimaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

}