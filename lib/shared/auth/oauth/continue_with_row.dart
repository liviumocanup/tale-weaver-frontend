import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

Widget continueWith(String assetPath, Size size, Function onTap) =>
    GestureDetector(
      onTap: () => onTap(),
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: cPrimaryLightColor,
            ),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            assetPath,
            height: size.height * 0.08,
            width: size.width * 0.08,
          )),
    );
