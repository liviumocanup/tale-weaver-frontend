import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';

Widget forgotPasswordSection() => Padding(
  padding: const EdgeInsets.only(bottom: 20),
  child: TextButton(
    onPressed: () {},
    child: const Text(
      'Forgot your password?',
      style: TextStyle(
        color: kPrimaryColor,
        decoration: TextDecoration.underline,
      ),
    ),
  ),
);