import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/views/auth/forgot_password/components/forgot_password_form.dart';

import '../../../shared/auth/title_section.dart';

@RoutePage(name: 'ForgotPasswordRoute')
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  Widget textHeaderSection() => const Text(
        'Trouble logging in?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      );

  Widget textExplanationSection(Size size) => Container(
        margin:
            EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1),
        child: const Text(
          "Enter your email or username and we'll send you a link to get back into your account.",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );

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
              Padding(padding: EdgeInsets.only(top: size.height * 0.15)),
              textHeaderSection(),
              const Padding(padding: EdgeInsets.only(top: 15)),
              textExplanationSection(size),
              const Padding(padding: EdgeInsets.only(top: 15)),
              ForgotPasswordForm(size: size),
            ],
          ),
        ],
      ),
    );
  }
}
