import 'package:flutter/material.dart';

Widget dividerSection(Size size) => Row(
  children: <Widget>[
    Expanded(
      child: Container(
        margin: EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.05),
        child: const Divider(
          color: Colors.grey,
          height: 36,
        ),
      ),
    ),
    const Text("OR"),
    Expanded(
      child: Container(
        margin: EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.1),
        child: const Divider(
          color: Colors.grey,
          height: 36,
        ),
      ),
    ),
  ],
);