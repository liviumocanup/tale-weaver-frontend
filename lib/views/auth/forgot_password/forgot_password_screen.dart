import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/shared/auth/navigation_bar.dart';
import 'package:tale_weaver/views/auth/forgot_password/components/forgot_password_form.dart';

@RoutePage(name: 'ForgotPasswordRoute')
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  Widget textHeaderSection() => const Text(
        forgotPasswordHeaderString,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: cBlackColor,
        ),
      );

  Widget textExplanationSection(Size size) => Container(
        margin:
            EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1),
        child: const Text(
          forgotPasswordDescriptionString,
          style: TextStyle(
            fontSize: 20,
            color: cBlackColor,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      navigationBar: TopNavigationBar(),
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
