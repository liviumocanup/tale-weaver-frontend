import 'package:flutter/material.dart';
import 'package:tale_weaver/views/login/components/forgot_password_section.dart';
import 'package:tale_weaver/views/login/components/rounded_input.dart';
import 'package:tale_weaver/views/login/components/rounded_input_password.dart';

Widget inputSections(Size size) => SizedBox(
  width: size.width * 0.8,
  child: Column(
    children: [
      const RoundedInput(
        iconData: Icons.person,
        text: 'Enter your username or email',
      ),
      const RoundedInputPassword(
        iconData: Icons.lock,
        text: 'Enter your password',
      ),
      Align(
        alignment: Alignment.centerRight,
        child: forgotPasswordSection(),
      ),
    ],
  ),
);