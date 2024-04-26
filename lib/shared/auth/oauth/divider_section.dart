import 'package:tale_weaver/constants.dart';
import 'package:flutter/material.dart';

Widget divider(Size size) => Expanded(
      child: Container(
        margin:
            EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1),
        child: const Divider(
          color: cSystemGrayColor,
          height: 36,
        ),
      ),
    );

Widget dividerSection(Size size) => Row(
      children: <Widget>[
        divider(size),
        const Text(orString, style: TextStyle(color: cBlackColor)),
        divider(size),
      ],
    );
