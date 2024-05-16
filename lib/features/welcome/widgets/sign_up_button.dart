import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/router/app_router.gr.dart';
import 'package:tale_weaver/shared/widgets/rounded_button.dart';

import 'push_page_func.dart';

class SignUpButton extends StatelessWidget {
  // TODO: Call save_user endpoint
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      text: signUpString,
      press: () => replaceAllPages(context, const Home()),
      color: cPrimaryLightColor,
      textColor: cBlackColor,
    );
  }
}
