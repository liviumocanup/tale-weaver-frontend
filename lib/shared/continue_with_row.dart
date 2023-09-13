import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';

Widget continueWith(String iconAsset, Size size) => GestureDetector(
  onTap: () {},
  child: Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: kPrimaryLightColor,
      ),
      shape: BoxShape.circle,
    ),
    child: Image.asset(
      iconAsset,
      height: size.height*0.08,
      width: size.width*0.08,
    )
  ),
);