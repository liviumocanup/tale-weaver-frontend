import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/shared/continue_with_section.dart';
import 'package:tale_weaver/views/login/components/divider_section.dart';
import 'package:tale_weaver/shared/already_have_account.dart';
import 'package:tale_weaver/views/login/components/input_sections.dart';
import 'package:tale_weaver/views/login/components/title_section.dart';
import 'package:tale_weaver/shared/rounded_button.dart';
import 'package:tale_weaver/views/sign_up/sign_up_screen.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget loginButton = Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: RoundedButton(color: kPrimaryColor, text: 'Log in', press: (){})
    );

    return Scaffold(
      appBar: AppBar(
        title: titleSection(),
        iconTheme: const IconThemeData(
          color: kPrimaryColor,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: size.height*0.05)),
              inputSections(size),
              loginButton,
              dividerSection(size),
              continueWihSection(size),
              const AlreadyHaveAnAccount(isAnotherAccount: false, newPage: SignUpScreen()),
            ],
          ),
        ],
      ),
    );
  }

}