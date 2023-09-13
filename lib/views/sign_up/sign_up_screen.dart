import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/shared/continue_with_section.dart';
import 'package:tale_weaver/views/login/components/divider_section.dart';
import 'package:tale_weaver/shared/already_have_account.dart';
import 'package:tale_weaver/views/login/components/title_section.dart';
import 'package:tale_weaver/views/login/login_screen.dart';
import 'package:tale_weaver/views/sign_up/components/registration_form.dart';

class SignUpScreen extends StatelessWidget{
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
              RegistrationForm(size: size),
              dividerSection(size),
              continueWihSection(size),
              const AlreadyHaveAnAccount(newPage: LoginScreen()),
            ],
          ),
        ],
      ),
    );
  }

}