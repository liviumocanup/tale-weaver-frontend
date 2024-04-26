import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

Widget welcomeBackSection(Size size, {String user = "User"}) => Container(
      alignment: Alignment.centerLeft,
      child: Text(
        '$welcomeBackString $user 👋',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: cBlackColor,
        ),
      ),
    );
