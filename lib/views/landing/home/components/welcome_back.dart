import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

Widget welcomeBackSection(Size size, {String user = "User"}) => Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        '$welcomeBackString $user 👋',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: cBlackColor,
        ),
      ),
    );
