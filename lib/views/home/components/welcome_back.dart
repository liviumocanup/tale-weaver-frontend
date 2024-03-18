import 'package:flutter/cupertino.dart';

Widget welcomeBackSection(Size size, {String user = "User"}) => Container(
  alignment: Alignment.centerLeft,
  child: Text(
    "Welcome Back, $user 👋",
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
);