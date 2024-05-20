import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/router/app_router.gr.dart';
import 'package:tale_weaver/shared/widgets/rounded_button.dart';

import 'push_page_func.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      text: logInString,
      press: () => replaceAllPages(context, const Home()),
    );
  }
}
