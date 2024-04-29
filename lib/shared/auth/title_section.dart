import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

Widget titleSection() => const Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: cPrimaryColor,
        fontSize: 25,
      ),
    );
